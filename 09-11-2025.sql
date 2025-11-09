-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 09-Nov-2025 às 21:11
-- Versão do servidor: 9.1.0
-- versão do PHP: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sgeo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `audits`
--

DROP TABLE IF EXISTS `audits`;
CREATE TABLE IF NOT EXISTS `audits` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint UNSIGNED NOT NULL,
  `old_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"password\":\"$2y$12$G4WjReLvNRdbrsKhl\\/1a6.4Kp\\/1v.zAP7NB\\/Hfgk9a9v7xtPDvEC2\"}', '{\"password\":\"$2y$12$Zp\\/l7kh\\/Ve203l8qgXn6nexVYn1bG6AgkbhWOOfgfuhbOApKadqNO\"}', 'http://127.0.0.1:8000/update-profile-password', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', NULL, '2025-03-13 10:22:04', '2025-03-13 10:22:04'),
(2, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 4, '{\"password\":\"$2y$12$Y588F0ltDJzSEbQA.ayUreiHl8MuHmF4\\/SYY\\/nhm6kCBFt1htRpc2\"}', '{\"password\":\"$2y$12$CYmQjqWs\\/y4xKsoQjGQQX.kma9O5fm91wqIF0wSaYlZ5d9mZqkC1S\"}', 'http://127.0.0.1:8000/update-user-password/4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, '2025-09-15 10:46:26', '2025-09-15 10:46:26'),
(3, 'App\\Models\\User', 4, 'updated', 'App\\Models\\User', 4, '{\"password\":\"$2y$12$CYmQjqWs\\/y4xKsoQjGQQX.kma9O5fm91wqIF0wSaYlZ5d9mZqkC1S\"}', '{\"password\":\"$2y$12$MAquOw497fDfNI4K4lDzRemMtMLexbIKdMxUQSa3XYhB1eFXilMee\"}', 'http://127.0.0.1:8000/update-user-password/4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, '2025-09-24 14:57:08', '2025-09-24 14:57:08'),
(4, 'App\\Models\\User', 4, 'updated', 'App\\Models\\User', 4, '{\"name\":\"Gabrielly\",\"email\":\"gabrielly@test.com\"}', '{\"name\":\"Aud\\u00e1cio\",\"email\":\"audacio@test.com\"}', 'http://127.0.0.1:8000/update-user/4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, '2025-09-25 08:39:16', '2025-09-25 08:39:16'),
(5, 'App\\Models\\User', 4, 'updated', 'App\\Models\\User', 4, '{\"name\":\"Aud\\u00e1cio\"}', '{\"name\":\"Aud\\u00e1cio Fernando\"}', 'http://127.0.0.1:8000/update-user/4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', NULL, '2025-09-25 08:47:23', '2025-09-25 08:47:23'),
(6, 'App\\Models\\User', 4, 'updated', 'App\\Models\\User', 4, '{\"name\":\"Aud\\u00e1cio Fernando\"}', '{\"name\":\"Aud\\u00e1cio Jorge Fernando\"}', 'http://127.0.0.1:8000/update-profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36 Edg/140.0.0.0', NULL, '2025-09-25 15:30:03', '2025-09-25 15:30:03'),
(7, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"password\":\"$2y$12$Zp\\/l7kh\\/Ve203l8qgXn6nexVYn1bG6AgkbhWOOfgfuhbOApKadqNO\"}', '{\"password\":\"$2y$12$QaqNY1Q5iLEWXrdsoM4sbujUgoY3.oWAuW4LBTkOt1V2nyLdd0Il6\"}', 'http://127.0.0.1:8000/update-profile-password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-10-09 11:05:29', '2025-10-09 11:05:29'),
(8, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 6, '[]', '{\"name\":\"Rufino Manuel Crist\\u00f3v\\u00e3o da Concei\\u00e7\\u00e3o\",\"email\":\"rufino@gmail.com\",\"password\":\"$2y$12$CzJQrHqSo5w7CQzFf4O.oev3DmIQ5kKBNxNzSXqTnYJDxbBzHZm9O\",\"id\":6}', 'http://127.0.0.1:8000/store-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-10-13 07:56:18', '2025-10-13 07:56:18'),
(9, 'App\\Models\\User', 6, 'updated', 'App\\Models\\User', 6, '{\"name\":\"Rufino Manuel Crist\\u00f3v\\u00e3o da Concei\\u00e7\\u00e3o\"}', '{\"name\":\"Rufino da Concei\\u00e7\\u00e3o\"}', 'http://127.0.0.1:8000/update-profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-10-13 07:57:46', '2025-10-13 07:57:46'),
(10, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 2, '{\"password\":\"$2y$12$42epjsOp25hssjiprgI8oOOnCr\\/LiEZ09grEvO6x6k6Gl\\/r1HqFgq\"}', '{\"password\":\"$2y$12$aNVfwv0dgus9m7qRCjaqJ.ibxhcaQoVxhpll92AsYnrA0ItxqeJt2\"}', 'http://127.0.0.1:8000/update-user-password/2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 11:48:44', '2025-11-03 11:48:44'),
(11, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 5, '{\"name\":\"Marcos\",\"email\":\"marcos@test.com\"}', '{\"name\":\"Raimundo Jiko\",\"email\":\"raimundojiko@gmail.com\"}', 'http://127.0.0.1:8000/update-user/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 13:39:16', '2025-11-03 13:39:16'),
(12, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 5, '{\"password\":\"$2y$12$mmQ.uU7W4fZ8qOP33vHO3esAuPt8viov\\/YszmC3Qf7jx.NVDV4TMW\"}', '{\"password\":\"$2y$12$g\\/ez6.64pKRTOqLal7X8J.kJ9caEPRot3kIgzdc7yNIanH.Qm0Q3i\"}', 'http://127.0.0.1:8000/update-user-password/5', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 13:39:44', '2025-11-03 13:39:44'),
(13, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 3, '{\"id\":3,\"name\":\"Jessica\",\"email\":\"jessica@test.com\",\"email_verified_at\":null,\"password\":\"$2y$12$cBzOwvGpA2I6UQcZsfLXo.BOzTy8u95GjJ0GVwgO4gCnLagknGc6a\",\"remember_token\":null}', '[]', 'http://127.0.0.1:8000/destroy-user/3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 13:40:31', '2025-11-03 13:40:31'),
(14, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 7, '[]', '{\"name\":\"myself\",\"email\":\"felixj.baptista@hotmail.com\",\"password\":\"$2y$12$3k29I55Cv6HBw7kAJybQ2Oy4UrQs2wlyknLOlrvKdKGBQ31vZXk8q\",\"id\":7}', 'http://127.0.0.1:8000/store-user', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 16:11:15', '2025-11-03 16:11:15'),
(15, NULL, NULL, 'updated', 'App\\Models\\User', 7, '{\"password\":\"$2y$12$3k29I55Cv6HBw7kAJybQ2Oy4UrQs2wlyknLOlrvKdKGBQ31vZXk8q\"}', '{\"password\":\"$2y$12$X8PDtioor\\/Fv3PUI41zvQ.s6LqIPsuM8l0z6VYVR9apKSRsNghce.\"}', 'http://127.0.0.1:8000/reset-password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 16:55:37', '2025-11-03 16:55:37'),
(16, 'App\\Models\\User', 7, 'updated', 'App\\Models\\User', 7, '{\"email\":\"felixj.baptista@hotmail.com\"}', '{\"email\":\"felixjamba21@gmail.com\"}', 'http://127.0.0.1:8000/update-profile', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 17:36:56', '2025-11-03 17:36:56'),
(17, NULL, NULL, 'updated', 'App\\Models\\User', 7, '{\"password\":\"$2y$12$X8PDtioor\\/Fv3PUI41zvQ.s6LqIPsuM8l0z6VYVR9apKSRsNghce.\"}', '{\"password\":\"$2y$12$J4kzS\\/6vaWJcAMrBgLoQve1Moq.cpe\\/EztPUxuQr3kGH9NMRYSunS\"}', 'http://127.0.0.1:8000/reset-password', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 17:41:14', '2025-11-03 17:41:14'),
(18, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 7, '{\"id\":7,\"name\":\"myself\",\"email\":\"felixjamba21@gmail.com\",\"email_verified_at\":null,\"password\":\"$2y$12$J4kzS\\/6vaWJcAMrBgLoQve1Moq.cpe\\/EztPUxuQr3kGH9NMRYSunS\",\"remember_token\":null}', '[]', 'http://127.0.0.1:8000/destroy-user/7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', NULL, '2025-11-03 18:03:10', '2025-11-03 18:03:10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bairro`
--

DROP TABLE IF EXISTS `bairro`;
CREATE TABLE IF NOT EXISTS `bairro` (
  `idbairro` int NOT NULL AUTO_INCREMENT,
  `bairro` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idzona` int DEFAULT NULL,
  `tipo_bairro` enum('B','S') DEFAULT NULL,
  PRIMARY KEY (`idbairro`),
  KEY `fk_zona` (`idzona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `bairro`
--

INSERT INTO `bairro` (`idbairro`, `bairro`, `idzona`, `tipo_bairro`) VALUES
(1, 'Benvindo', 1, 'B');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:5:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:5:\"title\";s:1:\"c\";s:4:\"name\";s:1:\"d\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:38:{i:0;a:5:{s:1:\"a\";i:1;s:1:\"b\";s:16:\"Listar usuários\";s:1:\"c\";s:10:\"index-user\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:3;}}i:1;a:5:{s:1:\"a\";i:2;s:1:\"b\";s:19:\"Visualizar usuário\";s:1:\"c\";s:9:\"show-user\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:2;a:5:{s:1:\"a\";i:3;s:1:\"b\";s:18:\"Cadastrar usuário\";s:1:\"c\";s:11:\"create-user\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:3;a:5:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"Editar usuário\";s:1:\"c\";s:9:\"edit-user\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:2;i:1;i:4;}}i:4;a:5:{s:1:\"a\";i:5;s:1:\"b\";s:24:\"Editar senha do usuário\";s:1:\"c\";s:18:\"edit-user-password\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:5;a:5:{s:1:\"a\";i:6;s:1:\"b\";s:15:\"Apagar usuário\";s:1:\"c\";s:12:\"destroy-user\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:6;a:5:{s:1:\"a\";i:19;s:1:\"b\";s:14:\"Listar papéis\";s:1:\"c\";s:10:\"index-role\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:7;a:5:{s:1:\"a\";i:20;s:1:\"b\";s:15:\"Cadastrar papel\";s:1:\"c\";s:11:\"create-role\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:8;a:5:{s:1:\"a\";i:21;s:1:\"b\";s:12:\"Editar papel\";s:1:\"c\";s:9:\"edit-role\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:9;a:5:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"Apagar papel\";s:1:\"c\";s:12:\"destroy-role\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:10;a:5:{s:1:\"a\";i:23;s:1:\"b\";s:27:\"Listar permissões do papel\";s:1:\"c\";s:21:\"index-role-permission\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:11;a:5:{s:1:\"a\";i:24;s:1:\"b\";s:26:\"Editar permissão do papel\";s:1:\"c\";s:22:\"update-role-permission\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:2;}}i:12;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:15:\"Listar páginas\";s:1:\"c\";s:16:\"index-permission\";s:1:\"d\";s:3:\"web\";}i:13;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:18:\"Visualizar página\";s:1:\"c\";s:15:\"show-permission\";s:1:\"d\";s:3:\"web\";}i:14;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"Cadastrar página\";s:1:\"c\";s:17:\"create-permission\";s:1:\"d\";s:3:\"web\";}i:15;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:14:\"Editar página\";s:1:\"c\";s:15:\"edit-permission\";s:1:\"d\";s:3:\"web\";}i:16;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"Apagar página\";s:1:\"c\";s:18:\"destroy-permission\";s:1:\"d\";s:3:\"web\";}i:17;a:5:{s:1:\"a\";i:35;s:1:\"b\";s:21:\"Especialista - listar\";s:1:\"c\";s:16:\"index-specialist\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:18;a:5:{s:1:\"a\";i:36;s:1:\"b\";s:25:\"Especialista - visualizar\";s:1:\"c\";s:15:\"show-specialist\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:19;a:5:{s:1:\"a\";i:37;s:1:\"b\";s:24:\"Especialista - Cadastrar\";s:1:\"c\";s:17:\"create-specialist\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:20;a:5:{s:1:\"a\";i:38;s:1:\"b\";s:21:\"Especialista - editar\";s:1:\"c\";s:15:\"edit-specialist\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:21;a:5:{s:1:\"a\";i:40;s:1:\"b\";s:17:\"Listar reformados\";s:1:\"c\";s:13:\"index-retired\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:22;a:5:{s:1:\"a\";i:41;s:1:\"b\";s:31:\"Listar aniversariantes por data\";s:1:\"c\";s:9:\"birthdate\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:23;a:5:{s:1:\"a\";i:42;s:1:\"b\";s:24:\"Gerar PDF dos reformados\";s:1:\"c\";s:14:\"reformados/pdf\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:24;a:5:{s:1:\"a\";i:46;s:1:\"b\";s:35:\"Estrutura - remover pessoa do cargo\";s:1:\"c\";s:14:\"destroy-person\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:25;a:5:{s:1:\"a\";i:47;s:1:\"b\";s:29:\"Estrutura - cadeia de comando\";s:1:\"c\";s:7:\"comando\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:26;a:5:{s:1:\"a\";i:48;s:1:\"b\";s:29:\"Estrutura - pesquisar militar\";s:1:\"c\";s:23:\"structure.searchMilitar\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:27;a:5:{s:1:\"a\";i:50;s:1:\"b\";s:23:\"Estrutura - gerar geral\";s:1:\"c\";s:16:\"generate/general\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:28;a:5:{s:1:\"a\";i:51;s:1:\"b\";s:29:\"Estrutura - gerar específica\";s:1:\"c\";s:17:\"generate/specific\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:29;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:23:\"Gerar PDF dos usuários\";s:1:\"c\";s:17:\"generate-pdf-user\";s:1:\"d\";s:3:\"web\";}i:30;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:23:\"Gerar CSV dos usuários\";s:1:\"c\";s:17:\"generate-csv-user\";s:1:\"d\";s:3:\"web\";}i:31;a:5:{s:1:\"a\";i:54;s:1:\"b\";s:18:\"Estrutura - listar\";s:1:\"c\";s:15:\"index-structure\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:32;a:5:{s:1:\"a\";i:55;s:1:\"b\";s:22:\"Estrutura - visualizar\";s:1:\"c\";s:14:\"show-structure\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:33;a:5:{s:1:\"a\";i:56;s:1:\"b\";s:21:\"Estrutura - Cadastrar\";s:1:\"c\";s:16:\"create-structure\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:34;a:5:{s:1:\"a\";i:57;s:1:\"b\";s:18:\"Estrutura - editar\";s:1:\"c\";s:14:\"edit-structure\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:35;a:5:{s:1:\"a\";i:58;s:1:\"b\";s:19:\"Estrutura - remover\";s:1:\"c\";s:17:\"destroy-structure\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:36;a:5:{s:1:\"a\";i:59;s:1:\"b\";s:22:\"Especialista - remover\";s:1:\"c\";s:17:\"delete-specialist\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:2;i:1;i:3;i:2;i:4;}}i:37;a:5:{s:1:\"a\";i:61;s:1:\"b\";s:37:\"Estrutura - adicionar pessoa ao cargo\";s:1:\"c\";s:10:\"add-person\";s:1:\"d\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:3;i:1;i:4;}}}s:5:\"roles\";a:3:{i:0;a:3:{s:1:\"a\";i:2;s:1:\"c\";s:5:\"Admin\";s:1:\"d\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:3;s:1:\"c\";s:19:\"1º Oficial da RPSI\";s:1:\"d\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:4;s:1:\"c\";s:15:\"Oficial da RPSI\";s:1:\"d\";s:3:\"web\";}}}', 1762790889);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_funcao` int DEFAULT NULL,
  `estado_principal` tinyint DEFAULT '0',
  PRIMARY KEY (`id_cargo`) USING BTREE,
  KEY `id_funcao` (`id_funcao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nome_cargo`, `id_funcao`, `estado_principal`) VALUES
(1, 'Comandante', 1, 1),
(2, 'Chefe', 2, 1),
(3, 'Director', 2, 0),
(4, '1º Oficial de Planeamento e Sistemas de Informação', 4, 0),
(5, 'Programador de Aplicações', 4, 0),
(8, 'Chefe do Gabinete', 2, 0),
(9, 'Ajudante às Ordens', 4, 0),
(10, 'Condutor', 4, 0),
(11, 'Secretaria', 4, 0),
(12, 'Oficial de Estudos e Projectos', 4, 0),
(13, 'Oficial de Segurança e Auditoria', 4, 0),
(14, 'Oficial de Preparação Especial', 4, 0),
(15, '1º Oficial de Análise e Desenvolvimento de Sistemas', 4, 0),
(16, 'Oficial de Pesquisa e Sistemas Embutidos', 4, 0),
(18, 'Programador de Tecnologias Web e Multimedia', 4, 0),
(19, '1º Oficial de Sistemas e Servidores', 4, 0),
(20, 'Oficial de Redes', 4, 0),
(21, 'Oficial de Hardware', 4, 0),
(22, 'Técnico de Suporte ao Utilizador(Help-Desk)', 4, 0),
(23, 'Auxiliar de Redes', 4, 0),
(24, 'Auxiliar de Hardware', 4, 0),
(25, '1º Oficial Administrador de Base de Dados', 4, 0),
(26, 'Administrador de Sistema de Redes', 4, 0),
(27, 'Oficial de Exploração de Sistemas', 4, 0),
(28, 'Operador de Computador', 4, 0),
(29, 'Ajudante p/Manuseamento de Materiais Classificados', 4, 0),
(30, 'Amanuence', 4, 0),
(31, 'Arquivista', 4, 0),
(33, 'Oficial de Sistema e Redes', 4, 0),
(34, 'Oficial de Software', 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_classe` int NOT NULL,
  `course_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_course_id_foreign` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `classes`
--

INSERT INTO `classes` (`id`, `name`, `description`, `order_classe`, `course_id`, `created_at`, `updated_at`) VALUES
(1, 'Aula 1', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt eveniet asperiores totam quas velit repellendus optio. Aliquid enim aspernatur asperiores soluta tempora ratione aliquam deserunt, consequatur quos voluptatibus. Repudiandae, iusto!', 1, 1, '2025-03-12 19:40:14', '2025-03-12 19:40:14'),
(2, 'Aula 2', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt eveniet asperiores totam quas velit repellendus optio. Aliquid enim aspernatur asperiores soluta tempora ratione aliquam deserunt, consequatur quos voluptatibus. Repudiandae, iusto!', 2, 1, '2025-03-12 19:40:14', '2025-03-12 19:40:14'),
(3, 'Aula 1B', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Nesciunt eveniet asperiores totam quas velit repellendus optio. Aliquid enim aspernatur asperiores soluta tempora ratione aliquam deserunt, consequatur quos voluptatibus. Repudiandae, iusto!', 1, 2, '2025-03-12 19:40:14', '2025-03-12 19:40:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `continente`
--

DROP TABLE IF EXISTS `continente`;
CREATE TABLE IF NOT EXISTS `continente` (
  `id_continente` int NOT NULL AUTO_INCREMENT,
  `nome_continente` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_continente`) USING BTREE,
  UNIQUE KEY `nome_continente` (`nome_continente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `continente`
--

INSERT INTO `continente` (`id_continente`, `nome_continente`) VALUES
(1, 'África');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coordenadas_geo`
--

DROP TABLE IF EXISTS `coordenadas_geo`;
CREATE TABLE IF NOT EXISTS `coordenadas_geo` (
  `id_ueo` smallint NOT NULL,
  `latitude` decimal(3,0) NOT NULL,
  `longitude` int NOT NULL,
  PRIMARY KEY (`id_ueo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura da tabela `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `courses`
--

INSERT INTO `courses` (`id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Curso de Laravel - T1', 197.43, '2025-03-12 19:40:13', '2025-03-12 19:40:13'),
(2, 'Curso de Laravel - T2', 247.43, '2025-03-12 19:40:14', '2025-03-12 19:40:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nome_curso` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_nivel` int DEFAULT NULL,
  `id_tipo_curso` int DEFAULT NULL,
  PRIMARY KEY (`id_curso`) USING BTREE,
  KEY `id_nivel` (`id_nivel`) USING BTREE,
  KEY `id_tipo_curso` (`id_tipo_curso`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `curso`
--

INSERT INTO `curso` (`id_curso`, `nome_curso`, `id_nivel`, `id_tipo_curso`) VALUES
(3, 'Administração Militar', 1, 1),
(4, 'Engenharia Informática', 3, 1),
(5, 'Cibersegurança', 1, 1),
(6, 'Redes de Computadores', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `curso_frequentado`
--

DROP TABLE IF EXISTS `curso_frequentado`;
CREATE TABLE IF NOT EXISTS `curso_frequentado` (
  `id_curso_frequentado` int NOT NULL AUTO_INCREMENT,
  `id_pessoa_juridica` int NOT NULL,
  `id_curso` int NOT NULL,
  `id_instituicao` int NOT NULL,
  `nota` decimal(3,0) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `created` timestamp NOT NULL,
  PRIMARY KEY (`id_curso_frequentado`) USING BTREE,
  KEY `id_pessoa_juridica` (`id_pessoa_juridica`) USING BTREE,
  KEY `id_curso` (`id_curso`) USING BTREE,
  KEY `id_instituicao` (`id_instituicao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `curso_frequentado`
--

INSERT INTO `curso_frequentado` (`id_curso_frequentado`, `id_pessoa_juridica`, `id_curso`, `id_instituicao`, `nota`, `data_inicio`, `data_fim`, `created`) VALUES
(2, 551, 4, 1, NULL, '2020-02-20', '2022-02-20', '2025-05-15 16:52:55'),
(3, 552, 3, 1, NULL, NULL, NULL, '2025-05-15 18:05:35'),
(5, 229, 4, 1, 13, '2009-04-24', '2015-05-15', '2025-07-10 10:12:18'),
(40, 557, 4, 1, 14, '2017-05-29', '2023-09-01', '2025-10-07 11:54:55'),
(41, 556, 4, 1, NULL, '2019-01-05', '2024-08-28', '2025-10-08 08:06:15'),
(46, 365, 4, 1, 14, '2014-06-01', '2020-08-20', '2025-10-13 07:58:32'),
(48, 45, 4, 2, NULL, NULL, NULL, '2025-11-07 09:54:24'),
(51, 377, 4, 1, 14, '2014-06-01', '2020-08-20', '2025-11-09 18:58:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dcm_classes`
--

DROP TABLE IF EXISTS `dcm_classes`;
CREATE TABLE IF NOT EXISTS `dcm_classes` (
  `Classe_Id` tinyint NOT NULL,
  `Classe` varchar(42) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Classe_abv` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Ramo_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`Classe_Id`) USING BTREE,
  KEY `Ramo_id` (`Ramo_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dcm_classes`
--

INSERT INTO `dcm_classes` (`Classe_Id`, `Classe`, `Classe_abv`, `Ramo_id`) VALUES
(1, 'Infantaria', 'INF', 1),
(2, 'Tropas Blindadas', 'BLI', 1),
(3, 'Artilharia Terrestre', 'ART', 1),
(4, 'Defesa Antí-Aérea', 'DAA', 1),
(5, 'Engenharia Militar', 'ENG', 1),
(6, 'Telecomunicações', 'TEL', 1),
(7, 'Administração Militar', 'AM', 1),
(9, 'Defesa Contra Armas de Extermínio em Massa', 'DCAEM', 1),
(11, 'Logística', 'LG', 1),
(12, 'Secretariado e Serviços de Apoio', 'SECR', 1),
(13, 'Armamento e Tecnica', 'ARMTEC', 1),
(14, 'Serviços de Justiça', 'SJ', 1),
(15, 'Justiça Militar', 'JM', 1),
(17, 'Serviços Tecnicos de Saúde', 'STS', 1),
(18, 'Saúde Militar', 'SM', 1),
(19, 'Informática', 'TIC', 1),
(20, 'Tecnicos Superiores', 'TS', 1),
(65, 'Músicos', '', 1),
(66, 'Indefinido', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dcm_postosmilitares`
--

DROP TABLE IF EXISTS `dcm_postosmilitares`;
CREATE TABLE IF NOT EXISTS `dcm_postosmilitares` (
  `Posto_Id` smallint NOT NULL,
  `Cod_categoria` tinyint DEFAULT NULL,
  `Posto` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PostoAbrev` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Equiv` tinyint DEFAULT NULL,
  PRIMARY KEY (`Posto_Id`) USING BTREE,
  KEY `Cod_categoria` (`Cod_categoria`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dcm_postosmilitares`
--

INSERT INTO `dcm_postosmilitares` (`Posto_Id`, `Cod_categoria`, `Posto`, `PostoAbrev`, `Equiv`) VALUES
(100, 1, 'GENERAL CEMG', 'GCEM', 1),
(101, 1, 'GENERAL  (CEM/GA/R)', 'GCEA', 2),
(102, 1, 'GENERAL-DE-EXERCITO', 'GENEX', 3),
(103, 1, 'ALMIRANTE DE ARMADA', 'ALMA', 3),
(104, 1, 'GENERAL DE AVIAÇAO', 'GENA', 3),
(105, 1, 'GENERAL', 'GEN', 4),
(106, 1, 'ALMIRANTE', 'ALM', 4),
(107, 1, 'T. GENERAL', 'TGEN', 5),
(108, 1, 'VICE-ALMIRANTE', 'VALM', 5),
(109, 1, 'BRIGADEIRO', 'BRIG', 6),
(110, 1, 'CONTRA-ALMIRANTE', 'CALM', 6),
(111, 1, 'CORONEL', 'COR', 7),
(112, 1, 'CAP. DE-MAR-E-GUERRA', 'CMG', 7),
(113, 1, 'T. CORONEL', 'TCOR', 8),
(114, 1, 'CAP. DE FRAGATA', 'CFR', 8),
(115, 1, 'MAJOR', 'MAJ', 9),
(116, 1, 'CAP. DE CORVETA', 'CCV', 9),
(117, 1, 'CAPITAO', 'CAP', 10),
(118, 1, 'TTE DE NAVIO', 'TTN', 10),
(119, 1, 'TTE DE FRAGATA', 'TTF', 11),
(120, 1, 'TENENTE', 'TTE', 11),
(121, 1, 'SUB-TENENTE', 'STT', 12),
(122, 1, 'TTE DE CORVETA', 'TTC', 12),
(123, 1, 'ASPIRANTE', 'ASP', 13),
(124, 1, 'SUB-TENENTE (MGA)', 'STTM', 13),
(125, 2, 'SARGENTO MAIOR', 'SGTM', 14),
(126, 2, 'SARGENTO-CHEFE', 'SGTC', 15),
(127, 2, 'SARGENTO-AJUDANTE', 'SGTA', 16),
(128, 2, '1º SARGENTO', '1SGT', 17),
(129, 2, '2º SARGENTO', '2SGT', 18),
(130, 2, 'SUB-SARGENTO', 'SSGT', 19),
(131, 3, '1º CABO', '1CB', 20),
(132, 3, 'CABO', 'CB', 20),
(133, 3, '2º CABO', '2CB', 22),
(134, 3, 'MARINHEIRO', 'MR', 22),
(135, 3, 'GRUMETE', 'GR', 23),
(136, 3, 'SOLDADO', 'SOL', 23),
(137, 3, 'RECRUTA', 'RECR', 24),
(138, 4, 'CIVIL', 'CVL', 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dcm_ramo`
--

DROP TABLE IF EXISTS `dcm_ramo`;
CREATE TABLE IF NOT EXISTS `dcm_ramo` (
  `Ramo_ID` tinyint NOT NULL,
  `Desc_Ramo` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Ramo_abrev` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Ramo_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dcm_ramo`
--

INSERT INTO `dcm_ramo` (`Ramo_ID`, `Desc_Ramo`, `Ramo_abrev`) VALUES
(1, 'EXERCITO', 'EXE'),
(2, 'FORÇA AÉREA NACIONAL', 'FAN'),
(3, 'MARINHA DE GUERRA ANGOLANA', 'MGA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dcm_situacao_quadro`
--

DROP TABLE IF EXISTS `dcm_situacao_quadro`;
CREATE TABLE IF NOT EXISTS `dcm_situacao_quadro` (
  `Sitq_Id` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Situacao_Quadro` varchar(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Abrev_Sit_Quadro` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodHierarquia` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dcm_situacao_quadro`
--

INSERT INTO `dcm_situacao_quadro` (`Sitq_Id`, `Situacao_Quadro`, `Abrev_Sit_Quadro`, `CodHierarquia`) VALUES
('M', 'Quadro Miliciano', 'QM', 2),
('O', 'Svc Militar Obrigatório', 'SMO', 3),
('P', 'Quadro Permanente', 'QP', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dcm_situacao_serviço`
--

DROP TABLE IF EXISTS `dcm_situacao_serviço`;
CREATE TABLE IF NOT EXISTS `dcm_situacao_serviço` (
  `Sits_Id` tinyint DEFAULT NULL,
  `Situacao_svc` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodSitSvcMilitar` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dcm_situacao_serviço`
--

INSERT INTO `dcm_situacao_serviço` (`Sits_Id`, `Situacao_svc`, `CodSitSvcMilitar`) VALUES
(1, 'Comissão Normal Serviço', 1),
(2, 'Comissão Especial Serviço', 1),
(3, 'Inactividade Temporária -Estudo', 1),
(4, 'Inactividade Temporária -Crime', 1),
(5, 'Inactividade Temporária -Disciplina', 1),
(6, 'Inactividade Temporária -Doença', 1),
(7, 'Licença Ilimitada', 1),
(8, 'Licença Registada', 1),
(9, 'Desertor', 2),
(10, 'Falecido', 3),
(11, 'Desaparecido', 5),
(12, 'Reforma', 6),
(14, 'Reserva', 7),
(26, 'Inactividade Temporária -Disponíveis', 1),
(27, 'Portadores de Dificiência Física', 1),
(28, 'Militares Ex-FAPLA', 6),
(29, 'Militares Ex-Tigres', 7),
(30, 'Caso Para Estudo', 7),
(31, 'Disponibilidade', 7),
(35, 'Trabalhador Quadro', 1),
(36, 'Provimento Adminstrativo', 1),
(37, 'Contrato a Termo Certo', 1),
(38, 'Civil Domiciliar', 1),
(40, 'Demitido', 1),
(42, 'Transferido', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `dc_municipio`
--

DROP TABLE IF EXISTS `dc_municipio`;
CREATE TABLE IF NOT EXISTS `dc_municipio` (
  `idMunicipio` smallint NOT NULL,
  `idProvincia` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Municipio` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idMunicipio`) USING BTREE,
  KEY `idProvincia` (`idProvincia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dc_municipio`
--

INSERT INTO `dc_municipio` (`idMunicipio`, `idProvincia`, `Municipio`) VALUES
(1, 'BO', 'Ambriz'),
(2, 'BO', 'Bula Atumba'),
(3, 'BO', 'Caxito'),
(4, 'BO', 'Dande'),
(5, 'BO', 'Dembos'),
(7, 'BO', 'Nanbuangongo'),
(9, 'BO', 'Pango Aluquém'),
(10, 'BA', 'Balombo'),
(11, 'BA', 'Baia Farta'),
(12, 'BA', 'Benguela'),
(13, 'BA', 'Bocoio'),
(14, 'BA', 'Caimbambo'),
(15, 'BA', 'Catumbela'),
(16, 'BA', 'Chongoroi'),
(17, 'BA', 'Cubal'),
(18, 'BA', 'Ganda'),
(19, 'BA', 'Lobito'),
(20, 'BE', 'Andulo'),
(21, 'BE', 'Camacupa'),
(22, 'BE', 'Catabola'),
(23, 'BE', 'Chinguar'),
(24, 'BE', 'Chitembo'),
(25, 'BE', 'Cuemba'),
(26, 'BE', 'Cunhinga'),
(27, 'BE', 'Kuito'),
(28, 'BE', 'Nharea'),
(29, 'CA', 'Belize'),
(30, 'CA', 'Buco-Zau'),
(31, 'CA', 'Cabinda'),
(32, 'CA', 'Cacongo'),
(33, 'KK', 'Calai'),
(34, 'KK', 'Cuanga'),
(35, 'KK', 'Cuchi'),
(36, 'KK', 'Cuito Cuanavale'),
(37, 'KK', 'Dirico'),
(38, 'KK', 'Longa'),
(39, 'KK', 'Mavinga'),
(40, 'KK', 'Menongue'),
(41, 'KK', 'Nancova'),
(42, 'KK', 'Rivungo'),
(43, 'CE', 'Cahama'),
(44, 'CE', 'Cuanhama'),
(45, 'CE', 'Curoca'),
(46, 'CE', 'Cuvelai'),
(47, 'CE', 'Namacunde'),
(48, 'CE', 'Ombadja'),
(49, 'CE', 'Ondjiva'),
(50, 'HO', 'Bailundo'),
(51, 'HO', 'Catchiungo'),
(52, 'HO', 'Caála'),
(53, 'HO', 'Ekunha'),
(54, 'HO', 'Huambo'),
(55, 'HO', 'Londuimbali'),
(56, 'HO', 'Longonjo'),
(57, 'HO', 'Mungo'),
(58, 'HO', 'Tchicala Tcholoanga'),
(59, 'HO', 'Tchindjenje'),
(60, 'HO', 'Ucuma'),
(61, 'HU', 'Caconda'),
(62, 'HU', 'Cacula'),
(63, 'HU', 'Caluquembe'),
(64, 'HU', 'Chianje'),
(65, 'HU', 'Chibia'),
(66, 'HU', 'Chicomba'),
(67, 'HU', 'Chipindo'),
(68, 'HU', 'Cuvango'),
(69, 'HU', 'Humpata'),
(70, 'HU', 'Jamba'),
(71, 'HU', 'Lubango'),
(72, 'HU', 'Matala'),
(73, 'HU', 'Quilengues'),
(74, 'HU', 'Quipungo'),
(75, 'KN', 'Ambaca'),
(76, 'KN', 'Banga'),
(77, 'KN', 'Bolongongo'),
(78, 'KN', 'Cambambe'),
(79, 'KN', 'Cazengo'),
(80, 'KN', 'Gulungo Alto'),
(81, 'KN', 'N\'dalatando'),
(82, 'KN', 'Gonguembo'),
(83, 'KN', 'Lucala'),
(84, 'KN', 'Quiculungo'),
(85, 'KN', 'Samba Cajú'),
(87, 'KS', 'Amboim'),
(88, 'KS', 'Cassongue'),
(89, 'KS', 'Cazenga'),
(90, 'KS', 'Conda'),
(91, 'KS', 'Hebo'),
(92, 'KS', 'Libolo'),
(93, 'KS', 'Mussende'),
(94, 'KS', 'Porto Amboim'),
(96, 'KS', 'Quibala'),
(97, 'KS', 'Quilenda'),
(98, 'KS', 'Seles'),
(99, 'KS', 'Sumbe'),
(100, 'KS', 'Waku Kungo'),
(101, 'LA', 'Belas'),
(102, 'LA', 'Cacuaco'),
(103, 'LA', 'Cazenga'),
(104, 'LA', 'Icolo e Bengo'),
(105, 'LA', 'Luanda'),
(106, 'LA', 'Quiçama'),
(107, 'LN', 'Cambulo'),
(108, 'LN', 'Capenda Camulemba'),
(109, 'LN', 'Cangula'),
(110, 'LN', 'Chitato'),
(112, 'LN', 'Cuango'),
(113, 'LN', 'Cuílo'),
(114, 'LN', 'Lubalo'),
(115, 'LN', 'Lucapa'),
(116, 'LN', 'Xá-Muteba'),
(117, 'LS', 'Cacolo'),
(118, 'LS', 'Dala'),
(119, 'LS', 'Muconda'),
(120, 'LS', 'Saurimo'),
(121, 'MA', 'Cacuso'),
(122, 'MA', 'Calandula'),
(123, 'MA', 'Cambundi Catembo'),
(124, 'MA', 'Cangandala'),
(125, 'MA', 'Caombo'),
(126, 'MA', 'Cuaba Nzoge'),
(127, 'MA', 'Cunda Dia-Baze'),
(128, 'MA', 'Luquembo'),
(129, 'MA', 'Malanje'),
(130, 'MA', 'Marimba'),
(131, 'MA', 'Massango'),
(132, 'MA', 'Mucari'),
(133, 'MA', 'Quela'),
(134, 'MA', 'Quirima'),
(135, 'MO', 'Alto Zambeze'),
(136, 'MO', 'Bundas'),
(137, 'MO', 'Camanongue'),
(138, 'MO', 'Léua'),
(139, 'MO', 'Luau'),
(140, 'MO', 'Luacano'),
(141, 'MO', 'Luchazes'),
(142, 'MO', 'Luena'),
(143, 'MO', 'Lumeji'),
(144, 'NA', 'Bibala'),
(145, 'NA', 'Camucuio'),
(146, 'NA', 'Namibe'),
(147, 'NA', 'Tômbua'),
(148, 'NA', 'Virei'),
(149, 'UI', 'Alto Cauale'),
(150, 'UI', 'Ambuila'),
(151, 'UI', 'Bembe'),
(152, 'UI', 'Buengas'),
(153, 'UI', 'Bungo'),
(154, 'UI', 'Damba'),
(155, 'UI', 'Macocola'),
(156, 'UI', 'Milunga'),
(157, 'UI', 'Mucaba'),
(158, 'UI', 'Negage'),
(159, 'UI', 'Puri'),
(160, 'UI', 'Quimbele'),
(161, 'UI', 'Quitexe'),
(162, 'UI', 'Sanza Pombo'),
(163, 'UI', 'Songo'),
(164, 'UI', 'Uige'),
(165, 'UI', 'Zombo'),
(166, 'ZA', 'Cuimba'),
(167, 'ZA', 'M\'banza Congo'),
(168, 'ZA', 'Noqui'),
(169, 'ZA', 'N\'zeto'),
(170, 'ZA', 'Soyo'),
(171, 'ZA', 'Tomboco'),
(172, 'LN', 'Dundo'),
(173, 'LA', 'Viana');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dc_provincia`
--

DROP TABLE IF EXISTS `dc_provincia`;
CREATE TABLE IF NOT EXISTS `dc_provincia` (
  `idProvincia` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Provincia` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CodCapital` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cod_pais` int DEFAULT '1',
  PRIMARY KEY (`idProvincia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `dc_provincia`
--

INSERT INTO `dc_provincia` (`idProvincia`, `Provincia`, `CodCapital`, `cod_pais`) VALUES
('BA', 'Benguela', '12', 1),
('BE', 'Bié', '27', 1),
('BO', 'Bengo', '3', 1),
('CA', 'Cabinda', '31', 1),
('CE', 'Cunene', '49', 1),
('EP', 'Exterior do País', '', 1),
('HO', 'Huambo', '54', 1),
('HU', 'Huíla', '71', 1),
('IND', 'Indefinido', '', 1),
('KK', 'Cuando Cubango', '40', 1),
('KN', 'Cuanza Norte', '81', 1),
('KS', 'Cuanza Sul', '99', 1),
('LA', 'Luanda', '105', 1),
('LN', 'Lunda Norte', '172', 1),
('LS', 'Lunda Sul', '120', 1),
('MA', 'Malanje', '129', 1),
('MO', 'Moxico', '142', 1),
('NA', 'Namibe', '146', 1),
('UI', 'Uíge', '164', 1),
('ZA', 'Zaire', '167', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `documento`
--

DROP TABLE IF EXISTS `documento`;
CREATE TABLE IF NOT EXISTS `documento` (
  `id_doc` int NOT NULL AUTO_INCREMENT,
  `id_pessoa_fisica` int DEFAULT NULL,
  `id_tipo_doc` int DEFAULT NULL,
  `numero_doc` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id_doc`) USING BTREE,
  KEY `id_pessoa_fisica` (`id_pessoa_fisica`) USING BTREE,
  KEY `id_tipo_doc` (`id_tipo_doc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `documento`
--

INSERT INTO `documento` (`id_doc`, `id_pessoa_fisica`, `id_tipo_doc`, `numero_doc`, `data_emissao`, `data_validade`, `created`, `modify`) VALUES
(27, 474, 1, '0051UE53703', '2019-08-12', '2025-08-12', '2024-05-28 12:06:58', NULL),
(28, 475, 1, '0051UE53703', '2024-04-29', '2029-01-28', '2024-05-28 12:09:40', NULL),
(29, 478, 1, '000021250LA010', '2023-06-19', '2033-06-19', '2024-07-19 15:15:38', NULL),
(33, 484, 1, '005897977LA044', '2023-02-15', '2023-02-14', '2024-07-24 12:56:28', NULL),
(34, 486, 1, '002254768LA038', '2021-10-25', '2031-10-24', '2024-07-29 14:43:17', NULL),
(35, 492, 1, '003158898LA034', '2023-09-12', '2033-09-12', '2024-07-29 15:28:35', NULL),
(36, 499, 1, '006893612UE049', '2019-11-27', '2024-11-26', '2024-07-30 10:26:27', NULL),
(38, 501, 1, '006210347UE043', '2018-08-28', '2023-08-27', '2024-07-30 10:43:20', NULL),
(47, 510, 1, '002872402UE0399', '2018-10-18', '2028-01-17', '2024-08-01 12:16:19', NULL),
(48, 511, 1, '002504787ZE034', '2022-05-03', '2032-05-02', '2024-08-01 12:26:43', NULL),
(49, 512, 1, '001760517UE033', '2018-06-09', '2026-06-09', '2024-08-01 12:37:43', NULL),
(51, 516, 1, '005843169HA049', '2017-12-19', '2030-12-18', '2024-08-07 10:50:02', NULL),
(58, 523, 1, '006111107MO047', '2018-07-11', '2023-07-10', '2024-08-07 11:22:57', NULL),
(59, 524, 1, '005417756KS049', '2022-03-10', '2030-03-09', '2024-08-07 11:34:15', NULL),
(60, 525, 1, '00635382LA045', '2018-11-28', '2023-11-27', '2024-08-07 13:59:56', NULL),
(62, 527, 1, '004659178BA040', '2015-01-21', '2025-01-21', '2024-08-07 14:29:40', NULL),
(65, 531, 1, '006611865HA048', '2019-04-15', '2024-04-14', '2024-08-07 15:31:59', NULL),
(66, 532, 1, '002575392UE038', '2021-01-19', '2031-01-18', '2024-08-07 15:49:24', NULL),
(67, 241, 1, '002024839ME039', '2020-10-22', '2025-10-21', '2024-08-09 10:11:35', NULL),
(69, 146, 1, '001696906ME035', '2020-10-29', '2030-10-28', '2024-08-09 10:19:12', NULL),
(70, 533, 1, '005213670BA046', '2022-07-11', '2027-07-10', '2024-08-09 11:49:47', NULL),
(71, 534, 1, '006257799LA045', '2018-10-01', '2023-09-30', '2024-08-14 09:20:40', NULL),
(72, 115, 1, '000709636LA038', '2023-08-17', '2023-08-17', '2024-08-14 09:39:28', NULL),
(73, 115, 1, '000709636LA038', '2023-08-17', '2033-07-17', '2024-08-14 09:40:22', NULL),
(74, 382, 1, '000842385KS036', '2021-02-02', '2026-02-01', '2024-08-14 11:28:53', NULL),
(75, 535, 1, '000864668H0032', '2023-08-17', '2025-12-07', '2024-08-14 12:02:42', NULL),
(77, 536, 1, '006083969HO042', '2018-06-04', '2023-06-03', '2024-08-14 13:25:55', NULL),
(78, 15, 1, '000867630H0030', '2016-09-06', '2026-09-06', '2024-08-14 13:50:32', NULL),
(79, 6, 1, '002322421KN034', '2011-09-02', '2033-09-02', '2024-08-16 15:12:48', NULL),
(96, 20, 1, '000302542UE035', '2019-11-21', '2029-11-20', '2025-09-24 16:11:23', NULL),
(107, 387, 1, '000933662LA033', '2023-09-27', '2033-09-26', '2025-10-06 12:30:11', NULL),
(109, 557, 1, '008059523LA049', '2021-03-11', '2026-03-10', '2025-10-07 12:54:55', NULL),
(111, 483, 1, '003284097LA034', '2023-09-07', '2033-09-06', '2025-10-08 09:27:33', NULL),
(114, 399, 1, '005350740LA047', '2019-10-21', '2024-10-20', '2025-10-09 11:39:02', NULL),
(115, 365, 1, '005135416LS046', '2022-08-30', '2032-08-30', '2025-10-13 08:58:32', NULL),
(119, 45, 1, '001485574BA034', '2021-11-22', '2031-11-21', '2025-11-07 09:54:24', NULL),
(128, 140, 1, '000008201ME029', '2015-10-21', '2025-10-21', '2025-11-09 18:55:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `do_ramos`
--

DROP TABLE IF EXISTS `do_ramos`;
CREATE TABLE IF NOT EXISTS `do_ramos` (
  `RamoID` tinyint NOT NULL AUTO_INCREMENT,
  `Ramo` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DescRamo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`RamoID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `do_ramos`
--

INSERT INTO `do_ramos` (`RamoID`, `Ramo`, `DescRamo`) VALUES
(1, 'FAA', 'Outros Órgãos'),
(5, 'EXE', 'Exército'),
(6, 'FAN', 'Força Aérea Nacional'),
(7, 'MGA', 'Marinha de Guerra Angolana');

-- --------------------------------------------------------

--
-- Estrutura da tabela `do_unidadesmilitares`
--

DROP TABLE IF EXISTS `do_unidadesmilitares`;
CREATE TABLE IF NOT EXISTS `do_unidadesmilitares` (
  `UnidadeID` smallint NOT NULL AUTO_INCREMENT,
  `Ueo` varchar(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RM` tinyint DEFAULT NULL,
  `NumConv` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_tipo_ueo` tinyint DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  `estado_unidade` tinyint(1) DEFAULT NULL,
  `ordenar` int DEFAULT NULL,
  `id_subdivisao_ueo` int DEFAULT NULL,
  `Ueo_Abrev` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`UnidadeID`) USING BTREE,
  KEY `RM` (`RM`) USING BTREE,
  KEY `id_tipo_ueo` (`id_tipo_ueo`) USING BTREE,
  KEY `id_municipio` (`id_municipio`) USING BTREE,
  KEY `do_unidadesmilitares_ibfk_4` (`id_subdivisao_ueo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3052 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `do_unidadesmilitares`
--

INSERT INTO `do_unidadesmilitares` (`UnidadeID`, `Ueo`, `RM`, `NumConv`, `id_tipo_ueo`, `id_municipio`, `estado_unidade`, `ordenar`, `id_subdivisao_ueo`, `Ueo_Abrev`) VALUES
(10, 'GABINETE CMDTE', 1, '', NULL, NULL, 0, 0, 10, ''),
(20, 'GABINETE 2º CMDTE', 1, '', NULL, NULL, 0, 0, 10, ''),
(21, 'GABINETE CMDTE ADJ EXE P/ED.PATRIOTICA', 1, '', NULL, NULL, 0, 0, 10, ''),
(25, 'GABINENTE CEME', 1, '', NULL, NULL, 0, 0, 10, ''),
(40, 'DIREC. PLANEAMENTO E ORGANIZACAO', 1, '', NULL, NULL, 0, 0, 20, ''),
(50, 'GABINETE CONSELHEIRO', 1, '', NULL, NULL, 0, 0, 10, ''),
(60, 'DIRECÇÃO DE INFORMÁTICA', 1, '', NULL, NULL, 0, 0, 20, 'DI'),
(70, 'INSPECÇÃO GERAL EXÉRCITO', 1, '', NULL, NULL, 0, 0, 10, ''),
(90, 'DIRECCAO DE PESSOAL E QUADROS', 1, '', NULL, NULL, 0, 0, 20, 'DPQ'),
(100, 'DIRECÇÃO DE INSTRUÇÃO E ENSINO', 1, '', NULL, NULL, 0, 0, 20, ''),
(110, 'GABINETE APOIO CONSELHO E DISCIPLINA', 1, '', NULL, NULL, 0, 0, 10, ''),
(120, 'REPARTIÇÃO DE SVÇ PENITENCIÁRIOS', 1, '', NULL, NULL, 0, 0, 0, ''),
(125, 'PROCURADORIA DO EXÉRCITO', 1, '', NULL, NULL, 0, 0, 10, ''),
(130, 'POLICIA JUDICIARIA MILITAR', 1, '', NULL, NULL, 0, 0, 10, ''),
(140, 'DIRECÇÃO DE OPERAÇÕES', 1, '', NULL, NULL, 0, 0, 30, ''),
(150, 'DIRECÇÃO INTELIG. MILITAR OPERATIVA', 1, '', NULL, NULL, 0, 0, 30, 'DIMO'),
(160, 'DIRECÇÃO DE PREPARAÇÃO COMBATIVA', 1, '', NULL, NULL, 0, 0, 20, ''),
(170, 'DIRECÇÃO DE TROPAS BLINDADAS', 1, '', NULL, NULL, 0, 0, 30, ''),
(180, 'DIRECÇÃO ARTILHARIA TERRESTRE', 1, '', NULL, NULL, 0, 0, 30, 'DAAT'),
(190, 'DIRECÇÃO DEFESA ANTI-AEREA', 1, '', NULL, NULL, 0, 0, 30, ''),
(200, 'DIRECÇÃO DE TELECOMUNICAÇÕES', 1, '', NULL, NULL, 0, 0, 30, ''),
(210, 'DIRECÇÃO ENGENHARIA E  INFRAESTRUTURAS', 1, '', NULL, NULL, 0, 0, 30, ''),
(220, 'DIRECÇÃO SVÇ SAUDE', 1, '', NULL, NULL, 0, 0, 20, 'DSS'),
(230, '6ª DIRECÇÃO', 1, '', NULL, NULL, 0, 0, 30, ''),
(240, 'REPARTIÇÃO DE POLICIA MILITAR', 1, '', NULL, NULL, 0, 0, 30, 'RPM'),
(245, 'DIRECÇÃO DE GUERRA PSICOLÓGICA', 1, '', NULL, NULL, 0, 0, 30, ''),
(250, 'BIBLIOTECA CIENTÍFICA', 1, '', NULL, NULL, 0, 0, 30, ''),
(255, 'COMITÉ DESPORTIVO MILITAR ', 1, '', NULL, NULL, 0, 0, 0, ''),
(260, 'ARQUIVO CENTRAL', 1, '', NULL, NULL, 0, 0, 30, ''),
(270, 'DIRECÇÄO DE LOGISTICA', 1, '', NULL, NULL, 0, 0, 20, 'DL'),
(280, 'DIRECÇÃO DE ARMAMENTO E TÉCNICA', 1, '', NULL, NULL, 0, 0, 20, 'DAT'),
(290, 'DIRECÇÃO DE EDUCAÇÃO PATRIÓTICA', 1, '', NULL, NULL, 0, 0, 20, ''),
(300, 'DIRECÇÃO CONTRA INTELIG. MILITAR', 1, '', NULL, NULL, 0, 0, 20, ''),
(310, 'DIRECÇÃO DE ADMINISTRAÇÃO E FINANÇAS', 1, '', NULL, NULL, 0, 0, 20, 'DAF'),
(320, 'DIRECÇÄO PROTECÇÃO NUCLEAR BATERIOLÓGICA E  QUIMICA', 1, '', NULL, NULL, 0, 0, 30, ''),
(330, 'MUSEU DO EXÉRCITO', 1, '', NULL, NULL, 0, 0, 30, ''),
(335, 'CMDO UNIDADE DE APOIO', 1, '', NULL, NULL, 0, 0, 30, ''),
(350, 'CLÍNICA DO EXÉRCITO', 1, '', NULL, NULL, 0, 0, 0, ''),
(352, 'MONUMENTO À BATALHA DE KIFANGONDO', 1, '', NULL, NULL, 0, 0, 0, ''),
(950, 'QUARTEL GENERAL', 3, '', NULL, NULL, 0, 0, 0, ''),
(3040, 'ACADEMIA MILITAR DO EXÉRCITO', 1, '', NULL, NULL, 0, 0, 0, ''),
(3041, '101ª BRIGADA DE TANQUES', 3, NULL, 1, NULL, 1, 0, 0, ''),
(3042, '70ª BRIGADA DE INFANTARIA MOTORIZADA', 3, NULL, 1, NULL, 1, 0, 0, ''),
(3043, 'DIRECÇÃO PRINCIPAL DE TELECOMUNICAÇÕES E TECNOLOGIAS DE INFORMAÇÃO', 14, NULL, 3, NULL, 1, 0, 0, 'DTIC\'s'),
(3044, 'QUARTEL GENERAL', 5, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3045, 'QUARTEL GENERAL', 8, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3046, 'QUARTEL GENERAL', 7, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3047, 'QUARTEL GENERAL', 12, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3048, 'QUARTEL GENERAL', 11, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3049, 'QUARTEL GENERAL', 6, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3050, 'QUARTEL GENERAL', 10, NULL, 1, NULL, 1, 0, 0, 'QG'),
(3051, 'QUARTEL GENERAL', 9, NULL, 1, NULL, 1, 0, 0, 'QG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE IF NOT EXISTS `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idpessoa` int NOT NULL,
  `endereco` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idbairro` int DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modify` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endereco_1` (`idbairro`),
  KEY `fk_endereco_2` (`idpessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `idpessoa`, `endereco`, `idbairro`, `created`, `modify`) VALUES
(11, 64, NULL, NULL, NULL, '2025-07-02 14:11:46'),
(12, 365, NULL, NULL, NULL, '2025-10-13 07:58:32'),
(13, 229, NULL, NULL, NULL, '2025-07-10 10:12:18'),
(14, 45, 'Casa nº18', 1, NULL, '2025-11-07 09:54:24'),
(15, 20, NULL, NULL, NULL, '2025-09-24 15:11:22'),
(16, 132, NULL, NULL, NULL, '2025-11-05 11:52:24'),
(17, 192, NULL, NULL, NULL, '2025-10-01 18:15:00'),
(20, 377, NULL, NULL, NULL, '2025-11-09 18:58:51'),
(21, 75, NULL, NULL, NULL, '2025-10-04 15:38:33'),
(22, 387, NULL, NULL, NULL, '2025-10-06 11:30:11'),
(23, 556, NULL, NULL, '2025-10-07 09:44:05', '2025-10-08 08:06:15'),
(24, 557, NULL, NULL, '2025-10-07 11:54:55', NULL),
(25, 483, NULL, NULL, NULL, '2025-10-08 08:27:33'),
(26, 399, NULL, NULL, NULL, '2025-10-09 10:39:02'),
(29, 140, NULL, NULL, NULL, '2025-11-09 18:55:00'),
(30, 7, NULL, NULL, NULL, '2025-11-09 17:53:09'),
(31, 25, NULL, NULL, NULL, '2025-11-07 07:56:01'),
(32, 107, NULL, NULL, NULL, '2025-11-07 13:53:31'),
(33, 53, NULL, NULL, NULL, '2025-11-09 18:21:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `id_especialidade` int NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_quadro_especial` tinyint NOT NULL,
  `id_dir_especialidade` smallint DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`) USING BTREE,
  KEY `id_quadro_especial` (`id_quadro_especial`) USING BTREE,
  KEY `id_dir_especialidade` (`id_dir_especialidade`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `especialidade`
--

INSERT INTO `especialidade` (`id_especialidade`, `nome_especialidade`, `id_quadro_especial`, `id_dir_especialidade`) VALUES
(1, 'Desenvolvedor de Sistemas', 19, 60),
(6, 'Gestor de Recursos Humanos', 7, 90),
(7, 'Finanças', 7, 310),
(8, 'Ciber Segurança', 19, 60),
(9, 'Analista de Dados', 19, 60),
(10, 'Web Design', 19, 60),
(11, 'Administração de Redes', 19, 60),
(12, 'Hardware e Periféricos', 19, 60),
(15, 'Informático', 19, 60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
CREATE TABLE IF NOT EXISTS `estado_civil` (
  `id_estado_civil` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `estado_civil` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_estado_civil`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `estado_civil`
--

INSERT INTO `estado_civil` (`id_estado_civil`, `estado_civil`) VALUES
('C', 'Casado(a)'),
('D', 'Divorciado(a)'),
('S', 'Solteiro(a)'),
('V', 'Viúvo(a)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_especialista`
--

DROP TABLE IF EXISTS `estado_especialista`;
CREATE TABLE IF NOT EXISTS `estado_especialista` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `estado_especialista`
--

INSERT INTO `estado_especialista` (`id`, `descricao`) VALUES
(1, 'Situação Regular'),
(2, 'Desaparecido'),
(3, 'Preso'),
(4, 'Morto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estrutura_organica`
--

DROP TABLE IF EXISTS `estrutura_organica`;
CREATE TABLE IF NOT EXISTS `estrutura_organica` (
  `id_estrutura_organica` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `id_cargo` int DEFAULT NULL,
  `id_posto_organico` smallint DEFAULT NULL,
  `id_funcao` int DEFAULT NULL,
  `quantidade_organica` int NOT NULL,
  `tipo_cargo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_estrutura_organica`) USING BTREE,
  KEY `estrutura_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_cargo` (`id_cargo`) USING BTREE,
  KEY `id_posto_organico` (`id_posto_organico`) USING BTREE,
  KEY `id_funcao` (`id_funcao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `estrutura_organica`
--

INSERT INTO `estrutura_organica` (`id_estrutura_organica`, `id_dependencia`, `id_cargo`, `id_posto_organico`, `id_funcao`, `quantidade_organica`, `tipo_cargo`) VALUES
(1, 1, 2, 109, 2, 1, 1),
(2, 1, 9, 117, 4, 1, 0),
(3, 1, 10, 129, 4, 1, 0),
(4, 1, 10, 132, 4, 1, 0),
(6, 2, 2, 111, 5, 1, 1),
(7, 2, 4, 113, 4, 1, 0),
(8, 2, 13, 115, 4, 1, 0),
(9, 2, 12, 115, 4, 1, 0),
(10, 2, 14, 117, 4, 1, 0),
(13, 5, 2, 111, 4, 1, 1),
(14, 5, 15, 113, 4, 1, 0),
(15, 5, 16, 115, 4, 1, 0),
(16, 5, 5, 115, 4, 1, 0),
(17, 5, 18, 117, 4, 1, 0),
(18, 6, 2, 111, 4, 1, 1),
(19, 6, 19, 113, 4, 1, 0),
(20, 6, 20, 117, 4, 2, 0),
(21, 6, 21, 117, 4, 2, 0),
(22, 6, 22, 120, 4, 2, 0),
(23, 6, 23, 128, 4, 1, 0),
(24, 6, 24, 128, 4, 1, 0),
(25, 7, 2, 111, 4, 1, 1),
(26, 7, 25, 113, 4, 1, 0),
(27, 7, 26, 115, 4, 1, 0),
(28, 7, 27, 117, 4, 1, 0),
(29, 7, 28, 128, 4, 1, 0),
(30, 8, 2, 120, 4, 1, 0),
(31, 8, 29, 128, 4, 1, 0),
(32, 8, 30, 129, 4, 1, 0),
(34, 8, 10, 131, 4, 1, 0),
(70, 35, 21, 117, 4, 2, 1),
(72, 6, 2, 111, 2, 1, 0),
(73, 37, 23, 115, 4, 1, 0),
(75, 39, 15, 113, 4, 1, 0),
(76, 40, 2, 111, 2, 1, 1),
(77, 39, 2, 111, 2, 1, 0),
(78, 41, 2, 111, 2, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `foto`
--

DROP TABLE IF EXISTS `foto`;
CREATE TABLE IF NOT EXISTS `foto` (
  `id_pessoa_juridica` int NOT NULL AUTO_INCREMENT,
  `foto_militar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `foto_civil` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created` timestamp NOT NULL,
  PRIMARY KEY (`id_pessoa_juridica`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=554 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `foto`
--

INSERT INTO `foto` (`id_pessoa_juridica`, `foto_militar`, `foto_civil`, `created`) VALUES
(20, 'whatsapp-image-2024-08-09-at-13.28.27.jpeg', NULL, '0000-00-00 00:00:00'),
(45, 'download.jpg', NULL, '0000-00-00 00:00:00'),
(55, 'militar-user.png', NULL, '0000-00-00 00:00:00'),
(115, 'img-20240809-140020-624.jpg', NULL, '0000-00-00 00:00:00'),
(132, 'whatsapp-image-2024-08-09-at-13.51.37.jpeg', NULL, '0000-00-00 00:00:00'),
(146, 'imagem-do-whatsapp-de-2024-08-09-a-s-15.49.39-1c2fd7e9.jpg', NULL, '0000-00-00 00:00:00'),
(241, 'imagem-do-whatsapp-de-2024-08-09-a-s-15.58.42-9fb95085.jpg', NULL, '0000-00-00 00:00:00'),
(365, 'fotos/1758721021-felix-jamba-chaumue-baptista.jpg', NULL, '0000-00-00 00:00:00'),
(387, 'images.jpg', NULL, '0000-00-00 00:00:00'),
(483, 'imagescao.jpg', NULL, '0000-00-00 00:00:00'),
(533, 'download.jpg', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcao`
--

DROP TABLE IF EXISTS `funcao`;
CREATE TABLE IF NOT EXISTS `funcao` (
  `id_funcao` int NOT NULL AUTO_INCREMENT,
  `nome_funcao` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_funcao`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `funcao`
--

INSERT INTO `funcao` (`id_funcao`, `nome_funcao`) VALUES
(1, 'Comando'),
(2, 'Direcção e Chefia'),
(3, 'Estado Maior'),
(4, 'Execução'),
(5, 'Indefinido');

-- --------------------------------------------------------

--
-- Estrutura da tabela `habilitacaoliteraria`
--

DROP TABLE IF EXISTS `habilitacaoliteraria`;
CREATE TABLE IF NOT EXISTS `habilitacaoliteraria` (
  `habilitacao_id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`habilitacao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `habilitacaoliteraria`
--

INSERT INTO `habilitacaoliteraria` (`habilitacao_id`, `descricao`) VALUES
(1, '1ªClasse'),
(2, '2ªClasse'),
(3, '3ªClasse'),
(4, '4ªClasse'),
(5, '5ªClasse'),
(6, '6ªClasse'),
(7, '7ªClasse'),
(8, '8ªClasse'),
(9, '9ªClasse'),
(10, '10ªClasse'),
(11, '11ªClasse'),
(12, '12ªClasse'),
(13, 'Bacharel'),
(14, 'Licenciado(a)'),
(15, 'Mestre'),
(16, 'Doutor(a)');

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao`
--

DROP TABLE IF EXISTS `instituicao`;
CREATE TABLE IF NOT EXISTS `instituicao` (
  `id_instituicao` int NOT NULL AUTO_INCREMENT,
  `nome_instituicao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo` int DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`id_instituicao`) USING BTREE,
  KEY `id_pais` (`id_pais`) USING BTREE,
  KEY `tipo_instuicao` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `instituicao`
--

INSERT INTO `instituicao` (`id_instituicao`, `nome_instituicao`, `tipo`, `id_pais`) VALUES
(1, 'Instituto Superior Técnico Militar', 1, 1),
(2, 'Universidade Técnica de Angola (UTANGA)', 2, 1),
(3, 'Universidade Jean Piaget', 2, 1),
(4, 'Instituto Superior do Exército', 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(96, '2025_03_12_094755_create_adms_cads_usuarios_table', 0),
(97, '2025_03_12_094755_create_adms_confs_emails_table', 0),
(98, '2025_03_12_094755_create_adms_cors_table', 0),
(99, '2025_03_12_094755_create_adms_grps_pgs_table', 0),
(100, '2025_03_12_094755_create_adms_menus_table', 0),
(101, '2025_03_12_094755_create_adms_nivacs_pgs_table', 0),
(102, '2025_03_12_094755_create_adms_niveis_acessos_table', 0),
(103, '2025_03_12_094755_create_adms_paginas_table', 0),
(104, '2025_03_12_094755_create_adms_sits_table', 0),
(105, '2025_03_12_094755_create_adms_sits_pgs_table', 0),
(106, '2025_03_12_094755_create_adms_sits_usuarios_table', 0),
(107, '2025_03_12_094755_create_adms_tps_pgs_table', 0),
(108, '2025_03_12_094755_create_adms_usuarios_table', 0),
(109, '2025_03_12_094755_create_cargo_table', 0),
(110, '2025_03_12_094755_create_continente_table', 0),
(111, '2025_03_12_094755_create_coordenadas_geo_table', 0),
(112, '2025_03_12_094755_create_curso_table', 0),
(113, '2025_03_12_094755_create_curso_frequentado_table', 0),
(114, '2025_03_12_094755_create_dc_municipio_table', 0),
(115, '2025_03_12_094755_create_dc_provincia_table', 0),
(116, '2025_03_12_094755_create_dcm_classes_table', 0),
(117, '2025_03_12_094755_create_dcm_postosmilitares_table', 0),
(118, '2025_03_12_094755_create_dcm_ramo_table', 0),
(119, '2025_03_12_094755_create_dcm_situacao_quadro_table', 0),
(120, '2025_03_12_094755_create_dcm_situacao_servi__o_table', 0),
(121, '2025_03_12_094755_create_do_ramos_table', 0),
(122, '2025_03_12_094755_create_do_unidadesmilitares_table', 0),
(123, '2025_03_12_094755_create_documento_table', 0),
(124, '2025_03_12_094755_create_especialidade_table', 0),
(125, '2025_03_12_094755_create_estado_civil_table', 0),
(126, '2025_03_12_094755_create_estrutura_organica_table', 0),
(127, '2025_03_12_094755_create_foto_table', 0),
(128, '2025_03_12_094755_create_funcao_table', 0),
(129, '2025_03_12_094755_create_instituicao_table', 0),
(130, '2025_03_12_094755_create_nivel_curso_table', 0),
(131, '2025_03_12_094755_create_pais_table', 0),
(132, '2025_03_12_094755_create_pessoa_fisica_table', 0),
(133, '2025_03_12_094755_create_pessoa_juridica_table', 0),
(134, '2025_03_12_094755_create_quadro_especial_eo_table', 0),
(135, '2025_03_12_094755_create_sexo_table', 0),
(136, '2025_03_12_094755_create_tbcategoriapatente_table', 0),
(137, '2025_03_12_094755_create_tbgrupopatente_table', 0),
(138, '2025_03_12_094755_create_tbl_agregado_familiar_table', 0),
(139, '2025_03_12_094755_create_tbl_cargo_pessoa_table', 0),
(140, '2025_03_12_094755_create_tbl_contactos_table', 0),
(141, '2025_03_12_094755_create_tbl_dependencias_table', 0),
(142, '2025_03_12_094755_create_tbl_entidade_table', 0),
(143, '2025_03_12_094755_create_tbl_estrutura_sub_unidade_table', 0),
(144, '2025_03_12_094755_create_tbl_grauparentesco_table', 0),
(145, '2025_03_12_094755_create_tbl_grupo_lingua_table', 0),
(146, '2025_03_12_094755_create_tbl_grupo_tipo_subunidade_table', 0),
(147, '2025_03_12_094755_create_tbl_gsanguineo_table', 0),
(148, '2025_03_12_094755_create_tbl_historico_progressao_table', 0),
(149, '2025_03_12_094755_create_tbl_linguasfaladas_table', 0),
(150, '2025_03_12_094755_create_tbl_ordens_table', 0),
(151, '2025_03_12_094755_create_tbl_regiaomilitar_table', 0),
(152, '2025_03_12_094755_create_tbl_subdivisao_ueo_table', 0),
(153, '2025_03_12_094755_create_tbl_tipo_contacto_table', 0),
(154, '2025_03_12_094755_create_tbl_tipo_membro_table', 0),
(155, '2025_03_12_094755_create_tbl_tipo_subunidade_table', 0),
(156, '2025_03_12_094755_create_tbl_tipoordem_table', 0),
(157, '2025_03_12_094755_create_tbl_tipos_linguas_table', 0),
(158, '2025_03_12_094755_create_tbsituacaosvcmilitar_table', 0),
(159, '2025_03_12_094755_create_tipo_curso_table', 0),
(160, '2025_03_12_094755_create_tipo_documento_table', 0),
(161, '2025_03_12_094755_create_tipo_ueo_table', 0),
(162, '2025_03_12_094756_create_qry_cargo_pessoa_view', 0),
(163, '2025_03_12_094756_create_qry_eliminar_dependencia_view', 0),
(164, '2025_03_12_094756_create_qry_historico_ordem_view', 0),
(165, '2025_03_12_094756_create_qry_listapromocao_view', 0),
(166, '2025_03_12_094756_create_qry_reformados_view', 0),
(167, '2025_03_12_094756_create_qry_sem_dependencia_view', 0),
(168, '2025_03_12_094758_add_foreign_keys_to_cargo_table', 0),
(169, '2025_03_12_094758_add_foreign_keys_to_coordenadas_geo_table', 0),
(170, '2025_03_12_094758_add_foreign_keys_to_curso_table', 0),
(171, '2025_03_12_094758_add_foreign_keys_to_curso_frequentado_table', 0),
(172, '2025_03_12_094758_add_foreign_keys_to_dc_municipio_table', 0),
(173, '2025_03_12_094758_add_foreign_keys_to_dcm_classes_table', 0),
(174, '2025_03_12_094758_add_foreign_keys_to_dcm_postosmilitares_table', 0),
(175, '2025_03_12_094758_add_foreign_keys_to_do_unidadesmilitares_table', 0),
(176, '2025_03_12_094758_add_foreign_keys_to_documento_table', 0),
(177, '2025_03_12_094758_add_foreign_keys_to_especialidade_table', 0),
(178, '2025_03_12_094758_add_foreign_keys_to_estrutura_organica_table', 0),
(179, '2025_03_12_094758_add_foreign_keys_to_foto_table', 0),
(180, '2025_03_12_094758_add_foreign_keys_to_instituicao_table', 0),
(181, '2025_03_12_094758_add_foreign_keys_to_pais_table', 0),
(182, '2025_03_12_094758_add_foreign_keys_to_pessoa_juridica_table', 0),
(183, '2025_03_12_094758_add_foreign_keys_to_quadro_especial_eo_table', 0),
(184, '2025_03_12_094758_add_foreign_keys_to_tbgrupopatente_table', 0),
(185, '2025_03_12_094758_add_foreign_keys_to_tbl_cargo_pessoa_table', 0),
(186, '2025_03_12_094758_add_foreign_keys_to_tbl_contactos_table', 0),
(187, '2025_03_12_094758_add_foreign_keys_to_tbl_dependencias_table', 0),
(188, '2025_03_12_094758_add_foreign_keys_to_tbl_estrutura_sub_unidade_table', 0),
(189, '2025_03_12_094758_add_foreign_keys_to_tbl_regiaomilitar_table', 0),
(190, '2025_03_12_094758_add_foreign_keys_to_tbl_tipo_subunidade_table', 0),
(191, '0001_01_01_000000_create_users_table', 1),
(192, '0001_01_01_000001_create_cache_table', 1),
(193, '0001_01_01_000002_create_jobs_table', 1),
(194, '2024_03_15_100947_create_courses_table', 1),
(195, '2024_03_23_112419_alter_courses_add_price_table', 1),
(196, '2024_03_23_142749_create_classes_table', 1),
(197, '2024_03_24_085838_alter_classes_add_order_classe_table', 1),
(198, '2024_03_24_153241_create_audits_table', 1),
(199, '2024_03_30_075635_create_permission_tables', 1),
(200, '2024_03_31_113033_alter_permissions_add_title_table', 1),
(201, '2025_03_14_110715_create_adms_cads_usuarios_table', 0),
(202, '2025_03_14_110715_create_adms_confs_emails_table', 0),
(203, '2025_03_14_110715_create_adms_cors_table', 0),
(204, '2025_03_14_110715_create_adms_grps_pgs_table', 0),
(205, '2025_03_14_110715_create_adms_menus_table', 0),
(206, '2025_03_14_110715_create_adms_nivacs_pgs_table', 0),
(207, '2025_03_14_110715_create_adms_niveis_acessos_table', 0),
(208, '2025_03_14_110715_create_adms_paginas_table', 0),
(209, '2025_03_14_110715_create_adms_sits_table', 0),
(210, '2025_03_14_110715_create_adms_sits_pgs_table', 0),
(211, '2025_03_14_110715_create_adms_sits_usuarios_table', 0),
(212, '2025_03_14_110715_create_adms_tps_pgs_table', 0),
(213, '2025_03_14_110715_create_adms_usuarios_table', 0),
(214, '2025_03_14_110715_create_audits_table', 0),
(215, '2025_03_14_110715_create_cache_table', 0),
(216, '2025_03_14_110715_create_cache_locks_table', 0),
(217, '2025_03_14_110715_create_cargo_table', 0),
(218, '2025_03_14_110715_create_classes_table', 0),
(219, '2025_03_14_110715_create_continente_table', 0),
(220, '2025_03_14_110715_create_coordenadas_geo_table', 0),
(221, '2025_03_14_110715_create_courses_table', 0),
(222, '2025_03_14_110715_create_curso_table', 0),
(223, '2025_03_14_110715_create_curso_frequentado_table', 0),
(224, '2025_03_14_110715_create_dc_municipio_table', 0),
(225, '2025_03_14_110715_create_dc_provincia_table', 0),
(226, '2025_03_14_110715_create_dcm_classes_table', 0),
(227, '2025_03_14_110715_create_dcm_postosmilitares_table', 0),
(228, '2025_03_14_110715_create_dcm_ramo_table', 0),
(229, '2025_03_14_110715_create_dcm_situacao_quadro_table', 0),
(230, '2025_03_14_110715_create_dcm_situacao_servi__o_table', 0),
(231, '2025_03_14_110715_create_do_ramos_table', 0),
(232, '2025_03_14_110715_create_do_unidadesmilitares_table', 0),
(233, '2025_03_14_110715_create_documento_table', 0),
(234, '2025_03_14_110715_create_especialidade_table', 0),
(235, '2025_03_14_110715_create_estado_civil_table', 0),
(236, '2025_03_14_110715_create_estrutura_organica_table', 0),
(237, '2025_03_14_110715_create_failed_jobs_table', 0),
(238, '2025_03_14_110715_create_foto_table', 0),
(239, '2025_03_14_110715_create_funcao_table', 0),
(240, '2025_03_14_110715_create_instituicao_table', 0),
(241, '2025_03_14_110715_create_job_batches_table', 0),
(242, '2025_03_14_110715_create_jobs_table', 0),
(243, '2025_03_14_110715_create_model_has_permissions_table', 0),
(244, '2025_03_14_110715_create_model_has_roles_table', 0),
(245, '2025_03_14_110715_create_nivel_curso_table', 0),
(246, '2025_03_14_110715_create_pais_table', 0),
(247, '2025_03_14_110715_create_password_reset_tokens_table', 0),
(248, '2025_03_14_110715_create_permissions_table', 0),
(249, '2025_03_14_110715_create_pessoa_fisica_table', 0),
(250, '2025_03_14_110715_create_pessoa_juridica_table', 0),
(251, '2025_03_14_110715_create_quadro_especial_eo_table', 0),
(252, '2025_03_14_110715_create_role_has_permissions_table', 0),
(253, '2025_03_14_110715_create_roles_table', 0),
(254, '2025_03_14_110715_create_sessions_table', 0),
(255, '2025_03_14_110715_create_sexo_table', 0),
(256, '2025_03_14_110715_create_tbcategoriapatente_table', 0),
(257, '2025_03_14_110715_create_tbgrupopatente_table', 0),
(258, '2025_03_14_110715_create_tbl_agregado_familiar_table', 0),
(259, '2025_03_14_110715_create_tbl_cargo_pessoa_table', 0),
(260, '2025_03_14_110715_create_tbl_contactos_table', 0),
(261, '2025_03_14_110715_create_tbl_dependencias_table', 0),
(262, '2025_03_14_110715_create_tbl_entidade_table', 0),
(263, '2025_03_14_110715_create_tbl_estrutura_sub_unidade_table', 0),
(264, '2025_03_14_110715_create_tbl_grauparentesco_table', 0),
(265, '2025_03_14_110715_create_tbl_grupo_lingua_table', 0),
(266, '2025_03_14_110715_create_tbl_grupo_tipo_subunidade_table', 0),
(267, '2025_03_14_110715_create_tbl_gsanguineo_table', 0),
(268, '2025_03_14_110715_create_tbl_historico_progressao_table', 0),
(269, '2025_03_14_110715_create_tbl_linguasfaladas_table', 0),
(270, '2025_03_14_110715_create_tbl_ordens_table', 0),
(271, '2025_03_14_110715_create_tbl_regiaomilitar_table', 0),
(272, '2025_03_14_110715_create_tbl_subdivisao_ueo_table', 0),
(273, '2025_03_14_110715_create_tbl_tipo_contacto_table', 0),
(274, '2025_03_14_110715_create_tbl_tipo_membro_table', 0),
(275, '2025_03_14_110715_create_tbl_tipo_subunidade_table', 0),
(276, '2025_03_14_110715_create_tbl_tipoordem_table', 0),
(277, '2025_03_14_110715_create_tbl_tipos_linguas_table', 0),
(278, '2025_03_14_110715_create_tbsituacaosvcmilitar_table', 0),
(279, '2025_03_14_110715_create_tipo_curso_table', 0),
(280, '2025_03_14_110715_create_tipo_documento_table', 0),
(281, '2025_03_14_110715_create_tipo_ueo_table', 0),
(282, '2025_03_14_110715_create_users_table', 0),
(283, '2025_03_14_110716_create_qry_cargo_pessoa_view', 0),
(284, '2025_03_14_110716_create_qry_eliminar_dependencia_view', 0),
(285, '2025_03_14_110716_create_qry_historico_ordem_view', 0),
(286, '2025_03_14_110716_create_qry_listapromocao_view', 0),
(287, '2025_03_14_110716_create_qry_reformados_view', 0),
(288, '2025_03_14_110716_create_qry_sem_dependencia_view', 0),
(289, '2025_03_14_110718_add_foreign_keys_to_cargo_table', 0),
(290, '2025_03_14_110718_add_foreign_keys_to_classes_table', 0),
(291, '2025_03_14_110718_add_foreign_keys_to_coordenadas_geo_table', 0),
(292, '2025_03_14_110718_add_foreign_keys_to_curso_table', 0),
(293, '2025_03_14_110718_add_foreign_keys_to_curso_frequentado_table', 0),
(294, '2025_03_14_110718_add_foreign_keys_to_dc_municipio_table', 0),
(295, '2025_03_14_110718_add_foreign_keys_to_dcm_classes_table', 0),
(296, '2025_03_14_110718_add_foreign_keys_to_dcm_postosmilitares_table', 0),
(297, '2025_03_14_110718_add_foreign_keys_to_do_unidadesmilitares_table', 0),
(298, '2025_03_14_110718_add_foreign_keys_to_documento_table', 0),
(299, '2025_03_14_110718_add_foreign_keys_to_especialidade_table', 0),
(300, '2025_03_14_110718_add_foreign_keys_to_estrutura_organica_table', 0),
(301, '2025_03_14_110718_add_foreign_keys_to_foto_table', 0),
(302, '2025_03_14_110718_add_foreign_keys_to_instituicao_table', 0),
(303, '2025_03_14_110718_add_foreign_keys_to_model_has_permissions_table', 0),
(304, '2025_03_14_110718_add_foreign_keys_to_model_has_roles_table', 0),
(305, '2025_03_14_110718_add_foreign_keys_to_pais_table', 0),
(306, '2025_03_14_110718_add_foreign_keys_to_pessoa_juridica_table', 0),
(307, '2025_03_14_110718_add_foreign_keys_to_quadro_especial_eo_table', 0),
(308, '2025_03_14_110718_add_foreign_keys_to_role_has_permissions_table', 0),
(309, '2025_03_14_110718_add_foreign_keys_to_tbgrupopatente_table', 0),
(310, '2025_03_14_110718_add_foreign_keys_to_tbl_cargo_pessoa_table', 0),
(311, '2025_03_14_110718_add_foreign_keys_to_tbl_contactos_table', 0),
(312, '2025_03_14_110718_add_foreign_keys_to_tbl_dependencias_table', 0),
(313, '2025_03_14_110718_add_foreign_keys_to_tbl_estrutura_sub_unidade_table', 0),
(314, '2025_03_14_110718_add_foreign_keys_to_tbl_regiaomilitar_table', 0),
(315, '2025_03_14_110718_add_foreign_keys_to_tbl_tipo_subunidade_table', 0),
(316, '2025_03_17_085111_create_adms_cads_usuarios_table', 0),
(317, '2025_03_17_085111_create_adms_confs_emails_table', 0),
(318, '2025_03_17_085111_create_adms_cors_table', 0),
(319, '2025_03_17_085111_create_adms_grps_pgs_table', 0),
(320, '2025_03_17_085111_create_adms_menus_table', 0),
(321, '2025_03_17_085111_create_adms_nivacs_pgs_table', 0),
(322, '2025_03_17_085111_create_adms_niveis_acessos_table', 0),
(323, '2025_03_17_085111_create_adms_paginas_table', 0),
(324, '2025_03_17_085111_create_adms_sits_table', 0),
(325, '2025_03_17_085111_create_adms_sits_pgs_table', 0),
(326, '2025_03_17_085111_create_adms_sits_usuarios_table', 0),
(327, '2025_03_17_085111_create_adms_tps_pgs_table', 0),
(328, '2025_03_17_085111_create_adms_usuarios_table', 0),
(329, '2025_03_17_085111_create_audits_table', 0),
(330, '2025_03_17_085111_create_cache_table', 0),
(331, '2025_03_17_085111_create_cache_locks_table', 0),
(332, '2025_03_17_085111_create_cargo_table', 0),
(333, '2025_03_17_085111_create_classes_table', 0),
(334, '2025_03_17_085111_create_continente_table', 0),
(335, '2025_03_17_085111_create_coordenadas_geo_table', 0),
(336, '2025_03_17_085111_create_courses_table', 0),
(337, '2025_03_17_085111_create_curso_table', 0),
(338, '2025_03_17_085111_create_curso_frequentado_table', 0),
(339, '2025_03_17_085111_create_dc_municipio_table', 0),
(340, '2025_03_17_085111_create_dc_provincia_table', 0),
(341, '2025_03_17_085111_create_dcm_classes_table', 0),
(342, '2025_03_17_085111_create_dcm_postosmilitares_table', 0),
(343, '2025_03_17_085111_create_dcm_ramo_table', 0),
(344, '2025_03_17_085111_create_dcm_situacao_quadro_table', 0),
(345, '2025_03_17_085111_create_dcm_situacao_servi__o_table', 0),
(346, '2025_03_17_085111_create_do_ramos_table', 0),
(347, '2025_03_17_085111_create_do_unidadesmilitares_table', 0),
(348, '2025_03_17_085111_create_documento_table', 0),
(349, '2025_03_17_085111_create_especialidade_table', 0),
(350, '2025_03_17_085111_create_estado_civil_table', 0),
(351, '2025_03_17_085111_create_estrutura_organica_table', 0),
(352, '2025_03_17_085111_create_failed_jobs_table', 0),
(353, '2025_03_17_085111_create_foto_table', 0),
(354, '2025_03_17_085111_create_funcao_table', 0),
(355, '2025_03_17_085111_create_instituicao_table', 0),
(356, '2025_03_17_085111_create_job_batches_table', 0),
(357, '2025_03_17_085111_create_jobs_table', 0),
(358, '2025_03_17_085111_create_model_has_permissions_table', 0),
(359, '2025_03_17_085111_create_model_has_roles_table', 0),
(360, '2025_03_17_085111_create_nivel_curso_table', 0),
(361, '2025_03_17_085111_create_pais_table', 0),
(362, '2025_03_17_085111_create_password_reset_tokens_table', 0),
(363, '2025_03_17_085111_create_permissions_table', 0),
(364, '2025_03_17_085111_create_pessoa_fisica_table', 0),
(365, '2025_03_17_085111_create_pessoa_juridica_table', 0),
(366, '2025_03_17_085111_create_quadro_especial_eo_table', 0),
(367, '2025_03_17_085111_create_role_has_permissions_table', 0),
(368, '2025_03_17_085111_create_roles_table', 0),
(369, '2025_03_17_085111_create_sessions_table', 0),
(370, '2025_03_17_085111_create_sexo_table', 0),
(371, '2025_03_17_085111_create_tbcategoriapatente_table', 0),
(372, '2025_03_17_085111_create_tbgrupopatente_table', 0),
(373, '2025_03_17_085111_create_tbl_agregado_familiar_table', 0),
(374, '2025_03_17_085111_create_tbl_cargo_pessoa_table', 0),
(375, '2025_03_17_085111_create_tbl_contactos_table', 0),
(376, '2025_03_17_085111_create_tbl_dependencias_table', 0),
(377, '2025_03_17_085111_create_tbl_entidade_table', 0),
(378, '2025_03_17_085111_create_tbl_estrutura_sub_unidade_table', 0),
(379, '2025_03_17_085111_create_tbl_grauparentesco_table', 0),
(380, '2025_03_17_085111_create_tbl_grupo_lingua_table', 0),
(381, '2025_03_17_085111_create_tbl_grupo_tipo_subunidade_table', 0),
(382, '2025_03_17_085111_create_tbl_gsanguineo_table', 0),
(383, '2025_03_17_085111_create_tbl_historico_progressao_table', 0),
(384, '2025_03_17_085111_create_tbl_linguasfaladas_table', 0),
(385, '2025_03_17_085111_create_tbl_ordens_table', 0),
(386, '2025_03_17_085111_create_tbl_regiaomilitar_table', 0),
(387, '2025_03_17_085111_create_tbl_subdivisao_ueo_table', 0),
(388, '2025_03_17_085111_create_tbl_tipo_contacto_table', 0),
(389, '2025_03_17_085111_create_tbl_tipo_membro_table', 0),
(390, '2025_03_17_085111_create_tbl_tipo_subunidade_table', 0),
(391, '2025_03_17_085111_create_tbl_tipoordem_table', 0),
(392, '2025_03_17_085111_create_tbl_tipos_linguas_table', 0),
(393, '2025_03_17_085111_create_tbsituacaosvcmilitar_table', 0),
(394, '2025_03_17_085111_create_tipo_curso_table', 0),
(395, '2025_03_17_085111_create_tipo_documento_table', 0),
(396, '2025_03_17_085111_create_tipo_ueo_table', 0),
(397, '2025_03_17_085111_create_users_table', 0),
(398, '2025_03_17_085112_create_qry_cargo_pessoa_view', 0),
(399, '2025_03_17_085112_create_qry_eliminar_dependencia_view', 0),
(400, '2025_03_17_085112_create_qry_historico_ordem_view', 0),
(401, '2025_03_17_085112_create_qry_listapromocao_view', 0),
(402, '2025_03_17_085112_create_qry_reformados_view', 0),
(403, '2025_03_17_085112_create_qry_sem_dependencia_view', 0),
(404, '2025_03_17_085114_add_foreign_keys_to_cargo_table', 0),
(405, '2025_03_17_085114_add_foreign_keys_to_classes_table', 0),
(406, '2025_03_17_085114_add_foreign_keys_to_coordenadas_geo_table', 0),
(407, '2025_03_17_085114_add_foreign_keys_to_curso_table', 0),
(408, '2025_03_17_085114_add_foreign_keys_to_curso_frequentado_table', 0),
(409, '2025_03_17_085114_add_foreign_keys_to_dc_municipio_table', 0),
(410, '2025_03_17_085114_add_foreign_keys_to_dcm_classes_table', 0),
(411, '2025_03_17_085114_add_foreign_keys_to_dcm_postosmilitares_table', 0),
(412, '2025_03_17_085114_add_foreign_keys_to_do_unidadesmilitares_table', 0),
(413, '2025_03_17_085114_add_foreign_keys_to_documento_table', 0),
(414, '2025_03_17_085114_add_foreign_keys_to_especialidade_table', 0),
(415, '2025_03_17_085114_add_foreign_keys_to_estrutura_organica_table', 0),
(416, '2025_03_17_085114_add_foreign_keys_to_foto_table', 0),
(417, '2025_03_17_085114_add_foreign_keys_to_instituicao_table', 0),
(418, '2025_03_17_085114_add_foreign_keys_to_model_has_permissions_table', 0),
(419, '2025_03_17_085114_add_foreign_keys_to_model_has_roles_table', 0),
(420, '2025_03_17_085114_add_foreign_keys_to_pais_table', 0),
(421, '2025_03_17_085114_add_foreign_keys_to_pessoa_juridica_table', 0),
(422, '2025_03_17_085114_add_foreign_keys_to_quadro_especial_eo_table', 0),
(423, '2025_03_17_085114_add_foreign_keys_to_role_has_permissions_table', 0),
(424, '2025_03_17_085114_add_foreign_keys_to_tbgrupopatente_table', 0),
(425, '2025_03_17_085114_add_foreign_keys_to_tbl_cargo_pessoa_table', 0),
(426, '2025_03_17_085114_add_foreign_keys_to_tbl_contactos_table', 0),
(427, '2025_03_17_085114_add_foreign_keys_to_tbl_dependencias_table', 0),
(428, '2025_03_17_085114_add_foreign_keys_to_tbl_estrutura_sub_unidade_table', 0),
(429, '2025_03_17_085114_add_foreign_keys_to_tbl_regiaomilitar_table', 0),
(430, '2025_03_17_085114_add_foreign_keys_to_tbl_tipo_subunidade_table', 0),
(431, '2025_03_25_130524_create_adms_cads_usuarios_table', 0),
(432, '2025_03_25_130524_create_adms_confs_emails_table', 0),
(433, '2025_03_25_130524_create_adms_cors_table', 0),
(434, '2025_03_25_130524_create_adms_grps_pgs_table', 0),
(435, '2025_03_25_130524_create_adms_menus_table', 0),
(436, '2025_03_25_130524_create_adms_nivacs_pgs_table', 0),
(437, '2025_03_25_130524_create_adms_niveis_acessos_table', 0),
(438, '2025_03_25_130524_create_adms_paginas_table', 0),
(439, '2025_03_25_130524_create_adms_sits_table', 0),
(440, '2025_03_25_130524_create_adms_sits_pgs_table', 0),
(441, '2025_03_25_130524_create_adms_sits_usuarios_table', 0),
(442, '2025_03_25_130524_create_adms_tps_pgs_table', 0),
(443, '2025_03_25_130524_create_adms_usuarios_table', 0),
(444, '2025_03_25_130524_create_audits_table', 0),
(445, '2025_03_25_130524_create_cache_table', 0),
(446, '2025_03_25_130524_create_cache_locks_table', 0),
(447, '2025_03_25_130524_create_cargo_table', 0),
(448, '2025_03_25_130524_create_classes_table', 0),
(449, '2025_03_25_130524_create_continente_table', 0),
(450, '2025_03_25_130524_create_coordenadas_geo_table', 0),
(451, '2025_03_25_130524_create_courses_table', 0),
(452, '2025_03_25_130524_create_curso_table', 0),
(453, '2025_03_25_130524_create_curso_frequentado_table', 0),
(454, '2025_03_25_130524_create_dc_municipio_table', 0),
(455, '2025_03_25_130524_create_dc_provincia_table', 0),
(456, '2025_03_25_130524_create_dcm_classes_table', 0),
(457, '2025_03_25_130524_create_dcm_postosmilitares_table', 0),
(458, '2025_03_25_130524_create_dcm_ramo_table', 0),
(459, '2025_03_25_130524_create_dcm_situacao_quadro_table', 0),
(460, '2025_03_25_130524_create_dcm_situacao_servi__o_table', 0),
(461, '2025_03_25_130524_create_do_ramos_table', 0),
(462, '2025_03_25_130524_create_do_unidadesmilitares_table', 0),
(463, '2025_03_25_130524_create_documento_table', 0),
(464, '2025_03_25_130524_create_especialidade_table', 0),
(465, '2025_03_25_130524_create_estado_civil_table', 0),
(466, '2025_03_25_130524_create_estrutura_organica_table', 0),
(467, '2025_03_25_130524_create_failed_jobs_table', 0),
(468, '2025_03_25_130524_create_foto_table', 0),
(469, '2025_03_25_130524_create_funcao_table', 0),
(470, '2025_03_25_130524_create_habilitacaoLiteraria_table', 0),
(471, '2025_03_25_130524_create_instituicao_table', 0),
(472, '2025_03_25_130524_create_job_batches_table', 0),
(473, '2025_03_25_130524_create_jobs_table', 0),
(474, '2025_03_25_130524_create_model_has_permissions_table', 0),
(475, '2025_03_25_130524_create_model_has_roles_table', 0),
(476, '2025_03_25_130524_create_nivel_curso_table', 0),
(477, '2025_03_25_130524_create_pais_table', 0),
(478, '2025_03_25_130524_create_password_reset_tokens_table', 0),
(479, '2025_03_25_130524_create_permissions_table', 0),
(480, '2025_03_25_130524_create_pessoa_fisica_table', 0),
(481, '2025_03_25_130524_create_pessoa_juridica_table', 0),
(482, '2025_03_25_130524_create_quadro_especial_eo_table', 0),
(483, '2025_03_25_130524_create_role_has_permissions_table', 0),
(484, '2025_03_25_130524_create_roles_table', 0),
(485, '2025_03_25_130524_create_sessions_table', 0),
(486, '2025_03_25_130524_create_sexo_table', 0),
(487, '2025_03_25_130524_create_tbcategoriapatente_table', 0),
(488, '2025_03_25_130524_create_tbgrupopatente_table', 0),
(489, '2025_03_25_130524_create_tbl_agregado_familiar_table', 0),
(490, '2025_03_25_130524_create_tbl_cargo_pessoa_table', 0),
(491, '2025_03_25_130524_create_tbl_contactos_table', 0),
(492, '2025_03_25_130524_create_tbl_dependencias_table', 0),
(493, '2025_03_25_130524_create_tbl_entidade_table', 0),
(494, '2025_03_25_130524_create_tbl_estrutura_sub_unidade_table', 0),
(495, '2025_03_25_130524_create_tbl_grauparentesco_table', 0),
(496, '2025_03_25_130524_create_tbl_grupo_lingua_table', 0),
(497, '2025_03_25_130524_create_tbl_grupo_tipo_subunidade_table', 0),
(498, '2025_03_25_130524_create_tbl_gsanguineo_table', 0),
(499, '2025_03_25_130524_create_tbl_historico_progressao_table', 0),
(500, '2025_03_25_130524_create_tbl_linguasfaladas_table', 0),
(501, '2025_03_25_130524_create_tbl_ordens_table', 0),
(502, '2025_03_25_130524_create_tbl_regiaomilitar_table', 0),
(503, '2025_03_25_130524_create_tbl_subdivisao_ueo_table', 0),
(504, '2025_03_25_130524_create_tbl_tipo_contacto_table', 0),
(505, '2025_03_25_130524_create_tbl_tipo_membro_table', 0),
(506, '2025_03_25_130524_create_tbl_tipo_subunidade_table', 0),
(507, '2025_03_25_130524_create_tbl_tipoordem_table', 0),
(508, '2025_03_25_130524_create_tbl_tipos_linguas_table', 0),
(509, '2025_03_25_130524_create_tbsituacaosvcmilitar_table', 0),
(510, '2025_03_25_130524_create_tipo_curso_table', 0),
(511, '2025_03_25_130524_create_tipo_documento_table', 0),
(512, '2025_03_25_130524_create_tipo_ueo_table', 0),
(513, '2025_03_25_130524_create_users_table', 0),
(514, '2025_03_25_130525_create_qry_cargo_pessoa_view', 0),
(515, '2025_03_25_130525_create_qry_eliminar_dependencia_view', 0),
(516, '2025_03_25_130525_create_qry_historico_ordem_view', 0),
(517, '2025_03_25_130525_create_qry_listapromocao_view', 0),
(518, '2025_03_25_130525_create_qry_reformados_view', 0),
(519, '2025_03_25_130525_create_qry_sem_dependencia_view', 0),
(520, '2025_03_25_130527_add_foreign_keys_to_cargo_table', 0),
(521, '2025_03_25_130527_add_foreign_keys_to_classes_table', 0),
(522, '2025_03_25_130527_add_foreign_keys_to_coordenadas_geo_table', 0),
(523, '2025_03_25_130527_add_foreign_keys_to_curso_table', 0),
(524, '2025_03_25_130527_add_foreign_keys_to_curso_frequentado_table', 0),
(525, '2025_03_25_130527_add_foreign_keys_to_dc_municipio_table', 0),
(526, '2025_03_25_130527_add_foreign_keys_to_dcm_classes_table', 0),
(527, '2025_03_25_130527_add_foreign_keys_to_dcm_postosmilitares_table', 0),
(528, '2025_03_25_130527_add_foreign_keys_to_do_unidadesmilitares_table', 0),
(529, '2025_03_25_130527_add_foreign_keys_to_documento_table', 0),
(530, '2025_03_25_130527_add_foreign_keys_to_especialidade_table', 0),
(531, '2025_03_25_130527_add_foreign_keys_to_estrutura_organica_table', 0),
(532, '2025_03_25_130527_add_foreign_keys_to_foto_table', 0),
(533, '2025_03_25_130527_add_foreign_keys_to_instituicao_table', 0),
(534, '2025_03_25_130527_add_foreign_keys_to_model_has_permissions_table', 0),
(535, '2025_03_25_130527_add_foreign_keys_to_model_has_roles_table', 0),
(536, '2025_03_25_130527_add_foreign_keys_to_pais_table', 0),
(537, '2025_03_25_130527_add_foreign_keys_to_pessoa_fisica_table', 0),
(538, '2025_03_25_130527_add_foreign_keys_to_pessoa_juridica_table', 0),
(539, '2025_03_25_130527_add_foreign_keys_to_quadro_especial_eo_table', 0),
(540, '2025_03_25_130527_add_foreign_keys_to_role_has_permissions_table', 0),
(541, '2025_03_25_130527_add_foreign_keys_to_tbgrupopatente_table', 0),
(542, '2025_03_25_130527_add_foreign_keys_to_tbl_cargo_pessoa_table', 0),
(543, '2025_03_25_130527_add_foreign_keys_to_tbl_contactos_table', 0),
(544, '2025_03_25_130527_add_foreign_keys_to_tbl_dependencias_table', 0),
(545, '2025_03_25_130527_add_foreign_keys_to_tbl_estrutura_sub_unidade_table', 0),
(546, '2025_03_25_130527_add_foreign_keys_to_tbl_regiaomilitar_table', 0),
(547, '2025_03_25_130527_add_foreign_keys_to_tbl_tipo_subunidade_table', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 1),
(5, 'App\\Models\\User', 1),
(6, 'App\\Models\\User', 1),
(19, 'App\\Models\\User', 1),
(20, 'App\\Models\\User', 1),
(21, 'App\\Models\\User', 1),
(22, 'App\\Models\\User', 1),
(23, 'App\\Models\\User', 1),
(24, 'App\\Models\\User', 1),
(25, 'App\\Models\\User', 1),
(26, 'App\\Models\\User', 1),
(27, 'App\\Models\\User', 1),
(28, 'App\\Models\\User', 1),
(29, 'App\\Models\\User', 1),
(35, 'App\\Models\\User', 1),
(36, 'App\\Models\\User', 1),
(37, 'App\\Models\\User', 1),
(38, 'App\\Models\\User', 1),
(40, 'App\\Models\\User', 1),
(41, 'App\\Models\\User', 1),
(42, 'App\\Models\\User', 1),
(46, 'App\\Models\\User', 1),
(47, 'App\\Models\\User', 1),
(48, 'App\\Models\\User', 1),
(50, 'App\\Models\\User', 1),
(51, 'App\\Models\\User', 1),
(52, 'App\\Models\\User', 1),
(53, 'App\\Models\\User', 1),
(54, 'App\\Models\\User', 1),
(55, 'App\\Models\\User', 1),
(56, 'App\\Models\\User', 1),
(57, 'App\\Models\\User', 1),
(58, 'App\\Models\\User', 1),
(59, 'App\\Models\\User', 1),
(61, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 2),
(35, 'App\\Models\\User', 2),
(36, 'App\\Models\\User', 2),
(37, 'App\\Models\\User', 2),
(38, 'App\\Models\\User', 2),
(40, 'App\\Models\\User', 2),
(41, 'App\\Models\\User', 2),
(42, 'App\\Models\\User', 2),
(46, 'App\\Models\\User', 2),
(47, 'App\\Models\\User', 2),
(50, 'App\\Models\\User', 2),
(51, 'App\\Models\\User', 2),
(54, 'App\\Models\\User', 2),
(55, 'App\\Models\\User', 2),
(56, 'App\\Models\\User', 2),
(57, 'App\\Models\\User', 2),
(58, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 4),
(35, 'App\\Models\\User', 4),
(36, 'App\\Models\\User', 4),
(37, 'App\\Models\\User', 4),
(38, 'App\\Models\\User', 4),
(40, 'App\\Models\\User', 4),
(41, 'App\\Models\\User', 4),
(42, 'App\\Models\\User', 4),
(46, 'App\\Models\\User', 4),
(47, 'App\\Models\\User', 4),
(48, 'App\\Models\\User', 4),
(50, 'App\\Models\\User', 4),
(51, 'App\\Models\\User', 4),
(54, 'App\\Models\\User', 4),
(55, 'App\\Models\\User', 4),
(56, 'App\\Models\\User', 4),
(57, 'App\\Models\\User', 4),
(58, 'App\\Models\\User', 4),
(59, 'App\\Models\\User', 4),
(61, 'App\\Models\\User', 4),
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 5),
(5, 'App\\Models\\User', 5),
(35, 'App\\Models\\User', 5),
(36, 'App\\Models\\User', 5),
(37, 'App\\Models\\User', 5),
(38, 'App\\Models\\User', 5),
(40, 'App\\Models\\User', 5),
(41, 'App\\Models\\User', 5),
(42, 'App\\Models\\User', 5),
(46, 'App\\Models\\User', 5),
(47, 'App\\Models\\User', 5),
(48, 'App\\Models\\User', 5),
(50, 'App\\Models\\User', 5),
(51, 'App\\Models\\User', 5),
(54, 'App\\Models\\User', 5),
(55, 'App\\Models\\User', 5),
(56, 'App\\Models\\User', 5),
(57, 'App\\Models\\User', 5),
(58, 'App\\Models\\User', 5),
(59, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 6),
(3, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 6),
(6, 'App\\Models\\User', 6),
(19, 'App\\Models\\User', 6),
(20, 'App\\Models\\User', 6),
(21, 'App\\Models\\User', 6),
(22, 'App\\Models\\User', 6),
(23, 'App\\Models\\User', 6),
(24, 'App\\Models\\User', 6),
(25, 'App\\Models\\User', 6),
(26, 'App\\Models\\User', 6),
(27, 'App\\Models\\User', 6),
(28, 'App\\Models\\User', 6),
(29, 'App\\Models\\User', 6),
(35, 'App\\Models\\User', 6),
(36, 'App\\Models\\User', 6),
(37, 'App\\Models\\User', 6),
(38, 'App\\Models\\User', 6),
(40, 'App\\Models\\User', 6),
(41, 'App\\Models\\User', 6),
(42, 'App\\Models\\User', 6),
(46, 'App\\Models\\User', 6),
(47, 'App\\Models\\User', 6),
(48, 'App\\Models\\User', 6),
(50, 'App\\Models\\User', 6),
(51, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 4),
(3, 'App\\Models\\User', 5),
(1, 'App\\Models\\User', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `municipio`
--

DROP TABLE IF EXISTS `municipio`;
CREATE TABLE IF NOT EXISTS `municipio` (
  `idmunicipio` int NOT NULL AUTO_INCREMENT,
  `municipio` varchar(50) NOT NULL,
  `idprovincia` int NOT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `fk_provincia_1` (`idprovincia`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `municipio`
--

INSERT INTO `municipio` (`idmunicipio`, `municipio`, `idprovincia`) VALUES
(1, 'Ambriz', 3),
(2, 'Bula Atumba', 3),
(3, 'Rangel', 13),
(4, 'Dande', 3),
(5, 'Maianga', 13),
(7, 'Nambuangongo', 3),
(9, 'Pango Aluquém', 3),
(10, 'Balombo', 1),
(11, 'Baia Farta', 1),
(12, 'Benguela', 1),
(13, 'Bocoio', 1),
(14, 'Caimbambo', 1),
(15, 'Catumbela', 1),
(16, 'Chongoroi', 1),
(17, 'Cubal', 1),
(18, 'Ganda', 1),
(19, 'Lobito', 1),
(20, 'Andulo', 2),
(21, 'Camacupa', 2),
(22, 'Catabola', 2),
(23, 'Chinguar', 2),
(24, 'Chitembo', 2),
(25, 'Cuemba', 2),
(26, 'Cunhinga', 2),
(27, 'Cuito', 2),
(28, 'Nharêa', 2),
(29, 'Belize', 4),
(30, 'Buco-Zau', 4),
(31, 'Cabinda', 4),
(32, 'Cacongo', 4),
(33, 'Calai', 21),
(34, 'Cuangar', 21),
(35, 'Cuchi', 21),
(36, 'Cuito Cuanavale', 10),
(37, 'Dirico', 10),
(38, 'Longa', 21),
(39, 'Mavinga', 10),
(40, 'Menongue', 21),
(41, 'Nancova', 21),
(42, 'Rivungo', 10),
(43, 'Cahama', 5),
(44, 'Cuanhama', 5),
(45, 'Curoca', 5),
(46, 'Cuvelai', 5),
(47, 'Namacunde', 5),
(48, 'Ombadja', 5),
(49, 'Chiéde', 5),
(50, 'Bailundo', 7),
(51, 'Catchiungo', 7),
(52, 'Caála', 7),
(53, 'Ecunha', 7),
(54, 'Huambo', 7),
(55, 'Londuimbali', 7),
(56, 'Longonjo', 7),
(57, 'Mungo', 7),
(58, 'Chicala Choloanga', 7),
(59, 'Chinjenje', 7),
(60, 'Ucuma', 7),
(61, 'Caconda', 8),
(62, 'Cacula', 8),
(63, 'Caluquembe', 8),
(64, 'Dongo', 8),
(65, 'Chibia', 8),
(66, 'Chicomba', 8),
(67, 'Chipindo', 8),
(68, 'Cuvango', 8),
(69, 'Humpata', 8),
(70, 'Jamba Mineira', 8),
(71, 'Lubango', 8),
(72, 'Matala', 8),
(73, 'Quilengues', 8),
(74, 'Quipungo', 8),
(75, 'Ambaca', 11),
(76, 'Banga', 11),
(77, 'Bolongongo', 11),
(78, 'Cambambe', 11),
(79, 'Cazengo', 11),
(80, 'Golungo Alto', 11),
(81, 'Aldeia Nova', 11),
(82, 'Gonguembo', 11),
(83, 'Lucala', 11),
(84, 'Quiculungo', 11),
(85, 'Samba Cajú', 11),
(87, 'Boa Entrada', 12),
(88, 'Cassongue', 12),
(89, 'Muxaluando', 3),
(90, 'Conda', 12),
(91, 'Ebo', 12),
(92, 'Quenha', 12),
(93, 'Mussende', 12),
(94, 'Porto Amboím', 12),
(96, 'Quibala', 12),
(97, 'Quilenda', 12),
(98, 'Seles', 12),
(99, 'Sumbe', 12),
(100, 'Waku Kungo', 12),
(101, 'Belas', 13),
(102, 'Cacuaco', 13),
(103, 'Cazenga', 13),
(104, 'Mussulo', 13),
(105, 'Ingombota', 13),
(106, 'Sambizanga', 13),
(107, 'Cambulo', 14),
(108, 'Capenda Camulemba', 14),
(109, 'Caungula', 14),
(110, 'Chitato', 14),
(112, 'Cuango', 14),
(113, 'Cuílo', 14),
(114, 'Lubalo', 14),
(115, 'Lucapa', 14),
(116, 'Xá-Muteba', 14),
(117, 'Cacolo', 15),
(118, 'Dala', 15),
(119, 'Muconda', 15),
(120, 'Saurimo', 15),
(121, 'Cacuso', 16),
(122, 'Calandula', 16),
(123, 'Cambundi Catembo', 16),
(124, 'Cangandala', 16),
(125, 'Cahombo', 16),
(126, 'Kiwaba Nzoji', 16),
(127, 'Kunda dya Baze', 16),
(128, 'Luquembo', 16),
(129, 'Malanje', 16),
(130, 'Marimba', 16),
(131, 'Massango', 16),
(132, 'Quêssua', 16),
(133, 'Quela', 16),
(134, 'Quirima', 16),
(135, 'Caianda', 22),
(136, 'Lóvua do Zambeze', 22),
(137, 'Camanongue', 17),
(138, 'Léua', 17),
(139, 'Luau', 22),
(140, 'Luacano', 22),
(141, 'Lago Dilolo', 22),
(142, 'Luena', 17),
(143, 'Ringoma', 2),
(144, 'Bibala', 18),
(145, 'Camucuio', 18),
(146, 'Moçamedes', 18),
(147, 'Tômbua', 18),
(148, 'Virei', 18),
(149, 'Piri', 3),
(150, 'Ambuila', 19),
(151, 'Bembe', 19),
(152, 'Quibaxe', 3),
(153, 'Bungo', 19),
(154, 'Damba', 19),
(155, 'Barra do Dande', 3),
(156, 'Milunga', 19),
(157, 'Mucaba', 19),
(158, 'Negage', 19),
(159, 'Puri', 19),
(160, 'Quimbele', 19),
(161, 'Dange Quitexe', 19),
(162, 'Sanza Pombo', 19),
(163, 'Songo', 19),
(164, 'Uige', 19),
(165, 'Maquela do Zombo', 19),
(166, 'Cuimba', 20),
(167, 'M\'banza Congo', 20),
(168, 'Noqui', 20),
(169, '\'zeto', 20),
(170, 'Soyo', 20),
(171, 'Tomboco', 20),
(173, 'Talatona', 13),
(174, 'Gabela', 12),
(175, 'Kilamba Kiaxi', 13),
(176, 'Viana', 13),
(177, 'Miconje', 4),
(178, 'Massabi', 4),
(179, 'Necuto', 4),
(180, 'Tando Zinze', 4),
(181, 'Liambo', 4),
(182, 'Ngoio', 4),
(183, 'Luvo', 20),
(184, 'Lufico', 20),
(185, 'Quelo', 20),
(186, 'Serra de Canda', 20),
(188, 'Quindeje', 20),
(189, 'Cangola', 19),
(190, 'Nova Esperança', 19),
(191, 'Sacandica', 19),
(192, 'Nsosso', 19),
(193, 'Lucunga', 19),
(194, 'Quipedro', 19),
(195, 'Massau', 19),
(196, 'Vista Alegre', 19),
(197, 'Alto Zaza', 19),
(198, 'Quicunzo', 3),
(199, 'Úcua', 3),
(200, 'Panguila', 3),
(201, 'Samba', 13),
(202, 'Camama', 13),
(203, 'Mulenvos', 13),
(204, 'Kilamba', 13),
(205, 'Hoji ya Henda', 13),
(206, 'Catete', 6),
(207, 'Quiçama', 6),
(208, 'Calumbo', 6),
(209, 'Cabiri', 6),
(210, 'Cabo Ledo', 6),
(211, 'Bom Jesus', 6),
(212, 'Sequele', 6),
(213, 'Massangano', 11),
(214, 'Cêrca', 11),
(215, 'Tango', 11),
(216, 'Terreiro', 11),
(217, 'Caculo Cabaça', 11),
(218, 'Luinga', 11),
(219, 'Calulo', 12),
(220, 'Quirimbo', 12),
(221, 'Munenga', 12),
(222, 'Quissongo', 12),
(223, 'Gungo', 12),
(224, 'Sanga', 12),
(225, 'Gangula', 12),
(226, 'Pambangala', 12),
(227, 'Condé', 12),
(229, 'Amboiva', 12),
(230, 'Lonhe', 12),
(231, 'Caculama', 16),
(232, 'Muquixi', 16),
(233, 'Cateco Cangola', 16),
(234, 'Mbanji ya Ngola', 16),
(235, 'Cuale', 16),
(236, 'Pungo a Ndongo', 16),
(237, 'Ngola Luiji', 16),
(238, 'Quihuhu', 16),
(239, 'Xandel', 16),
(240, 'Cambo Suinginge', 16),
(241, 'Milando', 16),
(242, 'Quitapa', 16),
(243, 'Capunda', 16),
(244, 'Dundo', 14),
(245, 'Lóvua', 14),
(246, 'Xá Casssau', 14),
(247, 'Camaxilo', 14),
(248, 'Luangue', 14),
(249, 'Luremo', 14),
(250, 'Canzar', 14),
(251, 'Cassanje Calucala', 14),
(252, 'Mussungue', 14),
(253, 'Cafunfo', 14),
(254, 'Chiluage', 15),
(255, 'Cassai-Sul', 15),
(256, 'Xassengue', 15),
(257, 'Alto Chicapa', 15),
(258, 'Sombo', 15),
(259, 'Muriege', 15),
(260, 'Luma Cassai', 15),
(261, 'Cazage', 15),
(262, 'Muangueji', 15),
(263, 'Cassengo', 15),
(264, 'Cangamba', 17),
(265, 'Lumbala Nguimbo', 17),
(266, 'Lutembo', 17),
(267, 'Lucusse', 17),
(268, 'Cangumbe', 17),
(269, 'Chiúme', 17),
(270, 'Alto Cuito', 17),
(271, 'Ninda', 17),
(272, 'Lutuai', 17),
(273, 'Cazombo', 22),
(274, 'Cameia', 22),
(275, 'Nana Candundo', 22),
(276, 'Macondo', 22),
(277, 'Luando', 2),
(278, 'Mumbué', 2),
(279, 'Calucinga', 2),
(280, 'Chicala', 2),
(281, 'Chipeta', 2),
(282, 'Umpulo', 2),
(283, 'Lúbia', 2),
(284, 'Cambândua', 2),
(285, 'Belo Horizonte', 2),
(286, 'Bimbe', 7),
(287, 'Sambo', 7),
(288, 'Galanga', 7),
(289, 'Alto Hama', 7),
(290, 'Chilata', 7),
(291, 'Cuima', 7),
(292, 'Egito Praia', 1),
(293, 'Chindumbo', 1),
(294, 'Dombe Grande', 1),
(295, 'Capupa', 1),
(296, 'Biópio', 1),
(297, 'Chila', 1),
(298, 'Chicuma', 1),
(299, 'Babaera', 1),
(300, 'Lambala', 1),
(301, 'Catengue', 1),
(302, 'Bolonguera', 1),
(303, 'Canhamela', 1),
(304, 'Navegantes', 1),
(305, 'Lucira', 18),
(306, 'Iona', 18),
(307, 'Sacomar', 18),
(308, 'Cacimbas', 18),
(309, 'Gambos', 8),
(310, 'Hoque', 8),
(311, 'Capelongo', 8),
(312, 'Chituto', 8),
(313, 'Capunda Cavilongo', 8),
(315, 'Viti Vivale', 8),
(316, 'Galangue', 8),
(317, 'Palanca', 8),
(318, 'Chicungo', 8),
(319, 'Nehone', 5),
(320, 'Humbe', 5),
(321, 'Mupa', 5),
(322, 'Naulila', 5),
(323, 'Chitado', 5),
(324, 'Cafima', 5),
(325, 'Chissuata', 5),
(326, 'Savate', 21),
(327, 'Caiundo', 21),
(328, 'Cutato', 21),
(329, 'Chinguanja', 21),
(330, 'Mavengue', 21),
(331, 'Xipundo', 10),
(332, 'Dima', 10),
(333, 'Luiana', 10),
(334, 'Mucusso', 10),
(335, 'Luengue', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `nivel_curso`
--

DROP TABLE IF EXISTS `nivel_curso`;
CREATE TABLE IF NOT EXISTS `nivel_curso` (
  `id_nivel_curso` int NOT NULL AUTO_INCREMENT,
  `nive_curso` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_nivel_curso`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `nivel_curso`
--

INSERT INTO `nivel_curso` (`id_nivel_curso`, `nive_curso`) VALUES
(1, 'Básico'),
(2, 'Médio'),
(3, 'Superior'),
(4, 'Pós-Graduação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `nome_pais` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_continente` int DEFAULT NULL,
  PRIMARY KEY (`id_pais`) USING BTREE,
  UNIQUE KEY `nome_pais` (`nome_pais`) USING BTREE,
  KEY `id_continente` (`id_continente`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`id_pais`, `nome_pais`, `id_continente`) VALUES
(1, 'Angola', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `title`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Listar usuários', 'index-user', 'web', '2025-03-12 19:40:15', '2025-03-12 19:40:15'),
(2, 'Visualizar usuário', 'show-user', 'web', '2025-03-12 19:40:16', '2025-03-12 19:40:16'),
(3, 'Cadastrar usuário', 'create-user', 'web', '2025-03-12 19:40:16', '2025-03-12 19:40:16'),
(4, 'Editar usuário', 'edit-user', 'web', '2025-03-12 19:40:17', '2025-03-12 19:40:17'),
(5, 'Editar senha do usuário', 'edit-user-password', 'web', '2025-03-12 19:40:17', '2025-03-12 19:40:17'),
(6, 'Apagar usuário', 'destroy-user', 'web', '2025-03-12 19:40:18', '2025-03-12 19:40:18'),
(19, 'Listar papéis', 'index-role', 'web', '2025-03-12 19:40:23', '2025-03-12 19:40:23'),
(20, 'Cadastrar papel', 'create-role', 'web', '2025-03-12 19:40:24', '2025-03-12 19:40:24'),
(21, 'Editar papel', 'edit-role', 'web', '2025-03-12 19:40:24', '2025-03-12 19:40:24'),
(22, 'Apagar papel', 'destroy-role', 'web', '2025-03-12 19:40:25', '2025-03-12 19:40:25'),
(23, 'Listar permissões do papel', 'index-role-permission', 'web', '2025-03-12 19:40:26', '2025-03-12 19:40:26'),
(24, 'Editar permissão do papel', 'update-role-permission', 'web', '2025-03-12 19:40:26', '2025-03-12 19:40:26'),
(25, 'Listar páginas', 'index-permission', 'web', '2025-03-12 19:40:27', '2025-03-12 19:40:27'),
(26, 'Visualizar página', 'show-permission', 'web', '2025-03-12 19:40:27', '2025-03-12 19:40:27'),
(27, 'Cadastrar página', 'create-permission', 'web', '2025-03-12 19:40:28', '2025-03-12 19:40:28'),
(28, 'Editar página', 'edit-permission', 'web', '2025-03-12 19:40:28', '2025-03-12 19:40:28'),
(29, 'Apagar página', 'destroy-permission', 'web', '2025-03-12 19:40:29', '2025-03-12 19:40:29'),
(35, 'Especialista - listar', 'index-specialist', 'web', '2025-06-11 11:13:19', '2025-06-11 11:13:19'),
(36, 'Especialista - visualizar', 'show-specialist', 'web', '2025-06-11 11:13:20', '2025-06-11 11:13:20'),
(37, 'Especialista - Cadastrar', 'create-specialist', 'web', '2025-06-11 11:13:21', '2025-06-11 11:13:21'),
(38, 'Especialista - editar', 'edit-specialist', 'web', '2025-06-11 11:13:21', '2025-06-11 11:13:21'),
(40, 'Listar reformados', 'index-retired', 'web', '2025-09-15 10:36:24', '2025-09-15 10:36:24'),
(41, 'Listar aniversariantes por data', 'birthdate', 'web', '2025-09-15 10:36:24', '2025-09-15 10:36:24'),
(42, 'Gerar PDF dos reformados', 'reformados/pdf', 'web', '2025-09-15 10:36:25', '2025-09-15 10:36:25'),
(46, 'Estrutura - remover pessoa do cargo', 'destroy-person', 'web', '2025-09-15 12:12:11', '2025-09-15 12:12:11'),
(47, 'Estrutura - cadeia de comando', 'comando', 'web', '2025-09-15 12:12:12', '2025-09-15 12:12:12'),
(48, 'Estrutura - pesquisar militar', 'structure.searchMilitar', 'web', '2025-09-15 12:12:13', '2025-09-15 12:12:13'),
(50, 'Estrutura - gerar geral', 'generate/general', 'web', '2025-09-15 12:12:14', '2025-09-15 12:12:14'),
(51, 'Estrutura - gerar específica', 'generate/specific', 'web', '2025-09-15 12:12:14', '2025-09-15 12:12:14'),
(52, 'Gerar PDF dos usuários', 'generate-pdf-user', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(53, 'Gerar CSV dos usuários', 'generate-csv-user', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(54, 'Estrutura - listar', 'index-structure', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(55, 'Estrutura - visualizar', 'show-structure', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(56, 'Estrutura - Cadastrar', 'create-structure', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(57, 'Estrutura - editar', 'edit-structure', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(58, 'Estrutura - remover', 'destroy-structure', 'web', '2025-11-03 12:07:05', '2025-11-03 12:07:05'),
(59, 'Especialista - remover', 'delete-specialist', 'web', '2025-11-03 13:24:18', '2025-11-03 13:24:18'),
(61, 'Estrutura - adicionar pessoa ao cargo', 'add-person', 'web', '2025-11-05 13:15:28', '2025-11-05 13:15:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
CREATE TABLE IF NOT EXISTS `pessoa_fisica` (
  `id_pessoa_fisica` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nome_pai` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nome_mae` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Data_Nascimento` date DEFAULT NULL,
  `Alcunha` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_sexo` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Altura` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Grupo_Sanguineo` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_estado_civil` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Residencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nro_Calcado` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nro_Camisa` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nro_Calca` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OutrasInformacoes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `habilitacao_id` int DEFAULT NULL,
  `id_naturalidade` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pessoa_fisica`) USING BTREE,
  KEY `habilitacao_id` (`habilitacao_id`),
  KEY `naturalidade` (`id_naturalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `pessoa_fisica`
--

INSERT INTO `pessoa_fisica` (`id_pessoa_fisica`, `nome`, `nome_pai`, `nome_mae`, `Data_Nascimento`, `Alcunha`, `id_sexo`, `Altura`, `Grupo_Sanguineo`, `id_estado_civil`, `Residencia`, `Nro_Calcado`, `Nro_Camisa`, `Nro_Calca`, `OutrasInformacoes`, `habilitacao_id`, `id_naturalidade`, `created`, `modify`) VALUES
(1, 'DOMINGOS JÚLIO CASSINDA', NULL, NULL, '1974-07-31', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'SABINO CASSINDA ANDRÉ', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'DOMINGOS APOLINÁRIO CUSTÓDIO DA COSTA', NULL, NULL, '1974-06-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'ANTÓNIO LOURENÇO HERMINIO', NULL, NULL, '1974-11-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'HORACIO AGOSTINHO NZANGE', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'FRANCISCO CANZALA JOÃO BOA', 'MATEUS BOA', 'SAMBA JOÃO', '1972-08-31', NULL, 'M', '1,64', NULL, 'S', 'GOLF 2, LUANDA', '41', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-16 15:04:46'),
(7, 'ANTÓNIO ALFREDO', 'ALFREDO BERNARDO', 'CONCEIÇÃO CAMACHO', '1964-03-15', NULL, 'M', NULL, NULL, 'S', 'LUANDA SUL VIANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-09 17:53:09'),
(8, 'LEMOS DIOGO ', 'Diogo Lemos', 'Maria Gonçalves', '1970-05-15', 'NGANGULA', 'M', '1,63', 'O+', 'S', NULL, '39', '46', '46', NULL, NULL, NULL, NULL, NULL),
(9, 'DANIEL JOÃO SILVA', 'Miguel João', 'Maria da Silva', '1966-12-19', 'CUDIMUENA', 'M', '1,67', 'O+', 'S', NULL, '42', '50', '50', NULL, NULL, NULL, NULL, NULL),
(10, 'JACOB TILO CANGOLO', 'Fernando Cangolo', 'Sara Vanolamo', '1969-01-24', NULL, 'M', '1,65', 'O+', 'S', NULL, '41', '42', '42', NULL, NULL, NULL, NULL, NULL),
(11, 'DANIEL VENTURA', 'Zacarias Ventura', 'Celeste Laurinda', '1973-08-25', 'VENTURA', 'M', '1,60', 'O+', 'S', NULL, '40', '42', '42', NULL, NULL, NULL, NULL, NULL),
(12, 'BENJAMIM TULINANYE', NULL, NULL, '1980-08-21', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'DONGALA MANUEL', 'KIMBUTA NESTOR', 'LUENGO PAULINA', '1973-12-25', NULL, 'M', '1,85', NULL, 'S', 'BAIRRO SAPU 2, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'JOSÉ ZINGA', NULL, NULL, '1970-12-23', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'GABRIEL SAMUEL MANGONGA', 'Samuel Chongolola', 'Isabel Elambo', '1971-09-08', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'MARTINHO LOPES LONDAKA', NULL, NULL, '1974-03-24', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'ANTÓNIO MOISÉS SANGUNGUI', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'PAULO LUCAS GOMES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'FERNANDO KUTONDA', NULL, NULL, '1975-12-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'RAIMUNDO JOÃO PANDA JIKO', 'João Panda Jiko', 'Antonica António dos Santos', '1974-12-17', 'Mr JIKO', 'M', NULL, NULL, 'S', 'C/Nº 83, Rua 24, BAIRRO REGEDORIA, VIANA LUANDA', '42', '46', '44', NULL, NULL, NULL, NULL, '2025-09-24 16:11:22'),
(21, 'HIGINO LAURINDO', 'Laurindo Muenho', 'Maria Chilombo', '1974-10-10', 'HIGINO', 'M', '1,76', 'B+', 'S', NULL, '44', '50', '50', NULL, NULL, NULL, NULL, NULL),
(22, 'NATANIEL JACOB', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'ANDRE ANTONIO SALVADOR VIEIRA', NULL, NULL, '1979-02-12', 'Salvador', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'DANIEL JOÃO CATACA', 'João Cateca', 'Joana Lemba', '1969-02-14', 'Cataca', 'M', '1,67', 'O+', 'S', 'Bairro Papelão ', '12', '20', '12', NULL, NULL, NULL, NULL, '2024-08-01 11:45:04'),
(25, 'GARCIA ANTÓNIO', 'ANTONIO MUANZA', 'MARCELINA MALUNGO', '1967-05-10', 'GARCIA', 'M', NULL, NULL, 'S', NULL, '41', '44', '44', NULL, NULL, NULL, NULL, '2025-11-07 07:56:01'),
(26, 'JOSÉ ANTÓNIO', NULL, NULL, '1968-06-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'AGOSTINHO LEMOS DA COSTA FARIA', NULL, NULL, '1976-08-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'BONDI ANTONIO PINTO JOAO', 'Domingos João', 'Maria Antonio Pinto', '1977-08-27', NULL, 'M', '1,89', 'A+', 'S', NULL, '44', '42', '42', NULL, NULL, NULL, NULL, NULL),
(29, 'GABRIEL PEQUENINO TIGANÁ', NULL, NULL, '1972-04-04', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'MANUEL NGUETOMENEVO', NULL, NULL, '1969-08-28', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'RAZÃO JOSE DA COSTA', 'Jose da Costa', 'Marcelina Bambi', '1970-02-04', 'Razão', 'M', '1,72', 'O+', 'S', 'Quixicongo ', '38', '20', '33', NULL, NULL, NULL, NULL, '2024-08-01 10:53:21'),
(32, 'FRANCISCO JANUARIO ALBINO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'PAULO LERES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'SIMÃO ERNESTO BARTOLOMEU', NULL, NULL, '1971-11-11', 'Zola', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'TOMÉ CARLOS NGOIA VAN-DUNÉM', NULL, NULL, '1976-06-10', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'JOSÉ JERÓNIMO SOUSA TCHICAMBI', 'João Tchicambi', 'Huambo Bailundo', '1971-10-10', 'José', 'M', '1.71', 'A+', 'S', 'Nada Costa enderenço', '38', '20', '40', NULL, NULL, NULL, NULL, '2024-08-05 12:12:56'),
(37, 'MOISES CHITATA FERRAMENTA NDULO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'TOMÁS CRISTOVÃO', NULL, NULL, '1967-07-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'DAVID BUNGA', 'David Bunda Nsuca', 'Juliana Teca Paxi', '1978-04-14', 'BUNGA', 'M', '1,66', 'A+', 'S', NULL, '40', '42', '42', NULL, NULL, NULL, NULL, NULL),
(40, 'JOSÉ DOMINGOS MUENHO', NULL, NULL, '1978-11-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'GILBERTO AFONSO PAULO SAYONGO', NULL, NULL, '1975-02-21', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'EMANUEL CHIMUCO', NULL, NULL, '1978-10-22', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'PAULINO EDUARDO MAVUNGO', NULL, NULL, '1978-09-09', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'ALMEIDA KAPANGO TOMAS', NULL, NULL, '1980-11-23', 'Kapango', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'SANTOS QUINTA GUEVE CAVIMBI', 'ALBERTO CAVIMBI', 'MADALENA NGUEVE', '1978-08-10', 'Cavimbi', 'M', '1.76', '5', 'C', 'Casa nº 05 Bairro Benvindo Distrito Patriota - Talatona , LUANDA', '42', '44', '46', NULL, 14, 19, NULL, '2025-11-07 09:54:24'),
(46, 'CLAUDIO FELISBERTO CUMBI DOS SANTOS', 'Ernesto Sebastião', 'Joana André Cumbi', '1980-07-08', 'Cumbi', 'M', '1,77', 'O+', 'C', 'Cidade do Sequele Cacuaco, Bloco nº2 Predio 27 Andar nº002', '42', '46', '38', NULL, NULL, NULL, NULL, '2024-07-17 15:54:24'),
(47, 'MAGALHÃES MONTEIRO DOMINGOS DE SOUSA', NULL, NULL, '1974-06-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'EDUARDO CHINGA CHINAPO', NULL, NULL, '1976-03-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'PAULO ALEXANDRE LOPES BERARDI', 'CARLOS ALBERTO BERALDE', 'MARIA DA CONCEIÇAO', '1978-11-28', NULL, 'M', '1,67', NULL, 'S', 'LUANDA - FUNDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'CRISTOVAO MANUEL PAULO', NULL, NULL, '1978-12-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'DAMIÃO BERNARDO PAULO', NULL, NULL, '1978-06-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'JOSÉ MIGUEL SALDANHA', NULL, NULL, '1978-12-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'VALDIMIR LINO FRANCISCO', 'JULIAO LINO FRANCISCO', 'BENVINDA TOCAVA', '1978-09-21', 'Lino', 'M', NULL, NULL, 'C', 'SAMBIZANGA -LUANDA', '43', '46', '38', NULL, NULL, NULL, NULL, '2025-11-09 18:21:21'),
(54, 'JOSÉ MANUEL QUINTAS', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'ALCIDES LUCAS KANGUNGA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'JOAQUIM MANUEL VIQUEPA', NULL, NULL, '1961-05-04', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'MANUEL GRACIANO', 'Graciano Capingana', 'Laurinda Abel Prata', '1977-09-29', 'NELO', 'M', '1,75', 'O+', 'S', NULL, '42', '42', '42', NULL, NULL, NULL, NULL, NULL),
(58, 'JOÃO MUNDILA BARROS BRAZ', NULL, NULL, '1976-02-18', 'Braz', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'JOSÉ JOÃO DA PAIXÃO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'AVELINO JOAO TCHIPILICA', NULL, NULL, '1977-08-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'MANUEL NETO DOS SANTOS', 'MANUEL RAIMUNDO DOS SANTOS', 'SALOMÉ ELIAS DA SILVA', '1977-07-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'JOÃO BAPTISTA KAPAPELO', NULL, NULL, '1971-01-10', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'ANTÓNIO MALENGA NACHICUSE', 'Antonio Nachicesse', 'Tchitongo Canivete', '1979-07-10', 'MALENGA', 'M', '1.80', 'A+', 'S', NULL, '43', '44', '44', NULL, NULL, NULL, NULL, NULL),
(64, 'TREGÓNIO IYEPAVALI', 'Eduardo Muamucangue', 'Teresinha Hipukuluca', '1986-06-14', NULL, 'M', NULL, '7', 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-02 15:11:45'),
(65, 'BONIFACIO DONGALA', 'Francisco Paulino', 'Deolinda Napowe', '1982-07-08', 'DONGALA', 'M', '1.62', 'O+', 'S', NULL, '42', '40', '40', NULL, NULL, NULL, NULL, NULL),
(66, 'ARTUR NUNO PAULO MARTINS', NULL, NULL, '1982-07-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'HELDER NDEMBELIKI DOS SANTOS MINO', 'ADRIANO MINÓ', 'FELISMINA NAMBAMBI LOPES', '1974-04-21', 'JÓ MINÓ', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'ROBERTO LIVINGSTON SILVESTRE CARVALHEDA', NULL, NULL, '1979-08-11', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'FILIPE JIMBO ALBERTO ', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'AMANDIO MADALENO BENTO DOS SANTOS', NULL, NULL, '1983-02-26', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'WILSON EMILIO DE SOUSA MARTINS', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'LUIS LOURENÇO CASSUA', NULL, NULL, '1975-05-03', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'PIO ALFREDO CAMBAMBA', 'ALFREDO CAMBAMBA', 'CONCEIÇÃO QUISSUA', '1978-06-20', 'PIO', 'M', NULL, 'O+', 'S', 'MUNICIPIO CEDE, MALANJE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'MARTINS GASPAR MATEUS', NULL, NULL, '1982-12-28', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'ANDRE PANZO CACUMBA', 'FERNANDES NEVES CACUMBA', 'MARIA DE LOURDES MANUEL PANZO', '1982-06-02', 'Cacumba', 'M', NULL, NULL, 'C', ' HERÓIS DO CUITO, BITA, VIANA', '42', '42', '40', NULL, NULL, NULL, NULL, '2025-10-04 16:38:33'),
(76, 'ORFEU MATIAS', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'SIMÃO DOMINGOS MANUEL', NULL, NULL, '1980-09-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'DIONISIO CANITO FERNANDO PEDRO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'IRACELMA CLEUSA DE MORAIS DOMINGOS', 'Miguel Adão Domingos', 'Teresa Joaquim Francisco de Morais Domingos', '1978-02-19', 'Iracelma', 'F', '1,68', 'O+', 'S', 'BLOCO C APTº CENTRALIDADE DO KILAMBA, LUANDA', '40', '46', '38', NULL, NULL, NULL, NULL, '2024-07-17 11:32:48'),
(80, 'JOAQUIM JORGE NANGUMBE', NULL, NULL, '1982-03-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'NOÉ CHISSAWUA CÉSAR', NULL, NULL, '1967-06-04', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'ABEL TCHOYA LITO', NULL, NULL, '1983-08-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'CLAUDINO MELO DA COSTA NEKOVA', NULL, NULL, '1984-03-09', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'FERNADO GABRIEL DAMIÃO', NULL, NULL, '1981-06-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'GARCIA LISBOA SIMÃO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'AIRES NAHENDA FRANCO CHITONGO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'AUGUSTO LAZARO KANDUMBO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'ADÉRITO VALENTIM MAFE PAULO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'MANUEL FRANCISCO BAMBI', 'Antonio Lucas Bambi', 'Cecilia Suca Bonifacio', '1979-10-10', 'BAMBI', 'M', '1,65', 'O+', 'S', NULL, '40', '42', '42', NULL, NULL, NULL, NULL, NULL),
(90, 'TITO MAURICIO NASCIMENTO', 'Mauricio Nande', 'Julieta Linda', '1968-09-03', 'TITO', 'M', '1,66', 'O+', 'S', NULL, '42', '48', '48', NULL, NULL, NULL, NULL, NULL),
(91, 'RAMOS JOÃO', 'Pascoal Matita', 'Ana Ngueve', '1980-02-22', NULL, 'M', '1,62', NULL, 'S', NULL, '40', '42', '42', NULL, NULL, NULL, NULL, NULL),
(92, 'ANGELINO CESAR AUGUSTO WALACA', 'Teodoro Walaca', 'Cecilia Situculi Augusto', '1982-01-31', 'WALACA', 'M', '1,72', 'O+', 'C', NULL, '42', '44', '44', NULL, NULL, NULL, NULL, NULL),
(93, 'ADELINO ALEXANDRE DUNO ', 'Avelino Duno', 'Ana Alexandre', '1979-12-28', NULL, 'M', '1.74', 'B+', 'S', NULL, '43', '43', '43', NULL, NULL, NULL, NULL, NULL),
(94, 'HELENA JÚLIA', NULL, NULL, '1974-11-07', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'VICENTE TCHIEVA', NULL, NULL, '1979-04-03', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'ARMANDO FERNANDO MBAMBI', NULL, NULL, '1975-09-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'JOSÉ FERNANDO CABOSSI', 'Bernardo Mucuti', 'Maria Imbundi', '1981-08-05', NULL, 'M', '1.56', 'A+', 'S', NULL, '40', '46', '46', NULL, NULL, NULL, NULL, NULL),
(98, 'ANGELO NDALA CASSANGA', 'Antonio Cassanga', 'Teresa Nhama', '1983-02-04', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'EUSÉBIO CHICONEQUENE', 'Elias Hamuendi', 'Maria Isabel Ntundiale', '1978-12-12', 'TCHICONEQUENI', 'M', '1.69', 'O+', 'S', NULL, '42', '42', '42', NULL, NULL, NULL, NULL, NULL),
(100, 'ANTÓNIO JOÃO VUNDA', 'João Vunda', 'Suzana Kameke', '1975-04-09', 'MALANJINHO', 'M', '1,59', 'O+', 'S', NULL, '39', '38', '38', NULL, NULL, NULL, NULL, NULL),
(101, 'BRUNO JOSÉ MARQUES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'GERALDO DA PURIFICACAO DALA ZAMBELA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'JOAQUIM TOMÉ VIANA', NULL, NULL, '1977-09-24', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'ANGELINO WAVIMBEMBE', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'JORGE CANHICA MUAKATENDA', 'Jose Tungo Muacatende', 'Angela Canhica', '1986-03-27', NULL, 'M', '1.69', 'O+', 'S', NULL, '42', '30', '30', NULL, NULL, NULL, NULL, NULL),
(106, 'JOSÉ SEGUNDA BAIÃO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'OSVALDO DOS SANTOS M. HAMUTY', NULL, NULL, '1981-08-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-07 13:53:31'),
(108, 'JOÃO QUIZUA KIVOLOCA', NULL, NULL, '1974-01-08', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'DIDIER WAVERLEY  XARAMBA ANTONIO', NULL, NULL, '1984-09-18', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'JOSÉ MULE CAULE', NULL, NULL, '1984-10-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'JOAQUIM FRANCISCO MANGO PAULO', 'Antonio Francisco Paulo', 'Maria Elena Mango', '1985-11-21', NULL, 'M', '1.64', 'O+', 'S', NULL, '40', '40', '40', NULL, NULL, NULL, NULL, NULL),
(112, 'JOSÉ DINIS VILIENGUE CASSOMA', 'Domingos Cassoma ', 'Marta Tchipuco', '1977-07-06', 'josé', 'M', '1,77', 'B+', 'S', 'Cachungo', '43', '40', '33', NULL, NULL, NULL, NULL, '2024-08-05 16:02:36'),
(113, 'MOSEIS ANTÓNIO KAUCANA', NULL, NULL, '1983-08-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'DIONISIO JULIO GONCALVES', 'Julio Gonsalves Mendongo', 'Lucinda Clemente', '1986-08-04', 'Julio', 'M', '1,67', 'A+', 'C', 'Kilamba Kiaxe', '42', '40', '33', NULL, NULL, NULL, NULL, '2024-07-17 15:25:32'),
(115, 'ADRIANO COSME DA MATA', 'Manuel Domingos da Mata', 'Maria Cosme Adelino', '1988-08-04', 'Da Mata', 'M', '1,72', 'O+', 'C', 'Maianga ', '42', '40', '45', NULL, NULL, NULL, NULL, '2024-08-14 09:42:27'),
(116, 'JOÃO FONSECA TOME BUMBA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(117, 'MARTINS BERNARDO FLORENTINO', NULL, NULL, '1983-02-14', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'MOISES DOMINGOS DA COSTA BAMBUCA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'AMBRÓSIO LUÍS', NULL, NULL, '1975-06-22', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'GONÇALVES CANDIDO', NULL, NULL, '1978-10-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'ROLIN SILENIO JOAQUIM QUETA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'JOSÉ JOAO ZUMBA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'NARCISO RAFAEL ÁLVARO ANTÓNIO MARIA', 'RAFAEL ANTÓNIO MARIA', 'MARIA ALVARO', '1986-08-05', NULL, 'M', '1,75', NULL, 'S', 'HOJI YA HENDA - LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'ROBERTO JOSÉ GEDIÃO DE ALMEIDA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'NAZÁRIO FRANCISCO KACHIKELA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'ERNESTO CHIVANGO', NULL, NULL, '1985-07-27', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'SEGUNDA KALEY', NULL, NULL, '1977-07-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'EMANUEL FILE KAKULUKUSSO INACIO', NULL, NULL, '1983-05-09', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'JOÃO ANTONIO LUNGAUMUE', NULL, NULL, '1983-06-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'QUINTAS JARDIM', NULL, NULL, '1983-07-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'ELIAS SEBASTIAO SILVA DOMINGOS', 'Sebastião J. Domingos ', 'Maria Elias A.F Domingos', '1978-07-11', 'Elias', 'M', '1,76', 'O+', 'C', 'Centralidade do Kilamba', '40', '43', '40', NULL, NULL, NULL, NULL, '2024-07-29 12:33:10'),
(132, 'RUFINO MANUEL CRISTOVÃO DA CONCEIÇÃO', 'RUFINO MANUEL DA CONCEIÇÃO', 'EUGENIA MATEUS CRISTOÃO', '1965-05-21', 'Rufino', 'M', NULL, NULL, 'C', 'URBAN. NOVA VIDA EDIF. 122, LUANDA', '40', '38', '38', NULL, 14, NULL, NULL, '2025-11-05 11:52:24'),
(133, 'JOÃO SAPALO MUHECHO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'JOAQUIM MANUEL', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'JORGE TOME TCHAMBA', 'João Baptista Ndala', 'Helena Nhema', '1976-08-05', 'TOME', 'M', '1,69', 'O+', 'S', NULL, '41', '46', '46', NULL, NULL, NULL, NULL, NULL),
(136, 'AZEVEDO MANUEL DOS SANTOS', NULL, NULL, '1973-02-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'TOMÉ PEDRO MATEUS', NULL, NULL, '1979-02-12', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'PAULO JOSÉ', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'JONAS MANUEL CHIMUCO', NULL, NULL, '1998-10-20', 'Jonas', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'LUÍS ROMÃO', 'ROMAO', 'JOANA PASCOAL', '1964-04-20', 'Romão', 'M', NULL, NULL, 'S', 'MORRO BENTO, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-09 18:55:00'),
(141, 'ALFREDO LUCAS CHISSOLA', 'LUCAS NICOLAU CHISSOLA', 'MARGARIDA NACHIAIA ERNESTO CHISSOLA', '1970-08-07', NULL, 'M', '1,75', NULL, 'S', 'CAMAMA, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'OLÍMPIO DE JESUS PEGADO DE SOUSA', NULL, NULL, '1973-09-14', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'ANTÓNIO JOÃO DE OLIVEIRA', NULL, NULL, '1973-06-06', 'Oliveira', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'BONEFACIO LUIS', NULL, NULL, '1979-05-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'JOSÉ FERNANDO', NULL, NULL, '1970-10-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'FRANCISCO MIGUEL PEDRO', 'MIGUEL FRANCISCO PEDRO', 'MARIA PEDRO FRANCISCO', '1970-07-24', 'CHICO', 'M', '1,66', 'O+', 'C', 'C/Nº 50 QTº 18 ZONA 10, BAIRRO BOA ESPERANÇA VIANA, LUANDA', '41', '42', '36', NULL, NULL, NULL, NULL, '2024-08-14 10:05:10'),
(147, 'MOISES AMÂNDIO CALUFUELO DA CONCEIÇÃO', 'Mangimela Calufuelo', 'Conceição Helena', '1975-12-29', 'CALUFUELO', 'M', '1,64', 'A+', 'S', NULL, '39', '40', '40', NULL, NULL, NULL, NULL, NULL),
(148, 'JOÃO DE DEUS PAULINO GASPAR', NULL, NULL, '1975-08-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'NELSON ALEXANDRE JOÃO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'MARQUES EDUARDO FRANCISCO', NULL, NULL, '1974-03-09', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'PEDRO BALTAZAR AGOSTINHO', 'João Gomes', 'Umbilina Francisco', '1975-03-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'PEDRO SALVADOR DIOGO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'DIONISIO SANTANA ARTUR CAPEMBA', NULL, NULL, '1975-05-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'JOSÉ ANTÓNIO COELHO', NULL, NULL, '1970-01-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'MATEUS DINIS MACOXI', NULL, NULL, '1972-12-04', 'Dina', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'LUINDULA PAXE', NULL, NULL, '1969-05-10', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'CARLOS JORGE MASSACO NGUNZA', 'José Pedro', 'Conceição Antonio Júlio', '1994-04-14', NULL, 'M', NULL, NULL, 'S', 'Bairro Capalanga, Viana, Luanda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'GRACIANO CHANA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'SALVADOR MANUEL CONSTANTINO', 'MANUEL CONSTANTINO CAMPOS', 'RITA MANUEL DOMINGOS', '1971-03-17', 'SALVADOR', 'M', '1,75', NULL, 'S', 'CENTRALIDADE DO KILAMBA, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'MANUEL FRANCISCO', 'FRANCISCO DE CASTRO', 'CAPEMBA CACULO', '1970-10-10', 'Russo', 'M', '1,63', NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'BONIFACIO OSVALDO KEMBA', NULL, NULL, '1980-03-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'JOSÉ FUNETE', 'LUCIANO FUNETE', 'CELESTINA NAMUONGUENO', '1966-06-10', 'Funete', 'M', '1,76', NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'AGOSTINHO CAMELA TCHICANALA', 'ANTONIO TCHICANALA', 'HELENA WANDY', '1978-01-06', NULL, 'M', '1,73', NULL, 'C', 'LUANDA - INGOMBOTAS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(164, 'ANTÓNIO JOÃO PIRES CALEI', NULL, NULL, '1973-08-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'MANUEL GARCIA TAMBO', 'GARCIA MANUEL TAMBO', ' EVA DIOGO VAZ CONTRIRA', '1972-05-19', 'TAMBO', 'M', '1.75', NULL, 'S', 'BAIRRO BENFICA, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'ALBERTO FERNANDO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'PAULINO DA GRAÇA GASPAR', 'Afonso Paulino Gaspar', 'Isabel Manuel Gomes', '1968-01-15', 'PAULINO', 'M', '1,62', NULL, 'C', 'LUANDA', '40', '42', '42', NULL, NULL, NULL, NULL, NULL),
(168, 'HIGINO IZATA FERNANDES', 'JUSTINO JOÃO FERNANDES', 'HELENA ISATA', '1974-09-18', 'Higino', 'M', '1,78', NULL, 'S', 'BITA TANQUE VILA VERDE, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'EDUARDO PANZO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'RODRIGUES ANTONIO MANUEL', NULL, NULL, '1974-08-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'FAUSTO AGOSTINHO FRANCISCO', NULL, NULL, '1972-10-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'AGOSTINHO JOSE PEDRO', 'Pedro Ndala', 'Josefina Mbacu', '1975-03-16', NULL, 'M', '1,67', 'B+', 'S', NULL, '40', '46', '46', NULL, NULL, NULL, NULL, NULL),
(173, 'HAMILTON JACKS GRAÇA PAULINO', 'PAULINO JACINTO', 'DELFINA MANUEL GRAÇA', '1973-08-15', 'PAULINO', 'M', '1,59', 'O+', 'S', 'DISTRITO URBANO MULENVOS, CACUACO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'BASILIO VIDEIRA TRIGO', NULL, NULL, '1967-03-31', 'Trigo', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'LUIS ANDRE PAMI', 'JOÃO PAMI', 'MARIA BENITA', '1965-06-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'JOAQUIM CHILOIA', NULL, NULL, '1974-06-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'ELIAS ÁLVARO DA SILVA CHINGA', 'ELIAS ANTONIO CHINGA', 'PALMIRA ANTONIO DA SILVA CHINGA', '1971-11-02', 'Chinga', 'M', '181', NULL, 'C', 'TALA-HADY CAZENGA, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'VIRIATO GOMES MARIA PILARTES', 'PEDRO PILARTES', 'MARIA DA CONCEICAO', '1967-10-28', 'Pilartes', 'M', '1,74', NULL, 'S', 'MALANGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'JORGE TCHIPILICA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'EDUARDO PASCOAL CAMEIA', 'Pascoal Cameia', 'Catarina Nalissimo', '1969-12-16', 'Cameia', 'M', '1.70', 'O+', 'S', 'Bairro Funda - Cacuaco /Luanda', '38', '20', '33', NULL, NULL, NULL, NULL, '2024-08-01 10:30:21'),
(181, 'ISAIAS MULANGUE PRUDENTE DANIEL', NULL, NULL, '1982-07-03', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'ANTONIO CARLOS TCHIPIQUITA ', 'Carlos Nguli', 'Benvinda Kambuli', '1972-08-28', 'CARLOS', 'M', '1,80', 'O+', 'S', NULL, '42', '44', '44', NULL, NULL, NULL, NULL, NULL),
(183, 'MESSALO LUTUCUTA BERNARDO', NULL, NULL, '1980-01-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'JOAQUIM LINO TOMAS', NULL, NULL, '1981-11-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'JESUS ESPERANÇA DAMIÃO', NULL, NULL, '1975-07-27', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'FELICIANO ESTRELA JOÃO', NULL, NULL, '1979-09-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'LUCIANO BAPTISTA', NULL, NULL, '1980-02-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'ABILIO DOS SANTOS DIAS', NULL, NULL, '1978-10-26', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'ARTUR MOISES SACALEI', NULL, NULL, '1982-10-22', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'MICHEL JOAQUIM NZAGI', NULL, NULL, '1976-08-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'JOAQUIM AUGUSTO MULIATA', 'Augusto Muquissi', 'Julieta Cacuhu', '1978-12-29', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'JOÃO AUGUSTO PAULO', NULL, NULL, '1995-05-11', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-01 19:15:00'),
(193, 'JOSÉ FERNANDO DE JESUS', 'Fernando Malungo', 'Teresa Jose', '1981-01-15', 'Jesus', 'M', '1,69', 'O+', 'S', 'BIÉ', '40', '37', '29', NULL, NULL, NULL, NULL, NULL),
(194, 'AFONSO DANIEL', NULL, NULL, '1989-02-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'OSVALDO JOÃO DE OLIVEIRA', 'Francisco João', 'Emília de Oliveira', '1984-06-01', 'João', 'M', '1.64', 'O+', 'S', 'Bairro São João ', '43', '43', '33', NULL, NULL, NULL, NULL, '2024-08-05 14:39:00'),
(196, 'OSVALDO MUABI CONDE CATETA', NULL, NULL, '1984-06-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'VENACIO SERAFIM SALOMÃO', NULL, NULL, '1981-09-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'TIAGO MARTINHO EPALANGA', NULL, NULL, '1980-02-19', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'ABRAÃO BAPTISTA QUILULU', 'MANUEL QUILULU', 'JOAQUINA BAPTISTA', '1985-04-21', 'QUILULU', 'M', '1,70', 'O+', 'S', 'GOLFE 2, LUANDA', '42', '42', '42', NULL, NULL, NULL, NULL, NULL),
(200, 'TOMÁS ESTEVÃO KUNHUNGO', 'Estevão Kuhango', 'Maria Cassule', '1976-09-17', NULL, 'M', NULL, NULL, 'S', 'LUENA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'RUFINO KATUMBELA', 'Eduardo Chico', 'Adelina Ndale', '1982-06-30', 'CATUMBELA', 'M', '1,66', 'A+', 'S', 'LUENA', '40', '38', '38', NULL, NULL, NULL, NULL, NULL),
(202, 'ADELINO BEIO ANTÓNIO', 'Antonio Chapanga', 'Rosaria Cagupa', '1968-04-05', NULL, 'M', '1,69', 'B+', 'S', NULL, '42', '42', '42', NULL, NULL, NULL, NULL, NULL),
(203, 'ANTÓNIO DOS SANTOS BARBANTE HAMUYELA', 'Baptista Seculo Panela', 'Maria de Fatima Liapate Cavimo', '1983-06-18', NULL, 'M', '1,70', 'B+', 'S', 'Luanda', '41', '42', '41', NULL, NULL, NULL, NULL, NULL),
(204, 'ENGRACIA FRANCISCO ALBERNAIS', NULL, NULL, NULL, NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'MIGUEL AFONSO', NULL, NULL, '1984-06-22', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(206, 'JOSÉ GONCALVES DOMINGOS', NULL, NULL, '1981-09-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'GUILHERMINA EPIFANIA HIFIWAUNYE', 'GUILHERME HIFIWAUNYE', 'LUCRECIA HANYENDALUKA', '1990-03-07', NULL, 'F', '1,66', NULL, 'S', 'ZANGO 3, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'ARAÚJO CLÁUDIO PAULO CAPITÃO', 'MIGUEL CAPITÃO', 'ELISA PAULO', '1988-09-26', 'Ara', 'M', '1,83', NULL, 'S', 'CENTRALIDADE DO SEQUELE, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'FIDEL DE ROSA JAIME SALOMÃO', NULL, NULL, '1988-09-11', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'ADILSON RUBEM LUEMBA MAIEMBE', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'ADELINO CORREIA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'JULIA BENTES JAIME', NULL, NULL, '1988-12-04', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'JOANA MANUEL MORAIS', NULL, NULL, '1989-09-15', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(214, 'MANUELA DAS DORES DA SILVA GOMES RICARDO', NULL, NULL, '1980-07-29', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(215, 'YURI JOÃO GONÇALVES DA SILVA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'ZACARIAS JOSÉ CHIVIA', NULL, NULL, '1986-03-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'AGOSTINHO DOMINGOS  LAURINDO', 'Julião Henda Laurindo', 'Maria Agostinho', '1986-08-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'MICAEL DE CARVALHO MULAZA', NULL, NULL, '1978-07-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'TOMAS ARMANDO MENEZES HORACIO', NULL, NULL, '2009-04-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'ANTÓNIO SEBASTIÃO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'LUÍS ALCINO BRÁS MINGAS ANTÓNIO', NULL, NULL, '1987-02-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'ILDA CACUBO SILVESTRE MUCICAIAMBA ', 'SILVESTRE MUACAIAMBA', 'TERESA MANDONA', '1988-08-07', NULL, 'F', '147', NULL, 'S', 'CASSENDA-LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'ISAIAS MANUEL NGANDO RIBEIRO ', 'MANUEL RIBEIRO', 'LAURINDA NGANDO', '1989-12-25', 'NGANDO', 'M', '1,70', 'O+', 'C', 'CENTRALIDADE DO KAPARI, BENGO', '41', '42', '42', NULL, NULL, NULL, NULL, NULL),
(224, 'JESSÉ EGAS MARCOLINO', NULL, NULL, '1988-01-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'MATEUS PEDRO BALTAZAR', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'MAURO MANUEL DE SOUSA AGOSTINHO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'NADIA PATRÍCIA GOMES AGOSTINHO', NULL, NULL, '1990-03-03', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'SATUMBO LUTOCK LIAHUKA', NULL, NULL, '1989-01-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'WYLKER LEONEL FERNANDO DA COSTA', 'ANTÓNIO LOPES DA COSTA', 'ISABEL FERNANDO', '1988-07-07', 'Lopes', 'M', '1.75', NULL, 'C', 'BLOCO C 25 Nº44 CENTRALIDADE DO KK5000, LUANDA', NULL, NULL, NULL, NULL, 14, 105, NULL, '2025-07-10 11:12:18'),
(230, 'YARA RITA DA SILVA TOMAS', 'JOÃO BAPTISTA DA SILVA TOMAS', 'MARIA RITA MALUNGO NGUTO', '1990-06-02', 'Yara', 'F', '150', 'B+', 'S', 'RUA DOS FUNANTES PRENDA, LUANDA', '38', '42', NULL, NULL, NULL, NULL, NULL, NULL),
(231, 'JOSÉ MANUEL NHUNDO', NULL, NULL, '1987-11-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'PEDRO NGUNGUI NACHINGOLO NUNGUNLO', NULL, NULL, '1991-11-30', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'MIGUEL FREDERICO ANTÓNIO', NULL, NULL, '1988-05-17', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'LINO CASSOMA VENTURA ', NULL, NULL, '1988-05-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'WILSON ANDRÉ KINGONGO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', 'CENTRALIDADE DO SEQUELE, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'ALANI ARMANDO SEBASTIÃO', NULL, NULL, '1991-02-25', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'MANZAMBI GLÓRIA MIEZI', 'Kissalo Joao Miezi', 'Madalena Fueki', '1991-03-10', 'Miezi', 'F', '1,69', 'B+', 'S', 'Bairro Neves Bendinha, Kilamba Kiaxi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'WILKER ADESIO CHIKUATA ELIAS', NULL, NULL, '1984-08-08', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'BERNABE A. F. CAFUNDA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'EDMILSON BRAULIO C CHIQUITO', NULL, NULL, '1990-06-12', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'JOSÉ PEDRO MANUEL', 'PEDRO JOSÉ', 'LUISA MANUEL UMBA', '1986-08-18', 'JP', 'M', '1,66', 'AB+', 'S', 'CENTRALIDADE DA VIDA PACIFICA ZANGO ZERO, LUANDA', '40', '42', '33', NULL, NULL, NULL, NULL, '2024-07-12 14:53:57'),
(242, 'SEBANIAS ANDRÉ CANOTE', 'Eduardo André', 'Adelina Canote', '1988-06-18', NULL, 'M', '1,70', NULL, 'S', 'Bairro KM 12 Viana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'DOMINGOS NAPOLIAO LAMBEU', NULL, NULL, '1995-06-14', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'WILSON ABREU DANIEL', NULL, NULL, '1986-12-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'NELSON DA SILVA JEREMIAS', NULL, NULL, '1985-10-28', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'CUSTODIO CANHINGUIGUINE', NULL, NULL, '1986-02-28', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'ADILSON SALOMÃO ALBANO', NULL, NULL, '1994-06-27', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'CLAUDIO MANUEL FULA MUCURI', 'Filomena B. da F. Alves', 'Filomena B. da F. Alves', '1987-03-11', 'Fula', 'M', '1,68', 'B-', 'S', 'Benfica rua -13 casa nª16', '40', '40', '40', NULL, NULL, NULL, NULL, '2024-07-29 14:04:58'),
(249, 'ADILSON ELISIO JACINTO DE SOUSA', NULL, NULL, '1990-04-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'AILTON JOEL DE GOUVEIA SEBASTIÃO', NULL, NULL, '1990-09-03', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'ARIEL MANUEL FRANCISCO ZUA', NULL, NULL, '1992-05-30', 'Ariel', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'DELFINA LUCAS SETA VENTURA', NULL, NULL, NULL, NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'ISAAC FIGUEIREDO SALATIEL', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'WALDEMIR EDGAR CAPUSSO CASSULA', NULL, NULL, '1992-11-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'ANTONIO MORAIS', NULL, NULL, '1990-11-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'FELIX LOSSAPI QUESSONGO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'SEBASTIÃO LIMOXI', NULL, NULL, '1986-08-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'TOMÁS SENGA MANDE', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'ALBERTO JAMBA FIGUEIREDO', 'Armando Figueira', 'Inês Jamba Chimimba', '1987-08-15', 'Jamba', 'M', '1.70', 'O+', 'S', 'Casa S/N Rua 5 de Outubro', '44', '40', '33', NULL, NULL, NULL, NULL, '2024-08-05 15:40:44'),
(260, 'EMANUEL DE JESUS RODRIGUES', NULL, NULL, '1989-07-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'FILOMENA MANUEL FERRAMENTA', NULL, NULL, '1994-08-22', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'BENJAMIM CALEI CHAMILE ELAMBA', NULL, NULL, '1990-12-15', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'RAMIRO INANCIO BONGUE PRATA', NULL, NULL, '1991-08-19', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'JOANA JANDIRA PANDA DOMINGOS', 'Francisco domingos ', 'Ana francisca', '1989-12-02', 'joana', 'F', '1.67', 'O+', 'S', 'HUAMBO CENTRALIDADE DA CÁALA', '40', '43', '33', NULL, NULL, NULL, NULL, '2024-08-05 12:42:36'),
(265, 'BELVINUTT NUTE DA CONCEIÇÃO ALVES ETOSSE', NULL, NULL, NULL, 'Etosse', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'ELSIO DARLI CASTELO BRANCO PALMA FERNANDES', NULL, NULL, '1991-02-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'MARIA GOMES MIRANDA ', 'Sebastião Manuel Miranda', 'Luciana Maria Gomes', '1988-02-14', 'Miranda', 'F', '1.68', 'O+', 'S', 'Centralidade do Lossambe - Huambo', '42', '43', '33', NULL, NULL, NULL, NULL, '2024-08-05 12:48:58'),
(268, 'FLÁVIO EDSON  ANTÓNIO VAMBI', 'Victor Casimiro Vambi', 'Maria Antonio', '1988-06-05', NULL, 'M', '1,73', 'O+', 'S', NULL, '42', '56', '56', NULL, NULL, NULL, NULL, NULL),
(269, 'ADILSON MAURO DA CRUZ GONCALVES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'EDSON AMSTRONGOM LUBAO TELO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'SALOMÃO FRANCISCO CONDE', 'FELICIANO HEPO FRANCISCO', 'MARIA MADALENA CONDE', '1989-02-28', 'CONDE', 'M', '1,60', 'O+', 'S', 'MUCIPICPIO BELAS DIST. KILAMBA KIAXI DISTRITO BRº GOLF 2', '39', '40', '40', NULL, NULL, NULL, NULL, NULL),
(272, 'PEDRO NATANIEL MOISES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'ALBERTO TOMÁS JUSTINO', 'Justino Benguela', 'Maria de Fatima Munga', '1992-04-04', 'JUSTINO', 'M', '1,63', 'O+', 'S', 'CABINDA', '40', '40', '40', NULL, NULL, NULL, NULL, NULL),
(274, 'ANICÉ NGUINAMAU JORGE TECA', NULL, NULL, '1992-12-29', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 'BARTOLOMEU MELDINHO HENRIQUES', 'HENRQUES NDALA', 'CRISTINA NDALA ', '1989-09-22', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 'ERICLENE MANUEL TAVARES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(277, 'GABRIEL CHIVELA ANTÓNIO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'JOSÉ FRANCISCO SEBASTIÃO MATIAS', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'MANUEL FIGUEIRA SAMBA', NULL, NULL, '1992-02-21', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, 'ADILSON GABRIEL MORAIS NGUVULO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(281, 'FIDEL JOAQUIM FRANCISCO GONGA ', NULL, NULL, '1992-08-18', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'ADRIANO UKWATCHIWO KAMWANGO', 'ALEXANDRE KAMWANGO', 'CRISTINA LINDA AUGUSTO', '1994-01-05', 'KAMWANGO', 'M', '1.68', 'O+', 'S', 'VIANA, LUANDA', '40', '38', '38', NULL, NULL, NULL, NULL, NULL),
(283, 'AGNELLY KRANCHUCK CASTELO', 'Augusto Castelo Agostinho Joaquim', 'Madalena Sebastião Domingos', '1993-10-11', 'KRANCHUCK', 'M', '1,68', 'O+', 'S', 'Luanda', '40', '40', '40', NULL, NULL, NULL, NULL, NULL),
(284, 'DONNAIRE VAN DUNEN SANTOS DA SILVA', NULL, NULL, '1994-05-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'FERNANDO SIMÃO VICTORINO', NULL, NULL, '1993-04-24', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'CARMEN DOMINGOS BALSA LOPES', NULL, NULL, '1993-11-14', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'FERNANDO MANUEL SOARES JOSÉ', NULL, NULL, '1992-10-09', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'GEOVANI RAUL DE ALMEIDA', NULL, NULL, '1993-11-13', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 'MARIO PAULINO TOZE', 'Francisco Augusto Viana', 'Cecilia Mira', '1991-04-30', NULL, 'M', '1,70', 'A+', 'S', NULL, '42', '42', '42', NULL, NULL, NULL, NULL, NULL),
(290, 'ALMIRO GUIGE CHILOMBO ZACARIAS', NULL, NULL, '1993-03-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'JOSÉ MANUEL AGUINALDO RODRIGUES', 'JOSE MANUEL RODRIGUES', 'FERNANDA MANUEL', '1997-10-18', NULL, 'M', '1,70', NULL, 'S', 'BAIRRO TALA HADY CAZENGA, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 'JOSÉ ANICETO DOMBACE', NULL, NULL, '1992-03-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'JANY CHUMBO DAMIÃO', NULL, NULL, NULL, NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 'PEDRO AFONSO ', 'Afonso Maiala', 'Maria António', '1993-05-26', 'Pedro', 'M', '1,70', 'O+', 'S', 'Bairro Cazenga ', '38', '20', '33', NULL, NULL, NULL, NULL, '2024-08-01 13:51:51'),
(295, 'CONCEICAO WENGUE MAMBO', NULL, NULL, '1993-03-09', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, 'EUNICE LENVUKA ANDRÉ  JOÃO', NULL, NULL, '1993-11-19', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'AMERICO GARCIA SEBASTIÃO', NULL, NULL, '1993-11-10', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 'ESTEFÂNIO MAQUENA GOANHI JOÃO', 'José Luís Francisco João ', 'Adelia Maionde Goanhi', '1993-01-10', 'ESTEFÂNIO', 'M', '1.78', 'AB+', 'S', 'Bairro Samba Casa nº 77 Zona - 3 ', '43', '20', '33', NULL, NULL, NULL, NULL, '2024-07-29 15:18:42'),
(299, 'GILSON PAIXÃO GANGA', NULL, NULL, '1994-11-12', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, 'MANUEL NEVES CHISSAPA MAHULA  ', NULL, NULL, '1993-12-12', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'GRACIANO FELIX TCHISSINGUI', NULL, NULL, '1978-07-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'SIMÃO DIOGO ALEXANDRE', 'João Domingos Alexandre', 'Vitória Manuel Diogo Alexandre', '1995-10-09', 'Simão', 'M', '1,72', 'A+', 'C', 'Luanda Sul', '42', '46', '38', NULL, NULL, NULL, NULL, '2024-07-19 10:06:08'),
(303, 'MARCELO ADRIANO CAZELA NGOLA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'ADÃO AGOSTINHO FILIPE', 'Paulino Agostinho', 'Maria da Conceição Filipe', '1990-04-12', 'FILIPE', 'M', '170', 'A+', 'S', NULL, '39', '34', '34', NULL, NULL, NULL, NULL, NULL),
(305, 'LOURENCO JÃO QUISSENDA', 'Carlos Januario Quissenda', 'Delfina Antonia', '1993-06-20', 'QUISSENDA', 'M', '1,70', 'O+', 'S', NULL, '41', '39', '39', NULL, NULL, NULL, NULL, NULL),
(306, 'EDMUNDO ERNESTO GANGA', 'Domingos Ganga', 'Delfina Ernesto Neto', '1993-12-26', 'GANGA', 'M', '1,75', 'O+', 'S', NULL, '44', '45', '45', NULL, NULL, NULL, NULL, NULL),
(307, 'CÂNDIDO VICENTE', NULL, NULL, '1994-10-17', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(308, 'JELSON CALLI MOTO DA SILVA', NULL, NULL, '1993-03-03', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'RUI BALANGA MUCONGO', NULL, NULL, '1993-11-27', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(310, 'ANGELINO DA SILVA REIS', 'Eduardo Antonio Reis', 'Honorina Mangovo Fingo', '1993-08-05', NULL, 'M', '1,63', 'O+', 'S', NULL, '41', '42', '42', NULL, NULL, NULL, NULL, NULL),
(311, 'ADILSON SEBASTIÃO MANUEL GOMES KALEPETE', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'ADILSON SEBASTIÃO DAVID', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'ARCANJU VICTOR GONGUELA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, 'ARSÉNIO BAPTISTA CATUNDA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'JONAS KAHUMBA KALOLA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'MÁRIO ANTÓNIO VIEGAS', 'PAULO AZEVEDO VIEGAS', 'ISABEL ANTÓNIO', '1987-08-11', NULL, 'M', '1,69', 'O-', 'C', 'BAIRRO MORRO BENTO, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'NELSON JIMBO VICTORINO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'RENEL OSVALDO SIMEÃO FRANCISCO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'DELSON ADRIANO SABINO PREGO', NULL, NULL, '1994-07-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `pessoa_fisica` (`id_pessoa_fisica`, `nome`, `nome_pai`, `nome_mae`, `Data_Nascimento`, `Alcunha`, `id_sexo`, `Altura`, `Grupo_Sanguineo`, `id_estado_civil`, `Residencia`, `Nro_Calcado`, `Nro_Camisa`, `Nro_Calca`, `OutrasInformacoes`, `habilitacao_id`, `id_naturalidade`, `created`, `modify`) VALUES
(320, 'GORETH DE FATIMA MANUEL MUHANDA ADRIANO', NULL, NULL, '1994-01-11', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'LUCIANA CANDJALA INOCÊNCIO', NULL, NULL, '1994-05-09', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'SEBASTIÃO FRAGÃO NGONGO PAULINO', NULL, NULL, '1995-06-22', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'SAMUEL CHINGUI DOS SANTOS', NULL, NULL, '1995-10-24', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'BRANCA MARTINS COELHO', NULL, NULL, '1994-04-14', NULL, 'F', '1,60', NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(325, 'EDITH PRAIA MARIO', NULL, NULL, NULL, NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(326, 'BRUNO LEANDRO PEREIRA DE OLIVEIRA', NULL, NULL, '1994-04-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'FLORENTINO JOAQUIM PEREIRA PEDRO', 'Daniel Catosse', 'Paula Jamba Cachimo', '1994-08-01', NULL, 'M', '1,70', 'O+', 'S', 'Casa nº 140. Bairro Luanda-Sul, Viana, Luanda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(328, 'FURTUNATO ANTÓNIO MARTINS', NULL, NULL, '1994-05-02', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'INÁCIO JOSÉ DOMINGOS JACA', NULL, NULL, '1994-06-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(330, 'FRANCISCO SAMUEL ZAGE', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'CELESTINO BUANGA MAVUNGO', 'Vicente Mavungo', 'Celina Buanga dos Santos', '1994-12-14', 'MAVUNGO', 'M', '1,82', 'O+', 'S', NULL, '42', '38', '38', NULL, NULL, NULL, NULL, NULL),
(332, 'JOÃO VICENTE FRANCISCO', NULL, NULL, '1997-07-31', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 'EDUARDO KUPUYA FIRMINO', 'FIRMINO LUIS', 'JULIANA KÂMIA', '1985-08-26', NULL, 'M', '1,61', 'AB+', 'S', 'BAIRRO MIRAMAR, BENGUELA', '41', '40', '40', NULL, NULL, NULL, NULL, NULL),
(334, 'NATANIEL ANTONIO FERNANDO BENTO', NULL, NULL, '1994-02-25', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'MARCOS ESTEVÃO FERREIRA', 'Antonio Joaquim', 'Victoria Esteves', '1995-05-02', NULL, 'M', '1,63', 'B+', 'S', NULL, '39', '30', '30', NULL, NULL, NULL, NULL, NULL),
(336, 'DAVID TCHITANDA LOTE', 'Julio Eduardo Lote', 'Maria Albertina Paula', '1995-01-31', NULL, 'M', '1,71', 'O-', 'S', NULL, '43', '44', '44', NULL, NULL, NULL, NULL, NULL),
(337, 'JOÃO FIRMINO SANTOS', NULL, NULL, '1994-11-11', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'PINTO JAMBA CATOCOSSI', NULL, NULL, '1994-08-01', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'DOMILDE RODRIGUES DA COSTA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'ARSÉNIO RODRIGUES CAJUNGO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'FLÁVIO MANUEL CANHAMENA CASSUECA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(342, 'ERMELINDO MAURICIO HENRIQUES NERO', NULL, NULL, '1993-02-10', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'DANIEL JOÃO MATEUS MANUEL', NULL, NULL, '1995-11-23', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'INÊS FRANCISCO SEBASTIÃO', NULL, NULL, '1996-11-30', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'TERESA MANUEL PEDRO', NULL, NULL, '1995-08-06', NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'HELDER BENEDITO DE BRITO TEIXEIRA JUNIOR', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'JENIPRO ROGERIO MATEUS', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'ALVARO MANUEL BOA VIDA WILLIAMS', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'JUDITH CARLOS JOAQUIM', NULL, NULL, NULL, NULL, 'F', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'CLAUDIO VENTURA DA SILVA CAETANO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(351, 'STANISLAU MATEUS MALITY CHIMUCO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'VLADIMIRO CELSON FRANCISCO MANUEL', 'Tchissola Mucanda Samuel', 'Teresa Maria Francisco', '1996-03-02', 'Samuel', 'M', '1,74', 'O+', 'S', 'Rua do Banco BAI. Bairoo Riceno, Caxito - B engo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'ANTÓNIO MAGICO LUVEIO', NULL, NULL, '1993-01-14', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'JEREMIAS ANDRADE CORREIA', NULL, NULL, '1984-06-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'JARDEL BALDUINO AUGUSTO', NULL, NULL, '1996-08-20', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'PAULO DIAS CHITECULO', NULL, NULL, '1996-04-18', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 'JOÃO GOMES LELO', NULL, NULL, '1995-11-21', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 'JORGE AFONSO SONY', NULL, NULL, '1996-10-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(359, 'PAULINO NDALA ARTUR', NULL, 'Matundo Manuela', '1997-08-28', 'Busido', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, 'FRANCA DOMINGOS DA SILVA  KUBINDAMA', 'Daniel Hingombe', NULL, '1997-11-16', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'MANUEL ARMINDO COIMBRA', NULL, NULL, '1984-02-07', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'JOAQUIM FONSECA SEQUEIRA', NULL, NULL, '1975-08-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'PAULO JORGE CONTREIRAS DA SILVA', NULL, NULL, '1989-11-03', NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'ESMIRI WILSON SIMÕES DE BRITO FRANCISCO', 'NELSON MANUEL FRANCISCO', 'VICTORIA DA NATIVIDADE BRITO', '1994-03-01', NULL, 'M', '1,77', 'O+', 'S', 'LUANDA SUL, VIANA', '42', '46', '46', NULL, NULL, NULL, NULL, NULL),
(365, 'FÉLIX JAMBA CHAUMUE BAPTISTA', 'LOPES BAPTISTA', 'ROSA PAULA CHAUMUE', '1995-04-21', 'Félix', 'M', '1.68', '7', 'C', 'BAIRRO LUANDA-SUL, LUANDA', '41', '42', '42', NULL, 14, 120, NULL, '2025-10-13 08:58:32'),
(366, 'SALOMÃO DALA NGUNZA', 'Vieira Luamba Ngunza', 'Joana Salomão Dala ', '1988-08-23', 'Saló', 'M', '1,72', 'O+', 'S', 'Terra Vermelha', '40', '43', '40', NULL, NULL, NULL, NULL, '2024-07-29 11:40:26'),
(367, 'GELSON DA CRUZ', NULL, NULL, NULL, 'CRUZ', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'MANUEL MBUCO', NULL, NULL, NULL, 'Mbuco', 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'ANTONIO JOSE NGOMA MIGUEL', 'Armando Mariano Miguel', 'Clementina Ngoma', '1969-08-28', NULL, 'M', '1,70', NULL, 'S', 'Rua C, Sector Q10 Nº 10 Zona 3, Bairro Morro Bento B, Samba', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'BENEDITO MANUEL FRANCISCO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(371, 'TELMA VIEIRA TUMBA', 'António Nunes Quissambo Tumba', 'Filomena Vieira', '2020-09-07', 'Telma', 'F', '1,68', 'A+', 'S', 'Comissão do Cazenga Rua - 1', '38', '20', '12', NULL, NULL, NULL, NULL, '2024-07-29 15:10:30'),
(372, 'ANTÓNIO FRANCISCO PERGÃO', 'SIMÕES PERGÃO', 'LUISA CAMEIA FRANCO', '1982-05-05', NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'CELESTINA NAMBOLA DE OLIVEIRA', 'EUGENIO OLIVEIRA', 'ÂNGELA C. OLIVEIRA', '1993-06-06', NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(374, 'SILSON NATÁLIO NDASILVA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(375, 'SIMÃO AFONSO CARDOSO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 'ÓSCAR OSÓRIO MARGARIDA DA COSTA', 'ANTÓNIO GONÇALVES COSTA', 'MARGARIDA BAPTISTA SAMUQUITA', '1988-12-13', NULL, 'M', '1,83', 'O+', 'S', 'QTº S-21 1º ANDAR APTº14 CIDADE DO KILAMBA, LUANDA', '43', '46', '46', NULL, NULL, NULL, NULL, NULL),
(377, 'GUILHERME MANUEL MARIA VANDIK', 'VENANCIO MANUEL VANDIK', 'ANABELA MARIA GUILHERME', '1994-10-08', 'Kamikaze', 'M', '1.68', '7', 'S', NULL, '42', '46', '46', NULL, 14, 103, NULL, '2025-11-09 18:58:51'),
(378, 'DENILSON PEREIRA CORREIA', 'DOMINGOS PEDRO CORREIA', 'ALZIRA MARIA PEREIRA', '1994-11-09', NULL, 'M', '1,66', 'O+', 'C', 'DIST. ESTALAGEM, VIANA', '42', '40', '40', NULL, NULL, NULL, NULL, NULL),
(379, 'JOSÉ WALTER FRANCISCO GONGA', 'WALTER FRANCISCO GONGA', 'MARIANA FRANCISCO PAULO', '1992-11-10', NULL, 'M', '1,75', 'O+', 'S', 'BLOCO-M6 APTO-31 CIDADE DO KILAMBA, LUANDA', '40', '42', '42', NULL, NULL, NULL, NULL, NULL),
(380, 'CLOV GENESIO ALVES FERREIRA', 'FRANCISCO MANUEL FERREIRA', 'EUGÉNIA JOSÉ BORGES ALVES', '1990-02-22', NULL, 'M', '1,70', 'O+', 'C', 'CIDADE DO KILAMBA BLOCO-B28 APTº 52', '43', '48', '48', NULL, NULL, NULL, NULL, NULL),
(381, 'FRANCISCO NGULA CHIMBALI', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'TERESA IDALINA TEIXEIRA MENEZES', 'António Menezes', 'Cecília Teixeira', '1988-01-23', 'Menezes', 'F', '1,60', 'O+', 'S', 'Rua Raimundo Serreno/Bie', '38', '36', '28', NULL, NULL, NULL, NULL, '2024-08-14 12:14:15'),
(383, 'JOÃO SIMÃO DA SILVA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(384, 'MANUEL RIBEIRO', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(385, 'PEDRO FAUSTINO DE SOUSA', 'ANTÓNIO DE SOUSA', 'JOSEFA FAUSTINO', '1997-09-12', NULL, 'M', '1,75', 'A+', 'S', 'BAIRRO KAPALANGA, VIANA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(386, 'EURICO PAULO COSTA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(387, 'AUDÁCIO JORGE VICTOR  FERNANDO', 'Alberto Fernandes', 'Teresa Victor', '1989-07-27', 'Fernando', 'M', NULL, NULL, 'C', 'Projecto Nova Vida, Rua 51, Edificioi 117', '43', '46', '38', NULL, NULL, NULL, NULL, '2025-10-06 12:30:11'),
(388, 'DANIEL MAHIELA', NULL, 'Nzumba Madalena Daniel', '1989-03-17', 'Mayela', 'M', '1,77', 'AB+', 'S', 'Golf 1, Kilamba Kiaxi, Luanda', '42', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'HORTENCIO FIGUEIREDO DE ANDRADE BAPTISTA', 'HELDER AGOSTINHO DOS SANTOS BAPTISTA', 'DJANDIRA MOTA DE ANDRADE', '2001-04-30', NULL, 'M', '1,69', 'B-', 'S', 'BAIRRO SAPU 2 DIST. 11 DE NOVEMBRO MUN. BELAS', '42', '46', '46', NULL, NULL, NULL, NULL, NULL),
(390, 'ROSA DA CONCEIÇÃO GONÇALVES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'DOMINGOS MIGUEL HUNGA', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(392, 'KELSON EDIVALDO SAMPAIO ALVARENGA', 'CARLOS MANUEL ALVARENGA', 'ANA MARIA SAMPAIO LUCAMBA', '1995-07-16', NULL, 'M', '1,79', 'A+', 'S', 'BLOCO A-8 APTO-84 CIDADE DO KILAMBA, LUANDA', '42', '44', '44', NULL, NULL, NULL, NULL, NULL),
(393, 'JOSÉ MANUEL QUESSONGO', 'ARTUR KESSONGO', 'ZEFERINA NACHEMBI', '1972-04-03', NULL, 'M', '1,76', 'O+', 'S', 'DISTRITO DO ZANGO, VIANA', '43', '48', '48', NULL, NULL, NULL, NULL, NULL),
(394, 'ADRIANO AURÉLIO KINDANGE TORRES', NULL, NULL, NULL, NULL, 'M', NULL, NULL, 'S', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'MIGUEL JOSÉ', 'José Cabange', 'Nsatu Ariete', '1981-09-12', NULL, 'M', NULL, 'A+', 'S', 'Bairro Vila Flor B, Viana, Luanda', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 'CELSO CAUHANGO MANUEL', 'NELSON DE JESUS JOSE MANUEL', 'PAULA EUGENIA CAUHANGO', '1997-07-24', NULL, 'M', '1,67', NULL, 'S', 'RUA VIOLETA, URBANIZAÇÃO JARDIM DO EDÉM, LUANDA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'BALDUINO EDUARDO SEBASTIÃO', 'MATEUS MANUEL SEBASTIÃO', 'ENGRÁCIA PEDRO EDUARDO', '1995-04-11', NULL, 'M', '1,78', 'O+', 'S', 'DIST. LUANDA SUL, VIANA', '41', '44', '44', NULL, NULL, NULL, NULL, NULL),
(398, 'JOSUALDO AMBRÓSIO MBASSI', 'DOMINGOS MBASSI', 'IVONE DOS ANJOS AMBRÓSIO', '1994-06-15', NULL, 'M', '1,78', 'A+', 'S', 'DIST. LUANDA SUL, VIANA', '43', '44', '44', NULL, NULL, NULL, NULL, NULL),
(399, 'SEBASTIÃO AUGUSTO LISBOA ANTÓNIO', 'SEBASTIÃO FRANCISCO ANTÓNIO', 'MARIA ADELAIDE LISBOA', '1997-04-19', 'Juninho', 'M', NULL, NULL, 'C', 'DIST. CAMAMA, KILAMBA KIAXI', '42', '42', '44', NULL, NULL, NULL, NULL, '2025-10-09 11:39:02'),
(400, 'JORGE ALBINO FRANCISCO', 'JORGE FRANCISCO', 'ANA FRANCISCO', '1994-03-14', NULL, 'M', '1,70', NULL, 'S', 'DIST. CUCA, CAZENGA', '40', '44', '44', NULL, NULL, NULL, NULL, NULL),
(474, 'Pedro Neto', 'João NETO', 'Nelma Neto', '1962-02-22', NULL, 'M', '189', '7', 'C', 'Luanda', '43', '46', '38', NULL, NULL, NULL, '2024-05-28 12:06:58', NULL),
(475, 'Pedro Neto', 'João NETO', 'Nelma Neto', '1962-02-22', NULL, 'M', '189', '7', 'C', 'Luanda', '12', '12', '12', NULL, NULL, NULL, '2024-05-28 12:09:39', NULL),
(478, 'Luís António de Andrade Viana Leitão', 'Alberto António Araújo Viana Leitão', 'Fátima Fernanda de Sousa Andrade Leitão', '1972-08-30', NULL, 'M', '1,70', '1', 'C', 'Viana, km 30, Casa nº133', '42', '46', '33', NULL, NULL, NULL, '2024-07-19 15:15:37', NULL),
(483, 'Elísio Avelino Jorge', 'Felino Jorge', 'Juliana Avelino', '1996-05-18', NULL, 'M', NULL, '1', 'S', 'Viana 500 casa', '40', '40', '40', NULL, 14, NULL, '2024-07-22 11:53:58', '2025-10-08 09:27:33'),
(484, 'Bruno Alindo da Silva Somavie', 'Justino Dias da Silva Somavie', 'Margarida Cutala da Silva Somavie', '1997-01-22', NULL, 'M', '1,79', '5', 'S', 'Viana, Bairro Grafanil, ', '40', '40', '40', NULL, NULL, NULL, '2024-07-24 12:56:28', NULL),
(486, 'Leonel Pires Micolo', 'Correia Garcia Micolo', 'Antónia G. de Nascimento', '1992-10-09', NULL, 'M', '1,68', '1', 'C', 'Benfica rua -13 casa nª16', '40', '40', '40', NULL, NULL, NULL, '2024-07-29 14:43:17', NULL),
(492, 'Cristiano  de Jesus Lebe Fernandes ', 'Domingos Carlos Andre Fernandes ', 'Maria da Conceição Pedro Lebe Fernandes ', '1997-12-16', NULL, 'M', '1,70', '1', 'S', 'Centralidade do Sequele Cacuaco ', '41', '20', '38', NULL, NULL, NULL, '2024-07-29 15:28:35', NULL),
(499, 'Nelson Armando Tchivuvulo', 'Ernesto Nelson Filipe', 'Maria Rolandes', '1997-01-03', NULL, 'M', '1,69', '7', 'S', 'Viana Bairro Kicuxi', '38', '20', '12', NULL, NULL, NULL, '2024-07-30 10:26:26', NULL),
(501, 'José Mbongo Bernardo Dala', 'Armando Dala', 'Serafina Bernardo ', '1995-07-22', NULL, 'M', '1,69', '7', 'S', 'Bairro Zange I - Boa Esperança Casa nº 52', '41', '20', '40', NULL, NULL, NULL, '2024-07-30 10:43:20', NULL),
(510, 'Viegas Afonso Pululo', 'Afonso Pululo', 'Teresa Filipe', '1979-05-10', NULL, 'M', '1.66', '7', 'S', 'Bairro Papelão ', '12', '20', '33', NULL, NULL, NULL, '2024-08-01 12:16:19', NULL),
(511, 'Garcia Nsiansaki', 'Paulo Mfitu', 'Juliana Ló', '1982-07-29', NULL, 'M', '1.68', '7', 'S', 'Zona -1 Pepelão ', '12', '43', '33', NULL, NULL, NULL, '2024-08-01 12:26:43', NULL),
(512, 'João Francisco ', 'Francisco Quegia', 'Marcelina Clezito', '1977-05-22', NULL, 'M', '1,70', '7', 'S', 'Bairro Papelão ', '42', '20', '33', NULL, NULL, NULL, '2024-08-01 12:37:42', NULL),
(516, 'Osvaldo Pedro York ', 'Francisco Firmino Ernesto York', 'Albertina Isabel', '1996-07-15', NULL, 'M', '1,73', '5', 'S', 'Bairro Bom Pastor / Província do Huambo', '42', '43', '33', NULL, NULL, NULL, '2024-08-07 10:50:02', NULL),
(523, 'Segunda Catuto Chala', 'António Capumba Chala', 'TeresaChipango', '1996-06-12', NULL, 'M', '1.70', '7', 'S', 'Bairro Calomanda -Huambo', '40', '20', '33', NULL, NULL, NULL, '2024-08-07 11:22:57', NULL),
(524, 'Américo da Conceição Costa Quinhata', 'Augusto Bernardo Quinhata', 'Constâncias José G da Costa', '1994-04-25', NULL, 'M', '1.80', '1', 'S', 'Bairro Santo António Província do Huambo ', '41', '43', '40', NULL, NULL, NULL, '2024-08-07 11:34:15', NULL),
(525, 'Domingos João da Silva Bernardo ', 'Domingos João Bernardo ', 'Sebastiana José domingos da silva', '1995-07-17', NULL, 'M', '1.71', '5', 'S', 'Bairro Santo António Província do Huambo ', '41', '43', '33', NULL, NULL, NULL, '2024-08-07 13:59:56', NULL),
(527, 'Jaime Ngola ', 'Mateia', 'Vigueia', '1965-01-31', NULL, 'M', '1.73', '1', 'S', 'Bairro Santa Cruz /Província da Huila ', '38', '20', '38', NULL, NULL, NULL, '2024-08-07 14:29:40', NULL),
(531, 'Domingos Checuta Yambi', 'Chivinga Yambi', 'Cumena Bionga', '1994-01-26', NULL, 'M', '1.80', '1', 'S', 'Bairro Santo António Província do Huambo ', '41', '43', '33', NULL, NULL, NULL, '2024-08-07 15:31:58', NULL),
(532, 'Raimundo António ', 'José Vinda ', 'Helena Muanza ', '1984-05-25', NULL, 'M', '1.70', '7', 'S', 'Bairro Fatima ', '40', '40', '33', NULL, NULL, NULL, '2024-08-07 15:49:24', NULL),
(533, 'Aderildo Alexandre Campos Marcolino', 'Amilcar Octávio Ngongo Marcolino', 'Eunice Ester Campos', '1999-07-20', NULL, 'M', '1,67', '7', 'S', 'Rua Eng. FS De Lemos Nº 7 ', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-09 11:49:47', NULL),
(534, 'Walter Albino Mussunda', 'Victor Fausto', 'Manuela Vasco', '1997-06-26', NULL, 'M', '1.70', '3', 'S', 'Hoji Ya Henda, Casa nº 146, Zona 17', '42', '40', '36', NULL, NULL, NULL, '2024-08-14 09:20:36', NULL),
(535, 'Laurindo Jorge Sachingolo', 'Pascoal João Sangunga', 'Rosalina Sachingola', '1985-08-22', NULL, 'M', '1,68', '7', 'S', 'Bairro Fatima Sub-urbano ', '35', '20', '12', NULL, NULL, NULL, '2024-08-14 12:02:41', NULL),
(536, 'Laurindo Bailundo Manuel Ferramenta', 'Manel Laurindo Ferramenta', 'Teresa Mbora', '1994-06-20', NULL, 'M', '1.78', '7', 'S', 'Bairro do Bem  Fica_Humbo', NULL, NULL, NULL, NULL, NULL, NULL, '2024-08-14 13:25:55', NULL),
(556, 'António Emanuel Eduardo Neves', 'Gonsalves Paulino Neves', 'Maria Elisa Miguel Eduardo', '1998-02-05', 'Neves', 'M', '1.75', '3', 'S', NULL, '42', '41', '42', NULL, 14, 105, '2025-10-07 10:44:05', '2025-10-08 09:06:15'),
(557, 'Cláudio De Sousa Neto', 'José Maria Neto', 'Francisca Maria De Sousa Neto', '1998-07-13', 'CN', 'M', '1.70', '1', 'S', NULL, '40', '38', '38', NULL, 14, 103, '2025-10-07 12:54:55', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
CREATE TABLE IF NOT EXISTS `pessoa_juridica` (
  `id_pessoa_juridica` int NOT NULL DEFAULT '0',
  `nip` int DEFAULT NULL,
  `id_patente` smallint DEFAULT NULL,
  `id_especialidade` int DEFAULT '0',
  `FPS` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_cargo` int DEFAULT NULL,
  `id_situacao` int DEFAULT NULL,
  `Ramo_Origem` tinyint DEFAULT NULL,
  `tipo_membro` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pessoa_juridica`) USING BTREE,
  KEY `especialida` (`id_especialidade`) USING BTREE,
  KEY `id_situacao` (`id_situacao`),
  KEY `cargo` (`id_cargo`),
  KEY `ramo` (`Ramo_Origem`),
  KEY `tipo_de_membro` (`tipo_membro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `pessoa_juridica`
--

INSERT INTO `pessoa_juridica` (`id_pessoa_juridica`, `nip`, `id_patente`, `id_especialidade`, `FPS`, `id_cargo`, `id_situacao`, `Ramo_Origem`, `tipo_membro`, `created`, `modify`) VALUES
(1, 49866393, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(2, 50023293, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(3, 50614494, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(4, 50734695, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(5, 51091096, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(6, 48496492, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-05 12:42:56'),
(7, 48513393, 121, 15, 'P', NULL, 15, NULL, NULL, NULL, '2025-11-09 17:53:09'),
(8, 48539093, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(9, 48617693, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 11:09:16'),
(10, 48829293, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(11, 48995893, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(12, 49215705, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(13, 49635593, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(14, 49658793, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(15, 51138695, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-14 13:46:32'),
(16, 51495294, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(17, 51861494, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(18, 53787996, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(19, 53806996, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(20, 53825398, 113, 9, 'P', NULL, 1, NULL, NULL, NULL, '2025-09-24 16:11:22'),
(21, 54251796, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(22, 54334297, 130, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(23, 56807697, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(24, 60781794, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-01 11:40:51'),
(25, 61142394, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2025-11-07 07:56:01'),
(26, 61168901, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 14:35:20'),
(27, 61181993, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(28, 61323502, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(29, 61390498, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(30, 61394002, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(31, 61552202, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-01 10:50:12'),
(32, 61561502, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(33, 61568602, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(34, 61321698, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(35, 61634597, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(36, 61649202, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 11:51:24'),
(37, 61852602, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(38, 61939198, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(39, 62076002, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(40, 62165902, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(41, 62200602, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(42, 62207202, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 14:21:56'),
(43, 62662499, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(44, 62747398, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 10:59:09'),
(45, 62832199, 111, 1, 'P', NULL, 1, NULL, NULL, NULL, '2025-11-07 09:54:24'),
(46, 62885098, 117, 12, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-17 15:38:25'),
(47, 62888099, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 11:05:34'),
(48, 62898702, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(49, 63933499, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(50, 63959799, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(51, 63959999, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(52, 64192199, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(53, 64404699, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, '2025-11-09 18:21:21'),
(54, 64431598, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(55, 64437200, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 10:57:37'),
(56, 64659300, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(57, 64749300, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(58, 64789900, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 11:11:11'),
(59, 64981900, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(60, 64982300, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 14:02:14'),
(61, 65358601, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 14:26:32'),
(62, 65646001, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(63, 65758301, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(64, 66046901, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, '2025-07-02 15:11:46'),
(65, 66725799, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(66, 67325001, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(67, 79721903, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 13:56:08'),
(68, 79839003, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(69, 79912504, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(70, 79965104, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(71, 80003305, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(72, 80245205, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(73, 81853505, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 11:26:28'),
(74, 81868105, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(75, 81874105, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, '2025-10-04 16:38:33'),
(76, 81887505, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(77, 81890005, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(78, 82061605, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(79, 82065705, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(80, 82104405, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(81, 82158305, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(82, 82166905, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(83, 82174705, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(84, 82176605, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(85, 84790706, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(86, 84832605, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(87, 85871506, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(88, 88763906, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(89, 100891066, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(90, 100892482, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(91, 100892491, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(92, 100892718, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(93, 100893065, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(94, 100893144, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(95, 100893162, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(96, 100895544, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(97, 100895641, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(98, 100895646, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(99, 100896017, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(100, 100896020, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(101, 100896444, 130, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(102, 100896705, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(103, 100899855, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(104, 100901426, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(105, 100901476, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(106, 100901480, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(107, 100901770, 136, 15, 'M', NULL, 1, NULL, NULL, NULL, '2025-11-07 13:53:31'),
(108, 100901822, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(109, 100901886, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(110, 100901902, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(111, 100902011, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(112, 100902205, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(113, 100904746, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(114, 100907044, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(115, 100913617, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-23 14:38:44'),
(116, 100914640, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(117, 100914641, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-15 15:07:24'),
(118, 100914656, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(119, 100915171, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(120, 100915954, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(121, 100917352, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(122, 100918777, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(123, 100907385, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(124, 100907815, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(125, 100908657, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(126, 100908794, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(127, 100908815, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(128, 100911846, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(129, 100912361, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-14 14:11:47'),
(130, 100912908, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(131, 30513199, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 11:18:54'),
(132, 40083292, 109, 1, 'P', NULL, 1, NULL, NULL, NULL, '2025-11-05 11:52:24'),
(133, 40101292, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(134, 40104292, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(135, 40108405, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-15 11:56:29'),
(136, 40155893, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(137, 40182293, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(138, 40254893, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(139, 40318492, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(140, 40419292, 111, 15, 'P', NULL, 7, NULL, NULL, NULL, '2025-11-09 18:55:00'),
(141, 40535392, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(142, 40579193, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 12:00:19'),
(143, 40772095, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(144, 41099995, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(145, 41243192, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(146, 41285095, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-14 10:03:15'),
(147, 41292293, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(148, 41302795, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(149, 41384793, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(150, 41518393, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 11:45:45'),
(151, 48362394, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(152, 41735293, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(153, 41746694, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(154, 41755293, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(155, 42089793, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(156, 42354293, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(157, 42759593, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(158, 42784093, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(159, 42788693, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-09-20 08:42:07'),
(160, 42989393, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(161, 43375599, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(162, 43586494, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 11:38:39'),
(163, 44385893, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(164, 44470295, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(165, 44539593, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 10:51:35'),
(166, 44605993, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(167, 44742795, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(168, 44752195, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-08 15:18:16'),
(169, 44808594, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(170, 45208293, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-10 11:21:23'),
(171, 45695393, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(172, 45783195, 126, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(173, 45974694, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-05-28 12:33:39'),
(174, 46522593, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(175, 47255593, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(176, 47765294, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(177, 48173293, 113, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(178, 48175493, 111, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(179, 48307497, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(180, 48441792, 115, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(181, 100922658, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(182, 100923480, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(183, 100925098, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(184, 100927273, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(185, 100929489, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(186, 100929637, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(187, 100929681, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(188, 100932879, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(189, 100933167, 130, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(190, 100933612, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(191, 100934147, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(192, 101019852, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, '2025-10-01 19:15:00'),
(193, 100939392, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(194, 100939592, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(195, 100943264, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(196, 100943408, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(197, 100946854, 130, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(198, 100947504, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(199, 100947556, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(200, 100947955, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(201, 100948772, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(202, 100953362, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(203, 100953374, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(204, 100953941, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(205, 100957137, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(206, 100957155, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(207, 100959204, 117, 1, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(208, 100959259, 117, 1, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(209, 100959266, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(210, 100959313, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(211, 100971601, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(212, 100975036, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(213, 100975038, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(214, 100975099, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(215, 100975208, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(216, 100975327, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(217, 100975474, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(218, 100975639, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(219, 100975662, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(220, 100975700, 129, 15, 'P', NULL, 1, 7, NULL, NULL, NULL),
(221, 100975726, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(222, 100977448, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(223, 100977455, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(224, 100977461, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(225, 100977528, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(226, 100977530, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(227, 100977534, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(228, 100977568, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(229, 100977588, 117, 8, 'P', NULL, 1, NULL, NULL, NULL, '2025-07-10 11:12:18'),
(230, 100977590, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(231, 100979403, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(232, 100980908, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(233, 100981012, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(234, 100981032, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 14:41:33'),
(235, 100981332, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(236, 100981453, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(237, 100981611, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(238, 100981654, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(239, 100982097, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(240, 100982732, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(241, 100984742, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-11 15:11:44'),
(242, 100984752, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(243, 101018408, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(244, 100984804, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(245, 100984851, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(246, 100985328, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(247, 101012576, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(248, 100985390, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(249, 100987217, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(250, 100987219, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(251, 100987248, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(252, 100987275, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(253, 100987334, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(254, 100987469, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(255, 100989257, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(256, 100989536, 136, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(257, 100989913, 131, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(258, 100989951, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(259, 100990135, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(260, 100990014, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(261, 101013440, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(262, 100990026, 120, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(263, 100990037, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(264, 100990039, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(265, 100990059, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(266, 100990069, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(267, 100990087, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(268, 100990152, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(269, 100990255, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(270, 100990257, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(271, 100990324, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 12:04:15'),
(272, 100991667, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(273, 100994777, 130, 15, 'O', NULL, 1, NULL, NULL, NULL, '2024-07-29 11:47:53'),
(274, 100995288, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(275, 100996320, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(276, 100996372, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(277, 100996397, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(278, 100996459, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(279, 100996506, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(280, 100996631, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(281, 100996826, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(282, 100998138, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(283, 100998141, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(284, 100998201, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(285, 100998231, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(286, 101000631, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(287, 101000853, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(288, 101002290, 121, 15, 'QQ', NULL, 1, NULL, NULL, NULL, NULL),
(289, 101002694, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(290, 101013378, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(291, 101004069, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(292, 101005109, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(293, 101006463, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(294, 101006848, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(295, 101007348, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(296, 101010228, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(297, 101010465, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(298, 101010479, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, '2024-07-29 15:13:32'),
(299, 101010556, 136, 8, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(300, 101010695, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(301, 100930305, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, '2024-08-14 15:31:21'),
(302, 101011270, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(303, 101011350, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(304, 101011373, 131, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(305, 101011563, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(306, 101011622, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(307, 101011851, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(308, 101012037, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(309, 101012779, 136, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(310, 101012810, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(311, 101015237, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(312, 101015257, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(313, 101015261, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(314, 101015263, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(315, 101015282, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(316, 101015288, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(317, 101015292, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(318, 101015296, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(319, 101015947, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(320, 101016226, 131, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(321, 101016235, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(322, 101016268, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(323, 101016315, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(324, 101016478, 130, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(325, 101016480, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(326, 101016491, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(327, 101016541, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(328, 101016800, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(329, 101016817, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(330, 101016897, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(331, 101016989, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(332, 101017995, 136, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(333, 100939509, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(334, 101018590, 136, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(335, 101019174, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(336, 101019763, 131, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(337, 101019860, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(338, 101019866, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(339, 101022744, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(340, 101022746, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(341, 101022747, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(342, 101026781, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(343, 101027498, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(344, 101027679, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(345, 101027713, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(346, 101028522, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(347, 101028541, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(348, 101028552, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(349, 101028558, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(350, 101028564, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(351, 101028569, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(352, 101029072, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(353, 101033092, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(354, 101033436, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(355, 101033499, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(356, 101033857, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(357, 101034814, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(358, 101034843, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(359, 101038557, 136, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(360, 101039141, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(361, 101213661, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(362, 43727394, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(363, 101011457, 133, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(364, 101010254, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(365, 101010265, 117, 1, 'P', NULL, 1, NULL, NULL, NULL, '2025-10-13 08:58:32'),
(366, 100989931, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-29 11:58:09'),
(367, 66275901, 128, 15, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(368, 100900210, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(369, 100990508, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(370, 48607293, 127, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(371, 101028387, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-07-29 15:06:27'),
(372, 100899638, 129, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(373, 100996334, 128, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(374, 101015986, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(375, 80244605, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(376, 100959212, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 14:07:39'),
(377, 101010282, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2025-11-09 18:58:51'),
(378, 101010219, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(379, 101010337, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(380, 101036981, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(381, 100906055, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(382, 100984801, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-14 12:14:27'),
(383, 100940354, 133, 15, 'M', NULL, 1, NULL, NULL, NULL, NULL),
(384, 5442718, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(385, 101043784, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(386, 63907799, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(387, 100980777, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, '2025-10-06 12:30:11'),
(388, 100996748, 129, 15, NULL, NULL, 1, NULL, NULL, NULL, NULL),
(389, 101045636, 136, 15, 'O', NULL, 1, NULL, NULL, NULL, NULL),
(390, 101012476, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(391, 100989995, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(392, 101010344, 120, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(393, 47268993, 117, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(394, 101010147, 121, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(395, 79980104, 128, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(396, 101028143, 129, 15, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(397, 101020429, 121, 12, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(398, 101020614, 121, 11, 'P', NULL, 1, NULL, NULL, NULL, NULL),
(399, 101020683, 120, 1, 'P', NULL, 1, NULL, NULL, NULL, '2025-10-09 11:39:02'),
(400, 101020605, 121, 12, 'P', NULL, 1, NULL, NULL, NULL, '2024-08-12 11:53:58'),
(474, 100980877, 117, 15, 'P', NULL, 1, NULL, NULL, '2024-05-28 12:06:58', NULL),
(475, 15336, 120, 9, 'P', NULL, 1, NULL, NULL, '2024-05-28 12:09:39', NULL),
(478, 50614794, 115, 1, 'P', NULL, 1, NULL, NULL, '2024-07-19 15:15:38', NULL),
(483, 101028186, 120, 15, 'P', NULL, 1, NULL, NULL, '2024-07-22 11:53:58', '2025-10-08 09:27:33'),
(484, 101036957, 120, 1, 'P', NULL, 1, NULL, NULL, '2024-07-24 12:56:28', NULL),
(486, 101020627, 129, 15, 'P', NULL, 1, NULL, NULL, '2024-07-29 14:43:17', NULL),
(492, 101036984, 120, 15, 'P', NULL, 1, NULL, NULL, '2024-07-29 15:28:35', NULL),
(499, 101041612, 133, 15, 'O', NULL, 1, NULL, NULL, '2024-07-30 10:26:27', NULL),
(501, 101039559, 136, 15, 'O', NULL, 1, NULL, NULL, '2024-07-30 10:43:20', NULL),
(510, 61614702, 129, 15, 'P', NULL, 1, NULL, NULL, '2024-08-01 12:16:19', NULL),
(511, 100901790, 129, 15, 'P', NULL, 1, NULL, NULL, '2024-08-01 12:26:43', NULL),
(512, 43967498, 128, 15, 'P', NULL, 1, NULL, NULL, '2024-08-01 12:37:42', NULL),
(516, 101027109, 131, 15, 'O', NULL, 1, NULL, NULL, '2024-08-07 10:50:02', NULL),
(523, 101027027, 136, 15, 'O', NULL, 1, NULL, NULL, '2024-08-07 11:22:57', NULL),
(524, 101010461, 133, 15, 'O', NULL, 1, NULL, NULL, '2024-08-07 11:34:15', NULL),
(525, 101019850, 136, 15, 'O', NULL, 1, NULL, NULL, '2024-08-07 13:59:56', NULL),
(527, 100908549, 128, 15, 'P', NULL, 1, NULL, NULL, '2024-08-07 14:29:40', NULL),
(531, 101016153, 136, 15, 'O', NULL, 1, NULL, NULL, '2024-08-07 15:31:59', NULL),
(532, 100967471, 129, 15, 'M', NULL, 1, NULL, NULL, '2024-08-07 15:49:24', NULL),
(533, 101036888, 120, 15, 'P', NULL, 1, NULL, NULL, '2024-08-09 11:49:47', NULL),
(534, 101039115, 136, 15, 'O', NULL, 1, NULL, NULL, '2024-08-14 09:20:38', '2024-08-14 09:27:07'),
(535, 100928432, 127, 15, 'P', NULL, 1, NULL, NULL, '2024-08-14 12:02:42', '2024-08-14 14:07:31'),
(536, 101018215, 131, 15, 'M', NULL, 1, NULL, NULL, '2024-08-14 13:25:55', NULL),
(556, 101038715, 121, 1, 'P', NULL, 1, NULL, NULL, '2025-10-07 10:44:05', '2025-10-08 09:06:15'),
(557, 101036978, 120, 1, 'P', NULL, 1, NULL, NULL, '2025-10-07 12:54:55', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `provincia`
--

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `idprovincia` int NOT NULL AUTO_INCREMENT,
  `provincia` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `capital` int DEFAULT NULL,
  `prov_abrev` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  PRIMARY KEY (`idprovincia`),
  KEY `fk_capital` (`capital`),
  KEY `fk_pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `provincia`
--

INSERT INTO `provincia` (`idprovincia`, `provincia`, `capital`, `prov_abrev`, `id_pais`) VALUES
(1, 'Benguela', 12, 'BA', 1),
(2, 'Bié', 27, 'BE', 1),
(3, 'Bengo', 4, 'BO', 1),
(4, 'Cabinda', 31, 'CA', 1),
(5, 'Cunene', 44, 'CE', 1),
(6, 'Icolo e Bengo', 206, 'IB', 1),
(7, 'Huambo', 54, 'HO', 1),
(8, 'Huíla', 71, 'HA', 1),
(10, 'Cuando', 39, 'CD', 1),
(11, 'Cuanza Norte', 79, 'CN', 1),
(12, 'Cuanza Sul', 99, 'CS', 1),
(13, 'Luanda', 105, 'LA', 1),
(14, 'Lunda Norte', 244, 'LN', 1),
(15, 'Lunda Sul', 120, 'LS', 1),
(16, 'Malanje', 129, 'ME', 1),
(17, 'Moxico', 142, 'MO', 1),
(18, 'Namibe', 146, 'NE', 1),
(19, 'Uíge', 164, 'UE', 1),
(20, 'Zaire', 167, 'ZE', 1),
(21, 'Cubango', 40, 'CB', 1),
(22, 'Moxico Leste', 273, 'ML', 1),
(23, 'Exterior do País', NULL, 'EP', NULL);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_cargo_pessoa`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_cargo_pessoa`;
CREATE TABLE IF NOT EXISTS `qry_cargo_pessoa` (
`id_estrutura_organica` int
,`contar_cargos` bigint
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_divisao_zonal`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_divisao_zonal`;
CREATE TABLE IF NOT EXISTS `qry_divisao_zonal` (
`DivisaoAdministrativa` varchar(14)
,`municipio` varchar(50)
,`zona` varchar(150)
,`idmunicipio` int
,`provincia` varchar(30)
,`idprovincia` int
,`bairro` varchar(150)
,`tipo_bairro` enum('B','S')
,`idbairro` int
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_eliminar_dependencia`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_eliminar_dependencia`;
CREATE TABLE IF NOT EXISTS `qry_eliminar_dependencia` (
`Descricao_subunidade_filho` varchar(255)
,`Ueo` varchar(68)
,`descricao_subunidade_mae` varchar(255)
,`id_sub_sub_filho` int
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_endereco_completo`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_endereco_completo`;
CREATE TABLE IF NOT EXISTS `qry_endereco_completo` (
`id` int
,`idPessoa` int
,`provincia` varchar(30)
,`municipio` varchar(50)
,`zona` varchar(150)
,`bairro` varchar(150)
,`tipo_bairro` enum('B','S')
,`DivisaoAdministrativa` varchar(14)
,`endereco` varchar(100)
,`endereco_completo` text
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_historico_ordem`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_historico_ordem`;
CREATE TABLE IF NOT EXISTS `qry_historico_ordem` (
`idOrdem` int
,`id` int
,`cod_patente_posterior` int
,`CodTipoOrdem` int
,`CodPatenteActual` smallint
,`TipoAbrev` varchar(5)
,`Grupo_tipo_ordem` int
,`referencia_ordem` varchar(64)
,`PostoActual` varchar(20)
,`idPessoa` int
,`Descricao_tipo_ordem` varchar(255)
,`DATA_ORDEM` date
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_historico_ordem_1`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_historico_ordem_1`;
CREATE TABLE IF NOT EXISTS `qry_historico_ordem_1` (
`CodTipoOrdem` int
,`TipoAbrev` varchar(5)
,`Grupo_tipo_ordem` int
,`referencia_ordem` varchar(64)
,`Descricao_tipo_ordem` varchar(255)
,`DATA_ORDEM` date
,`id` int
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_listapromocao`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_listapromocao`;
CREATE TABLE IF NOT EXISTS `qry_listapromocao` (
`Modalidade` varchar(12)
,`cod_patente_posterior` int
,`id_especialidade` int
,`Classe` varchar(42)
,`nip` int
,`nome` varchar(80)
,`CodPatenteActual` smallint
,`PostoActual` varchar(20)
,`Posto_a_promover` varchar(20)
,`idPessoa` int
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_reformados_nova`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_reformados_nova`;
CREATE TABLE IF NOT EXISTS `qry_reformados_nova` (
`id_pessoa_fisica` int
,`nome` varchar(80)
,`idade` bigint
,`tempo_servico` bigint
,`nip` int
,`id_patente` smallint
,`FPS` varchar(3)
,`PostoAbrev` varchar(5)
,`Posto_Id` smallint
,`ueo_especialidade` varchar(68)
,`Classe` varchar(42)
,`id_uni_colocado` smallint
,`unidade_colocado` varchar(68)
,`cargo` varchar(255)
,`cargocolocacao` text
,`foto_militar` varchar(255)
,`quadro_especial` varchar(6)
,`Data_Nascimento` date
,`Data_Incorporacao` varchar(10)
,`Tpo_Incorporacao` varchar(50)
,`LIMITE_IDADE` decimal(5,0)
,`TSM` int unsigned
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para vista `qry_sem_dependencia`
-- (Veja abaixo para a view atual)
--
DROP VIEW IF EXISTS `qry_sem_dependencia`;
CREATE TABLE IF NOT EXISTS `qry_sem_dependencia` (
`descricao_subunidade_filho` varchar(255)
,`id_sub_sub_filho` int
,`id_estrutura_organica` int
,`nome_cargo` varchar(255)
,`descricao_sub_unidade` varchar(255)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `quadro_especial_eo`
--

DROP TABLE IF EXISTS `quadro_especial_eo`;
CREATE TABLE IF NOT EXISTS `quadro_especial_eo` (
  `id_quadro_especial_eo` int NOT NULL AUTO_INCREMENT COMMENT 'possiveis quadro especiais para o cargo',
  `id_cargo` int NOT NULL,
  `id_quadro_especial` tinyint NOT NULL,
  PRIMARY KEY (`id_quadro_especial_eo`) USING BTREE,
  KEY `id_cargo` (`id_cargo`) USING BTREE,
  KEY `id_quadro_especial` (`id_quadro_especial`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `quadro_especial_eo`
--

INSERT INTO `quadro_especial_eo` (`id_quadro_especial_eo`, `id_cargo`, `id_quadro_especial`) VALUES
(1, 5, 19);

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'web', '2025-03-12 19:40:29', '2025-03-12 19:40:29'),
(2, 'Admin', 'web', '2025-03-12 19:40:29', '2025-03-12 19:40:29'),
(3, '1º Oficial da RPSI', 'web', '2025-03-12 19:40:30', '2025-09-15 10:29:27'),
(4, 'Oficial da RPSI', 'web', '2025-03-12 19:40:31', '2025-09-15 10:29:49');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(40, 2),
(41, 2),
(42, 2),
(46, 2),
(47, 2),
(48, 2),
(50, 2),
(51, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(1, 3),
(2, 3),
(5, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(40, 3),
(41, 3),
(42, 3),
(46, 3),
(47, 3),
(48, 3),
(50, 3),
(51, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(61, 3),
(2, 4),
(4, 4),
(5, 4),
(35, 4),
(36, 4),
(37, 4),
(38, 4),
(40, 4),
(41, 4),
(42, 4),
(46, 4),
(47, 4),
(48, 4),
(50, 4),
(51, 4),
(54, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(61, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('gZOFts1icZ0MQb6wuMpmbmYoIVxgOtLVyzFEKH6j', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiY2tNVExVUTdvd3dkaE52SktFSDlpdnBMaUU1R001ak90R0h2ajFoNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbmRleC1kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1762722561);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sexo`
--

DROP TABLE IF EXISTS `sexo`;
CREATE TABLE IF NOT EXISTS `sexo` (
  `id_sexo` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_sexo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `sexo`
--

INSERT INTO `sexo` (`id_sexo`) VALUES
('F'),
('M');

-- --------------------------------------------------------

--
-- Estrutura da tabela `situacao_condicoes`
--

DROP TABLE IF EXISTS `situacao_condicoes`;
CREATE TABLE IF NOT EXISTS `situacao_condicoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_situacao` int DEFAULT NULL,
  `descricao` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `situacao_Servico` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `situacao_condicoes`
--

INSERT INTO `situacao_condicoes` (`id`, `id_situacao`, `descricao`) VALUES
(1, 1, 'Comissão Normal de Serviço'),
(2, 1, 'Inactividade Temporária'),
(3, 1, 'Comissão Especial'),
(4, 1, 'Licença Registada'),
(5, 1, 'Licença Ilimitada'),
(6, 2, 'Por TSM'),
(7, 3, 'Por Limite de Idade'),
(8, 3, 'Por TSM'),
(9, 3, 'Por Doença'),
(10, 3, 'A Seu Pedido '),
(11, 3, 'Por Questões Judiciais'),
(12, 4, 'Situação Regular'),
(13, 4, 'Desaparecido'),
(14, 4, 'Preso'),
(15, 4, 'Morto');

-- --------------------------------------------------------

--
-- Estrutura da tabela `situacao_servico`
--

DROP TABLE IF EXISTS `situacao_servico`;
CREATE TABLE IF NOT EXISTS `situacao_servico` (
  `id_situacao` int NOT NULL AUTO_INCREMENT,
  `nome_situacao` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `situacao_servico`
--

INSERT INTO `situacao_servico` (`id_situacao`, `nome_situacao`) VALUES
(1, 'Activo'),
(2, 'Reserva'),
(3, 'Reforma'),
(4, 'Outras Situações');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcategoriapatente`
--

DROP TABLE IF EXISTS `tbcategoriapatente`;
CREATE TABLE IF NOT EXISTS `tbcategoriapatente` (
  `CodCategoriaPatente` tinyint NOT NULL,
  `DescCategoriaPatente` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CodCategoriaPatente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbcategoriapatente`
--

INSERT INTO `tbcategoriapatente` (`CodCategoriaPatente`, `DescCategoriaPatente`) VALUES
(1, 'Oficiais'),
(2, 'Sargentos'),
(3, 'Praças'),
(4, 'Civis');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbgrupopatente`
--

DROP TABLE IF EXISTS `tbgrupopatente`;
CREATE TABLE IF NOT EXISTS `tbgrupopatente` (
  `CodGrupoPatente` tinyint NOT NULL,
  `CodCategoriaPatente` tinyint DEFAULT NULL,
  `DescGrupoPatente` varchar(28) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CodGrupoPatente`) USING BTREE,
  KEY `CodCategoriaPatente` (`CodCategoriaPatente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbgrupopatente`
--

INSERT INTO `tbgrupopatente` (`CodGrupoPatente`, `CodCategoriaPatente`, `DescGrupoPatente`) VALUES
(1, 1, 'Oficiais Generais/Almirantes'),
(2, 1, 'Oficiais Superiores'),
(3, 1, 'Oficiais Capitães'),
(4, 1, 'Oficiais Subalternos'),
(5, 2, 'Sargentos'),
(6, 3, 'Praças'),
(7, 4, 'Civis');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_agregado_familiar`
--

DROP TABLE IF EXISTS `tbl_agregado_familiar`;
CREATE TABLE IF NOT EXISTS `tbl_agregado_familiar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nome_Agr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Data_Nasc_Agr` date DEFAULT NULL,
  `Sexo_Agr` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idGrauParentesco` int DEFAULT NULL,
  `Provincia` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPessoa` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_agregado_familiar`
--

INSERT INTO `tbl_agregado_familiar` (`id`, `Nome_Agr`, `Data_Nasc_Agr`, `Sexo_Agr`, `idGrauParentesco`, `Provincia`, `idPessoa`) VALUES
(12, 'NICETE CANDIDO VASCO FERREIRA', '1991-04-27', 'F', 3, 'LA', 380),
(13, 'EUGÉNIA ADRIELE VASCO FERREIRA', '2017-12-25', 'F', 4, 'LA', 380),
(14, 'MALUAZI ISABEL PAULO', '2000-08-13', 'F', 3, 'UI', 271),
(15, 'ANA TCHOCOVINHO CONDE', '2009-09-10', 'F', 4, 'HO', 271),
(16, 'REGINA GOMBO CONDE', '2018-05-18', 'F', 4, 'CA', 271),
(17, 'ELIÉZER BIDI CONDE', '2021-05-05', 'M', 4, 'LA', 271),
(27, 'NEUSA DAS DORES CHINAKUSSOKI KANGANJI CHIPETA', '1978-10-03', 'F', 3, 'BA', 67),
(28, 'ADMAR NDEMBELEKI DOS SANTOS MINÓ', '1998-09-30', 'M', 4, 'HO', 67),
(29, 'EDITH MARIA CROSBE DOS SANTOS MINÓ', '2008-10-19', 'F', 4, 'MO', 67),
(30, 'HELDER OLIVEIRA CHIKOMO DOS SANTOS MINÓ', '1998-10-21', 'M', 4, 'BA', 67),
(31, 'ELENA FELISMINA MAMBAMBI DOS SANTOS MINÓ', '2013-07-01', 'F', 4, 'MO', 67),
(32, 'HERLANDER CHIAKA DOS SANTOS MINÓ', '2005-02-16', 'M', 4, 'MO', 67),
(33, 'ELIZETH VICUNGA SAMUEL COLOMBO', '1985-01-21', 'F', 3, 'BE', 162),
(34, 'JULIA CHITUNDO TERESA FUNETE', '1996-07-31', 'F', 4, 'BE', 162),
(35, 'ISABEL MUENGUENO JOSE', '1999-12-04', 'F', 4, 'BE', 162),
(36, 'LUAMBA FUNETE', '2004-12-24', 'M', 4, 'BE', 162),
(37, 'LAURINDO FUNETE', '2004-02-27', 'M', 4, 'BE', 162),
(38, 'JORGINA MANUELA VIENGA FUNETE', '2008-05-15', 'F', 4, 'BE', 162),
(39, 'EUNICE FUNETE', '2010-11-18', 'F', 4, 'BE', 162),
(40, 'LUCIA ZECA COLOMBO FUNETE', '2014-12-28', 'F', 4, 'BE', 162),
(41, 'AMELIA JOANA CANGUIA', '1974-04-07', 'F', 3, 'HU', 175),
(42, 'NATALIA FELICIDADE PAMI', '1995-03-21', 'F', 4, 'HU', 175),
(43, 'GERTRUDE DA CONCEIÇÃO CANGUIA PAMI', '1999-08-07', 'F', 4, 'HU', 175),
(44, 'RIBEIRO FELISBERTO CANGUIA PAMI', '2006-12-09', 'M', 4, 'KK', 175),
(45, 'BENITA JULIANA PONGOLOLA PAMI', '2003-10-15', 'F', 4, 'HU', 175),
(46, 'ALEGRIA DOMINGOS CANGUIA PAMI', '2002-04-19', 'M', 4, 'HU', 175),
(47, 'BENEDITO MARQUES PAMI', '1998-05-23', 'M', 4, 'HU', 175),
(48, 'GRACIANO ANDRE CANGUIA PAMI', '2013-02-08', 'M', 4, 'HU', 175),
(49, 'FANTILHA ANA MARTINHO', '1974-08-10', 'F', 3, 'MO', 160),
(50, 'VENANCIA ANA FRANCISCO', '1996-03-07', 'F', 4, 'MO', 160),
(51, 'FERNANDA ESMERALDA MANUEL FRANCISCO', '2001-02-21', 'F', 4, 'MO', 160),
(52, 'GEONIZA MANUEL FRANCISCO', '2002-05-08', 'F', 4, 'MO', 160),
(53, 'EDSON MANUEL FRANCISCO', '2003-08-28', 'M', 4, 'MO', 160),
(54, 'CUSTODIO PEDRO FRANCISCO', '2005-01-27', 'M', 4, 'MO', 160),
(55, 'EDNA ANA FRANCISCO', '2006-09-17', 'M', 4, 'MO', 160),
(56, 'GELSON MANUEL FRANCISCO', '2005-09-14', 'M', 4, 'MO', 160),
(57, 'HENRIQUES SAMABTI MARTINHO FRANCISCO', '2011-04-01', 'M', 4, 'MO', 160),
(58, 'EDIVALDO TCHINGANDA MANUEL FRANCISCO', '2008-01-05', 'M', 4, 'MO', 160),
(59, 'VERISSIMO TCHINGANDA MANUEL FRANCISCO', '2010-10-02', 'M', 4, 'MO', 160),
(60, 'FÁTIMA FERNANDES DOS SANTOS', '1974-04-04', 'F', 3, 'KN', 173),
(61, 'PÁTRICIA DA COSTA PAULINO', '1999-04-09', 'F', 4, 'LA', 173),
(62, 'VÍNICIO DOS SANTOS PAULINO', '2002-05-13', 'M', 4, 'LA', 173),
(63, 'BRUNO DOS SANTOS PAULINO', '2003-06-13', 'M', 4, 'LA', 173),
(64, 'OSVALDO DOS SANTOS PAULINO', '2006-09-13', 'M', 4, 'LA', 173),
(65, 'MÁRCIA DOS SANTOS PAULINO', '2009-03-09', 'F', 4, 'LA', 173),
(66, 'FÁNIA ALICE DOS SANTOS PAULINO', '2012-03-18', 'F', 4, 'LA', 173),
(67, 'DELFINA JOSÉ MATOS', NULL, 'F', 8, 'UI', 173),
(68, 'VIDILSON JOÃO PAULINO', '2000-05-09', 'M', 4, 'KN', 173),
(69, 'HELTON JOÃO PAULINO', '2009-02-09', 'M', 4, 'LA', 173),
(70, 'RITA JOÃO PAULINO', '2011-10-14', 'F', 4, 'LA', 173),
(71, 'GLAUBEL MUQUINDA DE BRITO', '2019-12-19', 'F', 4, 'LA', 364),
(72, 'GENOVEVA SEBASTIÃO FRANCISCO', '2001-02-08', 'F', 3, 'LA', 398),
(73, 'JOSUALDA FRANCISCO MBASSI', '2021-02-22', 'F', 4, 'LA', 398),
(74, 'DENIA ALZIRA GUERREIRO CORREIA', '2018-05-08', 'F', 4, 'LA', 378),
(75, 'DENISE PAULA GUERREIRO CORREIA', '2018-05-08', 'F', 4, 'LA', 378),
(76, 'EUVANIA FILOMENA PAULO GUERREIRO CORREIA', '1996-06-22', 'F', 3, 'LA', 378),
(78, 'ESPERANÇA ARMANDO MANJAI RIBEIRO', '1990-04-29', 'F', 3, 'LA', 223),
(79, 'ELINA ELIANA MANJAI RIBEIRO', '2016-01-14', 'F', 4, 'LA', 223),
(80, 'ELISAMA ELISA MANJAI RIBEIRO', '2018-06-17', 'F', 4, 'LA', 223),
(81, 'ELIADA ESPERANÇA MANJAI RIBEIRO', '2018-06-17', 'F', 4, 'LA', 223),
(82, 'YARIN ISANA MANJAI RIBEIRO', '2021-07-23', 'F', 4, 'LA', 223),
(84, 'TÁNIA CORREIA TAMBO', '2009-06-16', 'F', 4, NULL, 165),
(85, 'MARCIA ADELINA CORREIA TAMBO', '2011-02-23', 'F', 4, NULL, 165),
(86, 'EDIVALDO AGOSTINHO TAMBO', '2007-07-14', 'M', 4, NULL, 165),
(87, 'NEID MANUELA DIOGO TAMBO', '1998-11-27', 'F', 4, NULL, 165),
(88, 'ELIZABETH ANA DIOGO TAMBO', '1996-04-18', 'F', 4, NULL, 165),
(89, 'IRIANA DIOGO TAMBO', '1993-12-02', 'F', 4, NULL, 165),
(95, 'GARCIA AGOSTINHO TAMBO', '2012-08-16', 'M', 4, NULL, 165),
(96, 'JOSEMAR AGOSTINHO TAMBO', '2014-09-06', 'M', 4, NULL, 165),
(97, 'ISABEL JOÃO DOMINGOS', '1982-09-05', 'F', 3, 'MA', 73),
(98, 'DELVIO PIO JOÃO ALFREDO', '2007-01-30', 'M', 4, 'MA', 73),
(99, 'SOLENE DA CONCEIÇÃO DOS SANTOS CAMBAMBA', '2009-08-26', 'F', 4, 'MA', 73),
(100, 'SAVIA DA CONCEIÇÃO DOMINGOS CAMBAMBA', '2009-11-09', 'F', 4, 'MA', 73),
(101, 'EULALIA SOFIA DOS SANTOS CAMBAMBA', '2011-08-13', 'F', 4, 'MA', 73),
(102, 'JORGINA JOSIANE DOMINGOS CAMBAMA', '2012-07-04', 'F', 4, 'MA', 73),
(103, 'TILCIO DOS SANTOS CAMBAMBA', '2013-08-12', 'M', 4, 'MA', 73),
(104, 'ALFREDO DOMINGOS CAMBAMBA', '2016-12-16', 'M', 4, 'MA', 73),
(105, 'FLORIANA TERESA DOS SANTOS CAMBAMBA', '2015-12-19', 'F', 4, 'MA', 73),
(106, 'ESIO PIO JOÃO ALFREDO', '2002-02-27', 'M', 4, 'MA', 73),
(107, 'ALEXANDRA DALA JOSE', '2015-12-30', 'F', 4, 'LA', 241),
(108, 'ELISA CHITULA SALUSSINGA VIEGAS', '1990-04-21', 'F', 3, 'LA', 316),
(109, 'LARISSA ISABEL SALUSSINGA VIEGAS', '2017-09-13', 'F', 4, 'LA', 316),
(110, 'Derick Artur Rodrigues', '2021-04-24', 'M', 4, 'LA', 291),
(111, 'Marcelina Inacio Calei', '1994-04-04', 'F', 3, 'MA', 352),
(112, 'Adriano Calei Samuel', '2014-10-28', 'M', 4, 'LA', 352),
(113, 'Belmiro Calei Samuel', '2017-09-27', 'M', 4, 'LA', 352),
(114, 'Délcia Motondeno Samuel', '2021-03-17', 'F', 4, 'BA', 352),
(117, 'JOFLENIA DALA JOSÉ', '2022-05-03', 'F', 4, 'LA', 241),
(118, 'TERAUDINA DALA JOSÉ', '2024-03-19', 'F', 4, 'LA', 241),
(119, 'FELICIANA ALEXANDRA DALA ', '1989-08-15', 'F', 3, 'LA', 241),
(120, 'Ana Mariza F. Pinto', '1976-10-28', 'F', 3, 'KS', 159),
(121, 'Nawet Pinto Constantino', '1994-12-22', 'F', 4, 'LA', 159),
(122, 'Vatelcio Pinto Constantino', '1997-04-29', 'M', 4, 'LA', 159),
(123, 'Aguinaldo Camia Pinto Constante', '2000-09-02', 'M', 4, 'LA', 159),
(124, 'Edvania S. Pinto Constantino', '2013-11-04', 'F', 4, 'LA', 159),
(125, 'Antónia G. de Nascimento', '1976-04-24', 'F', 3, 'LA', 6),
(126, 'Victoria Jamba Sachivole ', '1986-02-17', 'F', 3, 'KN', 6),
(127, 'Milto Francisco N. Boa', '1995-07-23', 'M', 4, 'LA', 6),
(128, 'Heicli Lourenço Boa', '2001-11-24', 'M', 4, 'LA', 6),
(129, 'Esperança do Nascimento Boa', '1999-07-22', 'F', 4, 'LA', 6),
(130, 'Isabel do Nascimento Boa', '1997-10-08', 'F', 4, 'LA', 6),
(131, 'Anastacio do Nascimento Boa', '2014-06-07', 'M', 4, 'LA', 6),
(132, 'Daniel Sachivole Boa', '2016-11-06', 'M', 4, 'LA', 6),
(133, 'Boa Francisco Sachivole Boa', '2019-11-03', 'M', 4, 'LA', 6),
(134, 'Boa Francisco Sachivole Boa', '2019-11-03', 'M', 4, 'LA', 6),
(137, 'Marta Alice Ngongo Gaspar', '1976-05-13', 'F', 3, 'LA', 167),
(138, 'Aldina Alice das Graças Gaspar', '1995-07-09', 'F', 4, 'LA', 167),
(139, 'Afonso Alice Graças Gaspar', '2000-04-03', 'M', 4, 'LA', 167),
(140, 'Francisco Paulino Ngongo Gaspar', '2003-07-09', 'M', 4, 'LA', 167),
(141, 'Luaa Samana Ngongo Gaspar', '2017-10-10', 'F', 4, 'LA', 167),
(142, 'Honorato Hamilton Garrido Gomes', '1964-09-29', 'M', 3, 'LA', 79),
(143, 'Jocelino Terencio de Mendes da Conceição', '2002-08-21', 'M', 4, 'LA', 79),
(144, 'Alcemo G.D. Gomes', '2012-05-22', 'M', 4, 'LA', 79),
(145, 'Adelaide Luísa Nascimento Pedro', '1972-09-08', 'F', 3, 'BE', 146),
(146, 'Felomena José Gonga', '1978-10-28', 'F', 3, 'LN', 146),
(147, 'Wilson Nassanda Pedro', '1992-12-29', 'M', 4, 'LA', 146),
(148, 'Wilson Nassanda Pedro', '1992-12-29', 'M', 4, 'LA', 146),
(149, 'Marcio Nassanda Pedro', '1997-03-15', 'M', 4, 'LA', 146),
(150, 'Maria Francisco Pedro', '2002-08-14', 'F', 4, 'LA', 146),
(151, 'Claudeth Gonga Pedro', '2006-07-13', 'F', 4, 'LA', 146),
(152, 'Stela Filomena Gonga Pedro', '2003-10-05', 'F', 4, 'LA', 146),
(153, 'Ana Molosso Pedro', '2006-11-26', 'F', 4, 'LA', 146),
(159, 'Helena Mendonça Hombe Gonçalves', '1990-06-09', 'F', 3, 'LA', 114),
(160, 'Dionisia Benção Hombe Gonçalves', '2010-11-28', 'F', 4, 'LA', 114),
(161, 'Josué Benção Hombe Gonçalves', '2015-08-08', 'M', 4, 'LA', 114),
(162, 'Domingas Benção Hombe Gonçalves', '2022-07-29', 'F', 4, 'LA', 114),
(163, 'Luísa Meneza Sebastião', '1984-05-08', 'F', 3, 'LA', 46),
(164, 'Hernany Matias Felizardo dos Santos', '2004-10-13', 'M', 4, 'LA', 46),
(165, 'Claúdio Matias Felizardo dos Santos ', '2006-12-10', 'M', 4, 'LA', 46),
(166, 'Ernesto Costa dos Santos', '2008-04-21', 'M', 4, 'LA', 46),
(167, 'Hermenegildo M. Felizardo dos santos', '2012-03-29', 'M', 4, 'LA', 46),
(168, 'Claúdia Felizarda Costa dos Santos', '2014-02-19', 'M', 4, 'LA', 46),
(169, 'Azayeny Matias Felizardo dos Santos', '2021-02-20', 'M', 4, 'LA', 46),
(170, 'Belmania Moises Domingos', '2001-10-01', 'F', 8, 'LA', 46),
(171, 'Rosa da Conceição G. Alexandre', '1993-07-07', 'F', 3, 'LA', 302),
(172, 'Carolina da Conceição G. Alexandre', '2013-01-26', 'F', 4, 'LA', 302),
(173, 'Neusa da Conceição G. Alexandre', '2016-12-20', 'M', 4, 'LA', 302),
(174, 'Rufina da Conceição G. Alexandre', '2022-08-01', 'F', 4, 'LA', 302),
(180, 'Eva de Almeida Francisco da Mata', '1988-04-04', 'F', 3, 'LA', 115),
(181, 'Dadiva eva da Mata', '2023-03-02', 'F', 4, 'LA', 115),
(182, 'Patrícia Tomás  ', '2004-01-02', 'F', 4, 'LA', 200),
(183, 'Domingas Tomás ', '2007-09-08', 'F', 4, 'LA', 200),
(184, 'Morais Tomás ', '2012-01-30', 'M', 4, 'LA', 200),
(185, 'Waldemiro Tomás  ', '2016-01-01', 'M', 4, 'CA', 200),
(186, 'Rosa Tomás ', '2019-04-05', 'M', 4, 'CA', 200),
(187, 'Júlio Tomás', '2022-09-19', 'M', 3, 'CA', 200),
(188, 'Branca Sebastião Artur', '1995-09-09', 'F', 3, 'LA', 291),
(189, 'Florinda Luís Rodrigues ', '0001-01-01', 'F', 3, 'LA', 131),
(190, 'Elias de Almeida Domingos', '0001-01-01', 'M', 4, 'LA', 131),
(191, 'Eliane Vanora Domingos ', '0001-01-01', 'F', 4, 'LA', 131),
(192, 'Elizana Cambanza Domingos', '0001-01-01', 'F', 3, 'LA', 131),
(193, 'Silvana Victor Yola Mucuri', '2022-10-09', 'F', 3, 'LA', 248),
(194, 'Yamini M. Mucuri', '2018-05-06', 'M', 4, 'LA', 248),
(195, 'Atalaia de Cristo T.Y Mucuri', '2022-09-17', 'F', 4, 'LA', 248),
(196, 'Maria Helena M. Luís Micolo', '1991-02-24', 'F', 3, 'LA', 486),
(197, 'Gael Joel Luís Micolo', '2021-12-31', 'M', 4, 'LA', 486),
(198, 'Eunice Ester Kusese Gamba', '1998-07-16', 'F', 3, 'HO', 492),
(199, 'Valentina C.J Chihucunda', '1996-09-19', 'F', 3, 'LA', 298),
(200, 'Audácio Jarede Chihucunda João ', '2017-09-20', 'M', 4, 'LA', 298),
(201, 'Leonel José Chihunda João ', '2019-12-13', 'M', 4, 'LA', 298),
(202, 'Joselia Nhama Elizabeth', '2015-11-11', 'F', 8, 'LA', 298),
(203, 'Laurinda Manuel Mateus ', '1984-05-04', 'F', 3, 'HU', 180),
(204, 'Anselmo Júlio A. Kameia', '1994-07-20', 'M', 4, 'HU', 180),
(205, 'Alfredo Nongava K.V Cameia', '0199-02-28', 'F', 4, 'HU', 180),
(207, 'Adélia F.A Cameia', '2000-12-07', 'F', 4, 'HU', 180),
(208, 'Aderito G.M. Cameia', '2007-01-08', 'M', 4, 'HU', 180),
(209, 'Laurindo Eduardo .K Cameia', '2007-03-22', 'M', 4, 'HU', 180),
(210, 'João Tchatumba M. Cameia', '2012-03-02', 'M', 4, 'HU', 180),
(211, 'Catarina Nalissimo M. Cameia', '2010-02-21', 'F', 4, 'HU', 180),
(212, 'Elisabeth Mateus Cameia', '2015-10-14', 'F', 4, 'HU', 180),
(213, 'Claudina Vunge da Costa', '1993-08-17', 'F', 4, 'KN', 31),
(214, 'Esperança Mendes da Costa', '1997-01-01', 'F', 4, 'KN', 31),
(215, 'Ermenegilda V. da Costa', '2008-12-08', 'F', 4, 'KN', 31),
(216, 'José Carlos da Costa', '2009-01-21', 'M', 4, 'KN', 31),
(217, 'Palmira António da Costa', '2012-02-23', 'M', 4, 'KN', 31),
(218, 'Helena da Costa', '2003-08-07', 'F', 4, 'KN', 31),
(219, 'Neto Pinto da Costa ', '2017-06-05', 'M', 4, 'KN', 31),
(220, 'Cascalho Pinto da Costa', '2015-10-09', 'M', 4, 'KN', 31),
(221, 'Luzola Esperança', '1996-12-12', 'F', 3, 'LA', 294),
(222, 'Anastácio Bunga Afonso ', '2018-11-09', 'M', 4, 'LA', 294),
(223, 'Jureuma Afonso ', '2018-11-14', 'F', 4, 'LA', 294),
(224, 'Eugenia Afonso', '2021-11-11', 'F', 4, 'LA', 294),
(225, 'Rosa da Silva', '1980-05-22', 'F', 3, 'UI', 24),
(226, 'Laurinda Daniel João', '2000-03-12', 'F', 4, 'UI', 24),
(227, 'Paula da Silva João', '2003-05-10', 'M', 4, 'UI', 24),
(228, 'Pedrito da Silva João', '2005-03-03', 'M', 4, 'UI', 24),
(229, 'Maria da Silva João', '2007-05-05', 'F', 4, 'UI', 24),
(230, 'Leitão da Silva João', '2010-02-20', 'M', 4, 'UI', 24),
(231, 'Suzana da Silva João', '2012-08-03', 'F', 4, 'UI', 24),
(232, 'Lopes da Silva João', '2015-08-15', 'M', 4, 'UI', 24),
(233, 'Isabel da Silva João', '2018-01-05', 'F', 4, 'UI', 24),
(234, 'Emanuel da Silva João ', '2021-04-14', 'M', 4, 'UI', 24),
(235, 'Julieta Ernesto Pedro', '2003-11-24', 'F', 4, 'UI', 512),
(236, 'Teresa Pedro Francisco', '2006-04-24', 'F', 4, 'UI', 512),
(237, 'Francisco Pedro Francisco', '2009-04-25', 'F', 4, 'UI', 512),
(238, 'Inocêncio Pedro Francisco', '2006-05-24', 'M', 4, 'UI', 512),
(239, 'Gouveia João Pedro Francisco', '2011-10-03', 'M', 4, 'UI', 512),
(240, 'Gama Pedro Francisco', '2013-09-24', 'M', 4, 'UI', 512),
(241, 'Josimario Pedro Francisco', '2017-06-22', 'M', 4, 'UI', 512),
(242, 'Maricleni Pedro Francisco', '2021-02-03', 'F', 4, 'UI', 512),
(243, 'Cristina C. Francisco', '1997-04-24', 'M', 4, 'LA', 150),
(244, 'Marlene Maria A. Francisco', '1998-10-16', 'F', 4, 'LA', 150),
(245, 'Tatiana Francisco ', '2001-09-06', 'F', 4, 'LA', 150),
(246, 'Nazare Francisco', '2003-09-23', 'F', 4, 'LA', 150),
(247, 'Francisca Caetano Francisco', '2008-05-30', 'F', 4, 'LA', 150),
(248, 'Marques Martins Francisco', '2006-05-19', 'M', 4, 'LA', 150),
(249, 'Adão Carlos Francisco', '2012-01-31', 'M', 4, 'LA', 150),
(250, 'Conceição P. Francisco', '2021-06-14', 'F', 4, 'LA', 150),
(251, 'Delfina J. Adão Francisco', '1990-05-30', 'F', 3, 'LA', 150),
(257, 'Helmer Domingos Pacheco', '2015-08-30', 'M', 4, 'HO', 264),
(258, 'Aleixa de jesus Miranda Ekuikui', '2022-05-31', 'F', 4, 'HO', 267),
(259, 'Francisco Osvaldo Mateus Oliveira', '2011-02-02', 'M', 4, 'HO', 195),
(260, 'Eduardo C. Kapitango Oliveira', '2012-01-17', 'M', 4, 'HO', 195),
(261, 'Eulario Tiago Laurindo Oliveira', '2014-01-05', 'M', 4, 'HO', 195),
(262, 'Edna M.M. da Costa Figueira', '2016-07-05', 'F', 3, 'BE', 259),
(263, 'Welwitchia Figueira ', '2016-07-05', 'M', 4, 'BE', 259),
(264, 'Dorivaldo G. Quinhata', '2019-12-13', 'M', 4, 'KS', 524),
(321, NULL, NULL, NULL, NULL, NULL, 548),
(322, NULL, NULL, NULL, NULL, NULL, 549),
(323, NULL, NULL, NULL, NULL, NULL, 550),
(324, NULL, NULL, NULL, NULL, NULL, 551),
(325, 'xxxxxxhhhhhhhh', '1999-02-02', 'M', 8, '17', 553),
(351, 'Firmino Hernani André Jiko', NULL, 'M', 4, NULL, 20),
(352, 'César Bunga Jiko', NULL, 'M', 4, NULL, 20),
(353, 'Joana Bunga Jiko', NULL, 'F', 4, NULL, 20),
(354, 'Aurora Mateus Jiko', NULL, 'F', 4, NULL, 20),
(355, 'António Raimundo da Cruz Jiko', NULL, 'M', 4, NULL, 20),
(356, 'João da Cruz Jiko', NULL, 'M', 4, NULL, 20),
(357, 'Feliciana Leitão Jiko', NULL, 'F', 4, NULL, 20),
(358, 'Adalberto Leitão Jiko', NULL, 'M', 4, NULL, 20),
(359, 'Mariano Bunga Jiko', NULL, 'M', 4, NULL, 20),
(360, 'Janeth Leitão Bunga', NULL, 'F', 3, NULL, 20),
(493, 'Ivone Isabel Ferreira Calelesa António', '1998-05-21', 'F', 3, NULL, 399),
(494, 'Lyvia Jerusa Calelesa António', '2023-02-07', 'F', 4, NULL, 399),
(516, 'Olga Paciência Paulino Baptista', '1995-11-20', 'F', 3, '17', 365),
(517, 'Everson Otchaly Paulino Baptista', '2023-03-27', 'M', 4, '13', 365),
(546, 'GUELMA M. MUTANGO ANTONIO', '1993-12-06', 'F', 4, NULL, 25),
(547, 'LUDIA ELISA JOAQUIM ANTONIO', '1993-05-05', 'F', 4, NULL, 25),
(548, 'ILDA PAULA JOAQUIM ANTONIO', '1996-09-13', 'F', 4, NULL, 25),
(549, 'IVANDER GARCIA JOAQUIM ANTONIO', '1998-11-14', 'M', 4, NULL, 25),
(550, 'ALCAIDE MAIALA JOAQUIM ANTONIO', '2001-05-03', 'M', 4, NULL, 25),
(551, 'DIONISIA FINESA JOAQUIM ANTONIO', '2005-10-18', 'F', 4, NULL, 25),
(552, 'NAYARA ISABEL JOAQUIM ANTONIO', '2004-04-06', 'F', 4, NULL, 25),
(553, 'ORLANDO JOSE MANUEL ANTONIO', '2008-08-21', 'M', 4, NULL, 25),
(554, 'USSEMUA ALBERTO C. ANTONIO', '2018-05-08', 'M', 4, NULL, 25),
(562, 'Inês M. Cavimbi', NULL, 'F', 3, NULL, 45),
(563, 'Alice Njepele Felix Cavimbi', NULL, 'F', 4, NULL, 45),
(564, 'Madalena Claribela Manuel Cavimbi', NULL, 'F', 4, NULL, 45),
(565, 'Maravilha Luzia Manuel Cavimbi', NULL, 'F', 4, NULL, 45),
(566, 'Albertina Serena Manuel Cavimbi', NULL, 'F', 4, NULL, 45),
(567, 'Alberto Alexandre Manuel Cavimbi', NULL, 'M', 4, NULL, 45),
(568, 'Adriela Cuva Manuel Cavimbi', NULL, 'F', 4, NULL, 45),
(605, 'Elizabeth F.F. de Almeida', '1983-06-15', 'F', 3, NULL, 53),
(606, 'Julião L. de A. Francisco', '2004-05-12', 'M', 4, NULL, 53),
(607, 'Milsa L. de A. Francisco', '2013-06-28', 'F', 4, NULL, 53),
(608, 'Filomena B. da F. Alves', '1950-11-02', 'F', 2, NULL, 53),
(609, 'Benvinda F. de A. Francisco', '2016-04-30', 'F', 4, NULL, 53),
(615, 'Matondo Kuenbaki', '1981-08-16', 'F', 3, NULL, 140),
(616, 'Conceição de Fatima Romão', '1988-11-28', 'F', 4, NULL, 140),
(617, 'Inês de Fatima Romão', '1991-04-20', 'F', 4, NULL, 140),
(618, 'Raul Luís Romão', '1996-10-07', 'M', 4, NULL, 140),
(619, 'Luís Kuinbaki Romão', '2014-11-08', 'M', 3, NULL, 140),
(621, 'ANABELA FRANCISCO VANDIK', '2012-01-05', 'F', 4, '13', 377);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cargo_pessoa`
--

DROP TABLE IF EXISTS `tbl_cargo_pessoa`;
CREATE TABLE IF NOT EXISTS `tbl_cargo_pessoa` (
  `id_cp` int NOT NULL AUTO_INCREMENT,
  `id_estrutura_organica` int DEFAULT NULL,
  `id_pessoa` int DEFAULT NULL COMMENT 'igual ao id da tbl_juridica',
  `id_usuario` int DEFAULT NULL,
  `data_registro` date DEFAULT NULL,
  PRIMARY KEY (`id_cp`) USING BTREE,
  KEY `indice_pessoa` (`id_pessoa`) USING BTREE,
  KEY `id_estrutura_organica` (`id_estrutura_organica`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_cargo_pessoa`
--

INSERT INTO `tbl_cargo_pessoa` (`id_cp`, `id_estrutura_organica`, `id_pessoa`, `id_usuario`, `data_registro`) VALUES
(10, 27, 229, 30, '2023-06-05'),
(11, 21, 46, 33, '2023-07-06'),
(18, 13, 45, 30, '2023-12-27'),
(19, 6, 159, 30, '2024-01-16'),
(21, 9, 387, 34, '2024-05-17'),
(24, 10, 241, 37, '2024-07-22'),
(25, 44, 25, 37, '2024-08-12'),
(27, 51, 162, 37, '2024-08-12'),
(33, 61, 67, 37, '2024-08-12'),
(34, 62, 60, 37, '2024-08-12'),
(35, 63, 376, 37, '2024-08-12'),
(36, 64, 533, 37, '2024-08-12'),
(37, 65, 42, 37, '2024-08-12'),
(38, 66, 61, 37, '2024-08-12'),
(44, 8, 146, 37, '2024-08-28'),
(45, 14, 79, 37, '2024-09-02'),
(48, 19, 6, 37, '2024-09-02'),
(49, 20, 114, 37, '2024-09-02'),
(50, 22, 53, 37, '2024-09-02'),
(51, 23, 302, 37, '2024-09-02'),
(52, 24, 273, 37, '2024-09-02'),
(53, 25, 167, 37, '2024-09-02'),
(54, 26, 9, 37, '2024-09-02'),
(55, 28, 13, 37, '2024-09-02'),
(56, 17, 275, 30, '2024-09-23'),
(57, 7, 20, 30, '2024-12-06'),
(70, 2, 557, 1, '2025-10-07'),
(71, 1, 132, 4, '2025-11-06'),
(72, 77, 141, 1, '2025-11-08'),
(82, 15, 365, 1, '2025-11-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_contactos`
--

DROP TABLE IF EXISTS `tbl_contactos`;
CREATE TABLE IF NOT EXISTS `tbl_contactos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPessoa` int DEFAULT NULL,
  `Contacto` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipo_contacto` int DEFAULT NULL,
  `NomeFamiliar_Emergencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TipoRelacao_NomeEmergencia` int DEFAULT NULL,
  `iduser` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idPessoa` (`idPessoa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=731 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_contactos`
--

INSERT INTO `tbl_contactos` (`id`, `idPessoa`, `Contacto`, `tipo_contacto`, `NomeFamiliar_Emergencia`, `TipoRelacao_NomeEmergencia`, `iduser`, `created`, `modify`) VALUES
(1, 6, '926326408', 1, NULL, NULL, NULL, NULL, NULL),
(3, 9, '923654586', 1, NULL, NULL, NULL, NULL, NULL),
(4, 10, '927740017', 1, NULL, NULL, NULL, NULL, NULL),
(5, 11, '937715030', 1, NULL, NULL, NULL, NULL, NULL),
(6, 13, '946458685', 1, NULL, NULL, NULL, NULL, NULL),
(9, 28, '927255515', 1, NULL, NULL, NULL, NULL, NULL),
(10, 39, '934580539', 1, NULL, NULL, NULL, NULL, NULL),
(13, 46, '923955403', 1, NULL, NULL, NULL, NULL, NULL),
(14, 47, '922887007', 1, NULL, NULL, NULL, NULL, NULL),
(15, 57, '912432380', 1, NULL, NULL, NULL, NULL, NULL),
(16, 60, '924454139', 1, NULL, NULL, NULL, NULL, NULL),
(17, 61, '921096663', 1, NULL, NULL, NULL, NULL, NULL),
(18, 63, '916791378', 1, NULL, NULL, NULL, NULL, NULL),
(19, 65, '931938024', 1, NULL, NULL, NULL, NULL, NULL),
(20, 67, '923219469', 1, NULL, NULL, NULL, NULL, NULL),
(21, 73, '923376985', 1, NULL, NULL, NULL, NULL, NULL),
(23, 79, '925765700', 1, NULL, NULL, NULL, NULL, NULL),
(24, 89, '924270699', 1, NULL, NULL, NULL, NULL, NULL),
(25, 90, '992063093', 1, NULL, NULL, NULL, NULL, NULL),
(26, 91, '923849811', 1, NULL, NULL, NULL, NULL, NULL),
(27, 92, '924786176', 1, NULL, NULL, NULL, NULL, NULL),
(28, 93, '922029003', 1, NULL, NULL, NULL, NULL, NULL),
(29, 99, '998004590', 1, NULL, NULL, NULL, NULL, NULL),
(30, 100, '991133544', 1, NULL, NULL, NULL, NULL, NULL),
(31, 105, '925486374', 1, NULL, NULL, NULL, NULL, NULL),
(32, 111, '921281155', 1, NULL, NULL, NULL, NULL, NULL),
(33, 117, '941855976', 1, NULL, NULL, NULL, NULL, NULL),
(34, 123, '923852902', 1, NULL, NULL, NULL, NULL, NULL),
(35, 131, '922497151', 1, NULL, NULL, NULL, NULL, NULL),
(37, 135, '994906163', 1, NULL, NULL, NULL, NULL, NULL),
(40, 141, '924846828', 1, NULL, NULL, NULL, NULL, NULL),
(41, 143, '923531588', 1, NULL, NULL, NULL, NULL, NULL),
(42, 146, '923530042', 1, NULL, NULL, NULL, NULL, NULL),
(43, 147, '924177945', 1, NULL, NULL, NULL, NULL, NULL),
(44, 149, '923000733', 1, NULL, NULL, NULL, NULL, NULL),
(45, 150, '923590530', 1, NULL, NULL, NULL, NULL, NULL),
(46, 153, '923220116', 1, NULL, NULL, NULL, NULL, NULL),
(47, 154, '923249630', 1, NULL, NULL, NULL, NULL, NULL),
(48, 157, '928372496', 1, NULL, NULL, NULL, NULL, NULL),
(49, 159, '923883528', 1, NULL, NULL, NULL, NULL, NULL),
(50, 160, '923873474', 1, NULL, NULL, NULL, NULL, NULL),
(51, 162, '924578905', 1, NULL, NULL, NULL, NULL, NULL),
(52, 163, '923570657', 1, NULL, NULL, NULL, NULL, NULL),
(53, 165, '923634407', 1, NULL, NULL, NULL, NULL, NULL),
(54, 167, '936882510', 1, NULL, NULL, NULL, NULL, NULL),
(55, 168, '928557282', 1, NULL, NULL, NULL, NULL, NULL),
(56, 170, '923584378', 1, NULL, NULL, NULL, NULL, NULL),
(57, 172, '925444883', 1, NULL, NULL, NULL, NULL, NULL),
(58, 173, '924597569', 1, NULL, NULL, NULL, NULL, NULL),
(59, 175, '923739884', 1, NULL, NULL, NULL, NULL, NULL),
(60, 177, '923543134', 1, NULL, NULL, NULL, NULL, NULL),
(61, 178, '923376750', 1, NULL, NULL, NULL, NULL, NULL),
(62, 182, '917346717', 1, NULL, NULL, NULL, NULL, NULL),
(63, 193, '923456939', 1, NULL, NULL, NULL, NULL, NULL),
(64, 199, '924628759', 1, NULL, NULL, NULL, NULL, NULL),
(65, 201, '945248897', 1, NULL, NULL, NULL, NULL, NULL),
(66, 202, '924893474', 1, NULL, NULL, NULL, NULL, NULL),
(67, 203, '924569127', 1, NULL, NULL, NULL, NULL, NULL),
(68, 204, '938935392', 1, NULL, NULL, NULL, NULL, NULL),
(69, 208, '924196578', 1, NULL, NULL, NULL, NULL, NULL),
(70, 222, '924067494', 1, NULL, NULL, NULL, NULL, NULL),
(71, 223, '924361059', 1, NULL, NULL, NULL, NULL, NULL),
(73, 230, '923704212', 1, NULL, NULL, NULL, NULL, NULL),
(74, 235, '922699986', 1, NULL, NULL, NULL, NULL, NULL),
(75, 237, '926146371', 1, NULL, NULL, NULL, NULL, NULL),
(76, 241, '923516543', 1, NULL, NULL, NULL, NULL, NULL),
(77, 242, '923767008', 1, NULL, NULL, NULL, NULL, NULL),
(78, 250, '923638889', 1, NULL, NULL, NULL, NULL, NULL),
(79, 268, '925104422', 1, NULL, NULL, NULL, NULL, NULL),
(80, 271, '928019571', 1, NULL, NULL, NULL, NULL, NULL),
(81, 273, '926623549', 1, NULL, NULL, NULL, NULL, NULL),
(82, 282, '923478687', 1, NULL, NULL, NULL, NULL, NULL),
(83, 283, '932698846', 1, NULL, NULL, NULL, NULL, NULL),
(84, 284, '929422144', 1, NULL, NULL, NULL, NULL, NULL),
(85, 289, '946153549', 1, NULL, NULL, NULL, NULL, NULL),
(86, 291, '937467994', 1, NULL, NULL, NULL, NULL, NULL),
(87, 304, '941005714', 1, NULL, NULL, NULL, NULL, NULL),
(88, 305, '928494520', 1, NULL, NULL, NULL, NULL, NULL),
(89, 306, '939975898', 1, NULL, NULL, NULL, NULL, NULL),
(90, 310, '945574437', 1, NULL, NULL, NULL, NULL, NULL),
(91, 316, '947327529', 1, NULL, NULL, NULL, NULL, NULL),
(92, 327, '928183041', 1, NULL, NULL, NULL, NULL, NULL),
(93, 331, '942453339', 1, NULL, NULL, NULL, NULL, NULL),
(94, 333, '925095829', 1, NULL, NULL, NULL, NULL, NULL),
(95, 335, '941528183', 1, NULL, NULL, NULL, NULL, NULL),
(96, 336, '923217186', 1, NULL, NULL, NULL, NULL, NULL),
(97, 352, '941789116', 1, NULL, NULL, NULL, NULL, NULL),
(98, 359, '932480767', 1, NULL, NULL, NULL, NULL, NULL),
(99, 364, '935157356', 1, NULL, NULL, NULL, NULL, NULL),
(101, 366, '939728427', 1, NULL, NULL, NULL, NULL, NULL),
(102, 367, '923481007', 1, NULL, NULL, NULL, NULL, NULL),
(103, 369, '923921450', 1, NULL, NULL, NULL, NULL, NULL),
(104, 376, '944595513', 1, NULL, NULL, NULL, NULL, NULL),
(106, 378, '923711051', 1, NULL, NULL, NULL, NULL, NULL),
(107, 379, '944434308', 1, NULL, NULL, NULL, NULL, NULL),
(108, 380, '923836423', 1, NULL, NULL, NULL, NULL, NULL),
(109, 385, '939201522', 1, NULL, NULL, NULL, NULL, NULL),
(110, 388, '947684696', 1, NULL, NULL, NULL, NULL, NULL),
(111, 389, '940861361', 1, NULL, NULL, NULL, NULL, NULL),
(112, 392, '942720222', 1, NULL, NULL, NULL, NULL, NULL),
(113, 393, '931564010', 1, NULL, NULL, NULL, NULL, NULL),
(114, 395, '923608964', 1, NULL, NULL, NULL, NULL, NULL),
(115, 396, '944755335', 1, NULL, NULL, NULL, NULL, NULL),
(116, 397, '935703318', 1, NULL, NULL, NULL, NULL, NULL),
(118, 400, '938755475', 1, NULL, NULL, NULL, NULL, NULL),
(119, 6, '915052333', 2, NULL, NULL, NULL, NULL, NULL),
(121, 8, '995869306', 2, NULL, NULL, NULL, NULL, NULL),
(123, 21, '993968676', 2, NULL, NULL, NULL, NULL, NULL),
(125, 28, '913010431', 2, NULL, NULL, NULL, NULL, NULL),
(126, 39, '918092522', 2, NULL, NULL, NULL, NULL, NULL),
(128, 46, '912735969', 2, NULL, NULL, NULL, NULL, NULL),
(131, 67, '919556692', 2, NULL, NULL, NULL, NULL, NULL),
(132, 73, '912721733', 2, NULL, NULL, NULL, NULL, NULL),
(134, 79, '912457344', 2, NULL, NULL, NULL, NULL, NULL),
(135, 89, '911796426', 2, NULL, NULL, NULL, NULL, NULL),
(137, 91, '993849811', 2, NULL, NULL, NULL, NULL, NULL),
(138, 92, '915342139', 2, NULL, NULL, NULL, NULL, NULL),
(141, 105, '915577343', 2, NULL, NULL, NULL, NULL, NULL),
(142, 111, '940578299', 2, NULL, NULL, NULL, NULL, NULL),
(143, 123, '917210649', 2, NULL, NULL, NULL, NULL, NULL),
(144, 131, '914240376', 2, NULL, NULL, NULL, NULL, NULL),
(148, 141, '912208572', 2, NULL, NULL, NULL, NULL, NULL),
(149, 143, '917605334', 2, NULL, NULL, NULL, NULL, NULL),
(150, 146, '912606832', 2, NULL, NULL, NULL, NULL, NULL),
(151, 147, '913846877', 2, NULL, NULL, NULL, NULL, NULL),
(152, 150, '991590530', 2, NULL, NULL, NULL, NULL, NULL),
(153, 153, '951198304', 2, NULL, NULL, NULL, NULL, NULL),
(154, 157, '951166335', 2, NULL, NULL, NULL, NULL, NULL),
(155, 159, '912243200', 2, NULL, NULL, NULL, NULL, NULL),
(156, 163, '993570657', 2, NULL, NULL, NULL, NULL, NULL),
(157, 165, '992299313', 2, NULL, NULL, NULL, NULL, NULL),
(158, 167, '912850681', 2, NULL, NULL, NULL, NULL, NULL),
(159, 168, '912249390', 2, NULL, NULL, NULL, NULL, NULL),
(160, 170, '993584378', 2, NULL, NULL, NULL, NULL, NULL),
(161, 172, '991444883', 2, NULL, NULL, NULL, NULL, NULL),
(162, 177, '912538375', 2, NULL, NULL, NULL, NULL, NULL),
(164, 193, '998456939', 2, NULL, NULL, NULL, NULL, NULL),
(165, 201, '928686200', 2, NULL, NULL, NULL, NULL, NULL),
(166, 202, '917662231', 2, NULL, NULL, NULL, NULL, NULL),
(167, 204, '918685068', 2, NULL, NULL, NULL, NULL, NULL),
(168, 207, '998917314', 2, NULL, NULL, NULL, NULL, NULL),
(169, 208, '916248969', 2, NULL, NULL, NULL, NULL, NULL),
(170, 223, '993229139', 2, NULL, NULL, NULL, NULL, NULL),
(172, 230, '952496047', 2, NULL, NULL, NULL, NULL, NULL),
(173, 237, '912929602', 2, NULL, NULL, NULL, NULL, NULL),
(174, 241, '951069271', 2, NULL, NULL, NULL, NULL, NULL),
(175, 242, '998202232', 2, NULL, NULL, NULL, NULL, NULL),
(176, 268, '996750312', 2, NULL, NULL, NULL, NULL, NULL),
(177, 271, '998019571', 2, NULL, NULL, NULL, NULL, NULL),
(178, 273, '924217518', 2, NULL, NULL, NULL, NULL, NULL),
(179, 282, '990478687', 2, NULL, NULL, NULL, NULL, NULL),
(180, 283, '994608901', 2, NULL, NULL, NULL, NULL, NULL),
(181, 289, '995152966', 2, NULL, NULL, NULL, NULL, NULL),
(182, 305, '937708940', 2, NULL, NULL, NULL, NULL, NULL),
(183, 310, '995762513', 2, NULL, NULL, NULL, NULL, NULL),
(184, 327, '925433539', 2, NULL, NULL, NULL, NULL, NULL),
(185, 333, '914685606', 2, NULL, NULL, NULL, NULL, NULL),
(186, 335, '992163322', 2, NULL, NULL, NULL, NULL, NULL),
(187, 336, '996318766', 2, NULL, NULL, NULL, NULL, NULL),
(188, 352, '944613204', 2, NULL, NULL, NULL, NULL, NULL),
(189, 364, '992779048', 2, NULL, NULL, NULL, NULL, NULL),
(191, 367, '995481007', 2, NULL, NULL, NULL, NULL, NULL),
(192, 369, '930541463', 2, NULL, NULL, NULL, NULL, NULL),
(194, 378, '990254240', 2, NULL, NULL, NULL, NULL, NULL),
(195, 380, '993836423', 2, NULL, NULL, NULL, NULL, NULL),
(196, 388, '923951154', 2, NULL, NULL, NULL, NULL, NULL),
(197, 392, '912672895', 2, NULL, NULL, NULL, NULL, NULL),
(198, 393, '993564010', 2, NULL, NULL, NULL, NULL, NULL),
(199, 395, '999608964', 2, NULL, NULL, NULL, NULL, NULL),
(200, 396, '995180177', 2, NULL, NULL, NULL, NULL, NULL),
(201, 397, '997905781', 2, NULL, NULL, NULL, NULL, NULL),
(203, 400, '991374971', 2, NULL, NULL, NULL, NULL, NULL),
(204, 9, '943410725', 3, NULL, NULL, NULL, NULL, NULL),
(208, 67, '926076839', 3, NULL, NULL, NULL, NULL, NULL),
(209, 73, '998774462', 3, NULL, NULL, NULL, NULL, NULL),
(211, 99, '936102869', 3, NULL, NULL, NULL, NULL, NULL),
(212, 105, '993851577', 3, NULL, NULL, NULL, NULL, NULL),
(214, 147, '932900202', 3, NULL, NULL, NULL, NULL, NULL),
(215, 165, '933619830', 3, NULL, NULL, NULL, NULL, NULL),
(217, 172, '937393758', 3, NULL, NULL, NULL, NULL, NULL),
(218, 173, '923820916', 3, NULL, NULL, NULL, NULL, NULL),
(219, 182, '936514470', 3, NULL, NULL, NULL, NULL, NULL),
(220, 193, '945509875', 3, NULL, NULL, NULL, NULL, NULL),
(222, 202, '945901267', 3, NULL, NULL, NULL, NULL, NULL),
(223, 223, '936471830', 3, NULL, NULL, NULL, NULL, NULL),
(224, 230, '933034174', 3, NULL, NULL, NULL, NULL, NULL),
(225, 237, '924927179', 3, NULL, NULL, NULL, NULL, NULL),
(227, 291, '949498529', 3, NULL, NULL, NULL, NULL, NULL),
(229, 310, '922487013', 3, NULL, NULL, NULL, NULL, NULL),
(230, 327, '940212511', 3, NULL, NULL, NULL, NULL, NULL),
(231, 333, '926508172', 3, NULL, NULL, NULL, NULL, NULL),
(232, 352, '931796539', 3, NULL, NULL, NULL, NULL, NULL),
(234, 379, '935832377', 3, NULL, NULL, NULL, NULL, NULL),
(235, 392, '913544403', 3, NULL, NULL, NULL, NULL, NULL),
(236, 395, '929679399', 3, NULL, NULL, NULL, NULL, NULL),
(237, 8, '913900007', 4, 'JOAQUIM GONÇALVES', NULL, NULL, NULL, NULL),
(238, 9, '927206446', 4, 'JANETE JOSÉ', NULL, NULL, NULL, NULL),
(239, 10, '933150978', 4, NULL, NULL, NULL, NULL, NULL),
(241, 21, '935448153', 4, 'INÊS FUTI', NULL, NULL, NULL, NULL),
(243, 28, '992877742', 4, NULL, NULL, NULL, NULL, NULL),
(244, 39, '918092388', 4, 'AFONSO TECA PAXI', NULL, NULL, NULL, NULL),
(245, 57, '914116495', 4, NULL, NULL, NULL, NULL, NULL),
(246, 67, '923660915', 4, 'NELSON LOPES MANUEL', 6, NULL, NULL, NULL),
(247, 73, '924428137', 4, 'ISABEL JOÃO DOMINGOS', 3, NULL, NULL, NULL),
(249, 89, '940588939-915612162', 4, 'CECILIA SUCA BONIFÁCIO', NULL, NULL, NULL, NULL),
(250, 91, '937300089', 4, NULL, NULL, NULL, NULL, NULL),
(251, 92, '941450029', 4, 'MARILDA DE FATIMA CHICO LUIS WALACA', NULL, NULL, NULL, NULL),
(252, 99, '924238281', 4, NULL, NULL, NULL, NULL, NULL),
(253, 105, '942881986, 945355129', 4, 'JOSE TUNGO MUACATENDE', NULL, NULL, NULL, NULL),
(254, 111, '927428048, 928318112', 4, NULL, NULL, NULL, NULL, NULL),
(255, 135, '924068295', 4, NULL, NULL, NULL, NULL, NULL),
(256, 147, '913331930', 4, 'FLORINDA MUZALA MUTETE SAMUNHAO', NULL, NULL, NULL, NULL),
(257, 157, '925163563', 4, 'José Pedro', NULL, NULL, NULL, NULL),
(258, 165, '939677252', 4, 'IRIANA DIOGO TAMBO', NULL, NULL, NULL, NULL),
(259, 167, '934644535', 4, 'MARTA ALICE NGONGO GASPAR', NULL, NULL, NULL, NULL),
(260, 172, '937482550', 4, 'LINDO BARTOLOMEU N`TYAMBA', NULL, NULL, NULL, NULL),
(261, 173, '923820916/923225595/', 4, 'FÁTIMA FERNANDES DOS SANTOS, MANUEL LOPES', NULL, NULL, NULL, NULL),
(262, 182, '993900044', 4, NULL, NULL, NULL, NULL, NULL),
(263, 193, '919294626', 4, 'LUIS FERNANDO ANTONIO', NULL, NULL, NULL, NULL),
(264, 202, '929512306', 4, NULL, NULL, NULL, NULL, NULL),
(266, 223, '923341740', 4, 'FRANCISCO MANUEL', 6, NULL, NULL, NULL),
(268, 241, '947826687', 4, 'FELICIANA ALEXANDRE DALA', 3, NULL, NULL, NULL),
(269, 242, '924111839', 4, NULL, 6, NULL, NULL, NULL),
(270, 268, '924105321', 4, NULL, NULL, NULL, NULL, NULL),
(271, 271, '943316600', 4, 'REGINA CHIBINDA', NULL, NULL, NULL, NULL),
(272, 282, '944303763', 4, 'JESUS DE NAZARE KAMUANGO & PIA LINDA KAMUANGO', NULL, NULL, NULL, NULL),
(273, 283, '929625541, 998625541', 4, 'AUGUSTO CASTELO & MADALENA SEBASTIAO', NULL, NULL, NULL, NULL),
(274, 289, '924551014', 4, NULL, NULL, NULL, NULL, NULL),
(275, 291, '923407414', 4, 'VIVI RODRIGUES', 5, NULL, NULL, NULL),
(276, 304, '923220424', 4, NULL, NULL, NULL, NULL, NULL),
(277, 306, '924221708', 4, NULL, NULL, NULL, NULL, NULL),
(278, 310, '936500018', 4, 'MARIA MADALENA LELO REIS', NULL, NULL, NULL, NULL),
(279, 316, '947327987', 4, 'ELISA CHITULA SALUSSINGA VIEGAS', 3, NULL, NULL, NULL),
(280, 327, '931050303', 4, 'Paula Catosse', 2, NULL, NULL, NULL),
(281, 331, '929822014', 4, NULL, NULL, NULL, NULL, NULL),
(282, 333, '926508172-997657689', 4, 'MARIA ADELINA CATUMBELA TAHANGA', 3, NULL, NULL, NULL),
(283, 335, '947555864', 4, NULL, NULL, NULL, NULL, NULL),
(284, 336, '922680204', 4, 'TERESA DE FATIMA', NULL, NULL, NULL, NULL),
(285, 352, '931657939', 4, 'Pai Tchissola Mucanda Samuel', NULL, NULL, NULL, NULL),
(287, 364, '924078161', 4, 'VICTORIA DA NATIVIDADE BRITO', 2, NULL, NULL, NULL),
(289, 376, '923322525', 4, 'FERNANDO MOTA INOCKE', 5, NULL, NULL, NULL),
(291, 378, '936425210', 4, 'DOMINGOS PEDRO CORREIA', 1, NULL, NULL, NULL),
(292, 379, '923333289', 4, 'WALTER FRANCISCO GONGA', NULL, NULL, NULL, NULL),
(293, 380, '916299016', 4, 'NICETE CANDIDO VASCO FERREIRA', NULL, NULL, NULL, NULL),
(294, 385, '925732040', 4, 'ANTÓNIO DE SOUSA', 1, NULL, NULL, NULL),
(295, 388, '923977787', 4, 'Alfonsina Samuel', NULL, NULL, NULL, NULL),
(296, 389, '923229307', 4, 'DJANDIRA MOTA DE ANDRADE', 2, NULL, NULL, NULL),
(297, 392, '923347529-923966162', 4, 'CARLOS MANUEL ALVARENGA', 1, NULL, NULL, NULL),
(298, 393, '929168100', 4, 'ZEFERINA KESSONGO', NULL, NULL, NULL, NULL),
(299, 395, '928561621', 4, 'Nunes José', NULL, NULL, NULL, NULL),
(300, 396, '934114252', 4, 'NELSON DE JESUS JOSE MANUEL', NULL, NULL, NULL, NULL),
(301, 397, '924411245-997411245', 4, 'ENGRÁCIA PEDRO EDUARDO', 2, NULL, NULL, NULL),
(302, 398, '947244049', 4, 'WALTER AMBRÓSIO MBASSI', 6, NULL, NULL, NULL),
(304, 400, '923353434', 4, 'JORGE FRANCISCO', 1, NULL, NULL, NULL),
(305, 9, 'rmcabinda@hotmail.co', 6, NULL, NULL, NULL, NULL, NULL),
(306, 13, 'dijonas2013@hotmail.', 6, NULL, NULL, NULL, NULL, NULL),
(309, 28, 'doprendajoao77@gmail', 6, NULL, NULL, NULL, NULL, NULL),
(311, 67, 'jomino32@gmail.com#m', 6, NULL, NULL, NULL, NULL, NULL),
(312, 73, 'alfredo.pio@gmail.co', 6, NULL, NULL, NULL, NULL, NULL),
(314, 92, 'cesarwalaca@hotmail.', 6, NULL, NULL, NULL, NULL, NULL),
(315, 123, 'narcisomaria@gmail.c', 6, NULL, NULL, NULL, NULL, NULL),
(316, 135, 'jtntyamba@gmail.com#', 6, NULL, NULL, NULL, NULL, NULL),
(317, 141, 'chissola@yahoo.com#m', 6, NULL, NULL, NULL, NULL, NULL),
(318, 147, 'moisescalufueloconce', 6, NULL, NULL, NULL, NULL, NULL),
(319, 163, 'tchicanala78@gmail.c', 6, NULL, NULL, NULL, NULL, NULL),
(320, 165, 'manueltambo2019@Gmai', 6, NULL, NULL, NULL, NULL, NULL),
(321, 167, 'paulinogaspar@hotmail.com', 6, NULL, NULL, NULL, NULL, NULL),
(322, 168, 'higinoisata@gmail.co', 6, NULL, NULL, NULL, NULL, NULL),
(323, 177, 'echinga20@gmail.com#', 6, NULL, NULL, NULL, NULL, NULL),
(324, 203, 'antoniohamuela@.', 6, NULL, NULL, NULL, NULL, NULL),
(325, 208, 'araujo.claudio868.ao', 6, NULL, NULL, NULL, NULL, NULL),
(326, 223, 'ismaribeiro90@gmail.com', 6, NULL, NULL, NULL, NULL, NULL),
(328, 230, 'yara. rita@hotmail.c', 6, NULL, NULL, NULL, NULL, NULL),
(329, 241, 'tilso923@gmail.com#m', 6, NULL, NULL, NULL, NULL, NULL),
(330, 242, 'sebanias24@gmail.com', 6, NULL, NULL, NULL, NULL, NULL),
(331, 268, 'flaviovambi@hotmail.', 6, NULL, NULL, NULL, NULL, NULL),
(332, 271, 'soconde54@gmail.com#', 6, NULL, NULL, NULL, NULL, NULL),
(333, 282, 'kamwango1994@gmail.c', 6, NULL, NULL, NULL, NULL, NULL),
(334, 283, 'agnellycastelo8@gmai', 6, NULL, NULL, NULL, NULL, NULL),
(335, 289, 'mariopaulino@gmail.c', 6, NULL, NULL, NULL, NULL, NULL),
(336, 291, 'aguinaldomanuel.@gam', 6, NULL, NULL, NULL, NULL, NULL),
(337, 310, 'angelinoreis1993@gma', 6, NULL, NULL, NULL, NULL, NULL),
(338, 316, 'mariowise@hotmail.co', 6, NULL, NULL, NULL, NULL, NULL),
(339, 336, 'davidlotes23@outlook', 6, NULL, NULL, NULL, NULL, NULL),
(340, 352, 'vladmirosamuel@gmail', 6, NULL, NULL, NULL, NULL, NULL),
(341, 364, 'esmiriwilsond@gmail.', 6, NULL, NULL, NULL, NULL, NULL),
(343, 369, 'angomajmiguel@gmail.', 6, NULL, NULL, NULL, NULL, NULL),
(344, 376, 'oscar.osorio@hotmail', 6, NULL, NULL, NULL, NULL, NULL),
(346, 378, 'denilsoncorreia1994@', 6, NULL, NULL, NULL, NULL, NULL),
(347, 380, 'drclov@hotmail.com#m', 6, NULL, NULL, NULL, NULL, NULL),
(348, 385, 'pedrofaustinodesousa', 6, NULL, NULL, NULL, NULL, NULL),
(349, 392, 'kelsonkp24@gmail.com', 6, NULL, NULL, NULL, NULL, NULL),
(350, 393, 'jmkcomerciallda@gmai', 6, NULL, NULL, NULL, NULL, NULL),
(351, 395, 'migueljosecabange6@g', 6, NULL, NULL, NULL, NULL, NULL),
(352, 397, 'luanaedu10@gmail.com', 6, NULL, NULL, NULL, NULL, NULL),
(353, 398, 'josualdombassi@gmail', 6, NULL, NULL, NULL, NULL, NULL),
(355, 400, 'joalbifran1@hotmail.', 6, NULL, NULL, NULL, NULL, NULL),
(356, 316, '938368372', 5, NULL, NULL, 0, NULL, NULL),
(357, 8, '992932687', 5, NULL, NULL, 0, NULL, NULL),
(358, 282, '994244473', 5, NULL, NULL, 0, NULL, NULL),
(359, 39, '927687715', 5, NULL, NULL, 0, NULL, NULL),
(383, 474, '93355502', 1, NULL, NULL, NULL, '2024-05-28 12:06:58', NULL),
(384, 474, 'helton25@gmail.com', 6, NULL, NULL, NULL, '2024-05-28 12:06:58', NULL),
(385, 475, '93355502', 1, NULL, NULL, NULL, '2024-05-28 12:09:40', NULL),
(386, 475, 'helton25@gmail.com', 6, NULL, NULL, NULL, '2024-05-28 12:09:40', NULL),
(388, 27, '923833971', 1, NULL, NULL, NULL, '2024-07-15 12:38:45', NULL),
(391, 114, '924601117', 1, NULL, NULL, NULL, '2024-07-17 15:26:27', NULL),
(392, 478, '950896573', 1, NULL, NULL, NULL, '2024-07-19 15:15:38', NULL),
(393, 478, 'luisandradeleitão@gmail.com', 6, NULL, NULL, NULL, '2024-07-19 15:15:38', NULL),
(398, 484, '926547598', 1, NULL, NULL, NULL, '2024-07-24 12:56:28', NULL),
(399, 484, 'Somavie1@gmail.co', 6, NULL, NULL, NULL, '2024-07-24 12:56:28', NULL),
(400, 115, '928425828/955667505', 1, NULL, NULL, NULL, '2024-07-29 11:21:15', NULL),
(401, 486, '923555092/943036573', 1, NULL, NULL, NULL, '2024-07-29 14:43:17', NULL),
(402, 486, 'Leonelpires@mail.com', 6, NULL, NULL, NULL, '2024-07-29 14:43:17', NULL),
(403, 492, '922889675', 1, NULL, NULL, NULL, '2024-07-29 15:28:35', NULL),
(404, 492, 'cristianofernandes555@gmail.com', 6, NULL, NULL, NULL, '2024-07-29 15:28:36', NULL),
(405, 298, '923464153/922821108', 1, NULL, NULL, NULL, '2024-07-30 09:50:31', NULL),
(406, 298, 'painonamonserna@gmail.com', 6, NULL, NULL, NULL, '2024-07-30 09:58:01', NULL),
(407, 499, '912311293', 1, NULL, NULL, NULL, '2024-07-30 10:26:27', NULL),
(408, 499, 'chivuvuloarmando@gmail.com', 6, NULL, NULL, NULL, '2024-07-30 10:26:27', NULL),
(410, 501, '924327628/941050147', 1, NULL, NULL, NULL, '2024-07-30 10:43:20', NULL),
(411, 501, 'josembonge02@gmail.com', 6, NULL, NULL, NULL, '2024-07-30 10:43:20', NULL),
(412, 31, '92046445', 1, NULL, NULL, NULL, '2024-08-01 11:03:11', NULL),
(421, 24, '946354322', 1, NULL, NULL, NULL, '2024-08-01 11:39:07', NULL),
(422, 510, '935983177', 1, NULL, NULL, NULL, '2024-08-01 12:16:20', NULL),
(423, 510, 'exemplo@email.com', 6, NULL, NULL, NULL, '2024-08-01 12:16:20', NULL),
(424, 511, '936383306', 1, NULL, NULL, NULL, '2024-08-01 12:26:43', NULL),
(425, 511, 'garciansiansoki@gmail.com', 6, NULL, NULL, NULL, '2024-08-01 12:26:43', NULL),
(426, 512, '923000919/998270109', 1, NULL, NULL, NULL, '2024-08-01 12:37:43', NULL),
(427, 512, 'joãofrancisco21@gmail.com', 6, NULL, NULL, NULL, '2024-08-01 12:37:43', NULL),
(428, 294, '931853492', 1, NULL, NULL, NULL, '2024-08-01 13:53:43', NULL),
(430, 264, '925630687', 6, NULL, NULL, NULL, '2024-08-05 12:44:47', NULL),
(431, 264, '918001595', 1, NULL, NULL, NULL, '2024-08-05 12:45:19', NULL),
(432, 516, '942332294', 1, NULL, NULL, NULL, '2024-08-07 10:50:02', NULL),
(433, 516, 'osvaldoyork196@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 10:50:02', NULL),
(440, 523, '927256090', 1, NULL, NULL, NULL, '2024-08-07 11:22:57', NULL),
(441, 523, 'segundacatutochala@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 11:22:57', NULL),
(442, 524, '9306787747', 1, NULL, NULL, NULL, '2024-08-07 11:34:15', NULL),
(443, 524, 'americodaconceição costa@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 11:34:16', NULL),
(444, 525, '923696612', 1, NULL, NULL, NULL, '2024-08-07 13:59:56', NULL),
(445, 525, 'domingosjoão@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 13:59:56', NULL),
(447, 527, '923932116', 1, NULL, NULL, NULL, '2024-08-07 14:29:40', NULL),
(448, 527, 'jaimengola@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 14:29:40', NULL),
(451, 531, '930078097', 1, NULL, NULL, NULL, '2024-08-07 15:31:59', NULL),
(452, 531, 'domingoschicuta@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 15:31:59', NULL),
(453, 532, '937047439/927947876', 1, NULL, NULL, NULL, '2024-08-07 15:49:24', NULL),
(454, 532, 'raiovinda@gmail.com', 6, NULL, NULL, NULL, '2024-08-07 15:49:24', NULL),
(457, 533, '936374321', 1, NULL, NULL, NULL, '2024-08-09 11:49:47', NULL),
(458, 382, '942543925', 1, NULL, NULL, NULL, '2024-08-13 09:38:59', NULL),
(459, 15, '937630430', 1, NULL, NULL, NULL, '2024-08-13 10:02:24', NULL),
(460, 534, '921334023', 1, NULL, NULL, NULL, '2024-08-14 09:20:46', NULL),
(461, 535, '923565037/923008887', 1, NULL, NULL, NULL, '2024-08-14 12:02:42', NULL),
(462, 536, '921954450', 1, NULL, NULL, NULL, '2024-08-14 13:25:55', NULL),
(477, 229, '939563144', 1, NULL, NULL, NULL, '2025-07-10 11:12:18', NULL),
(478, 229, '915161036', 2, NULL, NULL, NULL, '2025-07-10 11:12:18', NULL),
(479, 229, 'wilkerhtml@gmail.com', 6, NULL, NULL, NULL, '2025-07-10 11:12:18', NULL),
(507, 20, '923711181', 1, NULL, NULL, NULL, '2025-09-24 16:11:23', NULL),
(508, 20, '990711181', 2, NULL, NULL, NULL, '2025-09-24 16:11:23', NULL),
(509, 20, '925541104', 3, NULL, NULL, NULL, '2025-09-24 16:11:23', NULL),
(510, 20, '933978144 ou 9127265', 4, NULL, NULL, NULL, '2025-09-24 16:11:23', NULL),
(511, 20, 'raimunojiko@gmail.com', 6, NULL, NULL, NULL, '2025-09-24 16:11:23', NULL),
(564, 75, '925114104', 1, NULL, NULL, NULL, '2025-10-04 16:38:33', NULL),
(565, 75, '913322829', 2, NULL, NULL, NULL, '2025-10-04 16:38:33', NULL),
(566, 75, '947999599', 3, NULL, NULL, NULL, '2025-10-04 16:38:33', NULL),
(567, 75, '923613827', 4, NULL, NULL, NULL, '2025-10-04 16:38:33', NULL),
(568, 75, 'andrepanzocacumba@gmail.com', 6, NULL, NULL, NULL, '2025-10-04 16:38:33', NULL),
(569, 387, '924197045', 1, NULL, NULL, NULL, '2025-10-06 12:30:11', NULL),
(570, 387, '994161316', 2, NULL, NULL, NULL, '2025-10-06 12:30:11', NULL),
(600, 557, '941909926', 1, NULL, NULL, NULL, '2025-10-07 12:54:55', NULL),
(615, 556, '943353756', 1, NULL, NULL, NULL, '2025-10-08 09:06:15', NULL),
(619, 483, '947702465', 1, NULL, NULL, NULL, '2025-10-08 09:27:33', NULL),
(620, 483, 'helisioj@gmail.com', 6, NULL, NULL, NULL, '2025-10-08 09:27:33', NULL),
(641, 399, '939784268', 1, NULL, NULL, NULL, '2025-10-09 11:39:02', NULL),
(642, 399, '939041033', 4, NULL, NULL, NULL, '2025-10-09 11:39:02', NULL),
(643, 399, 'sebastiaolisboa6@gmail.com', 6, NULL, NULL, NULL, '2025-10-09 11:39:02', NULL),
(644, 399, '925480947', 4, NULL, NULL, NULL, '2025-10-09 11:39:02', NULL),
(654, 365, '939902585', 4, NULL, NULL, NULL, '2025-10-13 08:58:32', NULL),
(655, 365, '936561047', 1, NULL, NULL, NULL, '2025-10-13 08:58:32', NULL),
(656, 365, '939329633', 4, NULL, NULL, NULL, '2025-10-13 08:58:32', NULL),
(659, 132, '925673875', 1, NULL, NULL, NULL, '2025-11-05 11:52:24', NULL),
(680, 25, '923223052', 1, NULL, NULL, NULL, '2025-11-07 07:56:01', NULL),
(681, 25, '914341492', 2, NULL, NULL, NULL, '2025-11-07 07:56:01', NULL),
(682, 25, '994681810', 3, NULL, NULL, NULL, '2025-11-07 07:56:01', NULL),
(683, 25, '925542639', 4, NULL, NULL, NULL, '2025-11-07 07:56:01', NULL),
(684, 25, 'garciamiguelantonio1', 6, NULL, NULL, NULL, '2025-11-07 07:56:01', NULL),
(688, 45, '922259825', 1, NULL, NULL, NULL, '2025-11-07 09:54:24', NULL),
(689, 45, '912351372', 2, NULL, NULL, NULL, '2025-11-07 09:54:24', NULL),
(690, 45, 'scavimbi1978@gmail.com', 6, NULL, NULL, NULL, '2025-11-07 09:54:24', NULL),
(691, 45, '951610112', 2, NULL, NULL, NULL, '2025-11-07 09:54:24', NULL),
(692, 45, '947804641', 5, NULL, NULL, NULL, '2025-11-07 09:54:24', NULL),
(717, 7, '945064094', 1, NULL, NULL, NULL, '2025-11-09 17:53:09', NULL),
(718, 7, '990064094', 2, NULL, NULL, NULL, '2025-11-09 17:53:09', NULL),
(721, 140, '944765292', 1, NULL, NULL, NULL, '2025-11-09 18:55:00', NULL),
(722, 140, '992153400', 2, NULL, NULL, NULL, '2025-11-09 18:55:00', NULL),
(727, 377, '994228498', 2, NULL, NULL, NULL, '2025-11-09 18:58:51', NULL),
(728, 377, '923604430', 4, NULL, NULL, NULL, '2025-11-09 18:58:51', NULL),
(729, 377, 'kamikazivandik94@gmail.com', 6, NULL, NULL, NULL, '2025-11-09 18:58:51', NULL),
(730, 377, '923431090', 4, NULL, NULL, NULL, '2025-11-09 18:58:51', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependencias`
--

DROP TABLE IF EXISTS `tbl_dependencias`;
CREATE TABLE IF NOT EXISTS `tbl_dependencias` (
  `id_dependencia` int NOT NULL AUTO_INCREMENT,
  `id_unidade_pai` smallint NOT NULL COMMENT 'Igual ao id da tabela ueo',
  `id_sub_unidade_mae` int NOT NULL COMMENT 'igual a id da tabela estrutura_sub-unidade',
  `id_sub_sub_filho` int NOT NULL COMMENT 'igual a id da tabela estrutura_sub-unidade',
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_dependencia`) USING BTREE,
  UNIQUE KEY `inidice_misto_sub` (`id_unidade_pai`,`id_sub_unidade_mae`,`id_sub_sub_filho`) USING BTREE,
  KEY `id_sub_sub_filho` (`id_sub_sub_filho`) USING BTREE,
  KEY `id_sub-unidade_mae` (`id_sub_unidade_mae`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_dependencias`
--

INSERT INTO `tbl_dependencias` (`id_dependencia`, `id_unidade_pai`, `id_sub_unidade_mae`, `id_sub_sub_filho`, `id_usuario`) VALUES
(1, 60, 2, 27, 30),
(2, 60, 3, 27, 30),
(5, 60, 4, 27, 30),
(6, 60, 5, 27, 30),
(7, 60, 6, 27, 30),
(8, 60, 7, 27, 30),
(35, 330, 32, 27, 37),
(37, 220, 25, 12, 44),
(39, 3043, 4, 27, 1),
(40, 3049, 24, 27, 1),
(41, 3044, 24, 27, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_entidade`
--

DROP TABLE IF EXISTS `tbl_entidade`;
CREATE TABLE IF NOT EXISTS `tbl_entidade` (
  `id_entidade` int NOT NULL,
  `Entidade` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Entidade_Abrev` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Id_Entidade_Actual` int DEFAULT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_entidade`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_entidade`
--

INSERT INTO `tbl_entidade` (`id_entidade`, `Entidade`, `Entidade_Abrev`, `Id_Entidade_Actual`, `estado`) VALUES
(1, 'COMANDANTE-EM-CHEFE', 'CMDTE-EM-CHEFE', 0, b'1'),
(2, 'CHEFE DO ESTADO MAIOR GENERAL', 'CEMGFAA', 0, b'1'),
(3, 'COMANDANTE DO EXÉRCITO', 'CMDTE EXE', 92591, b'1'),
(4, 'CHEFE ESTADO MAIOR DO EXÉRCITO', 'CEME', 136, b'1'),
(5, 'VICE-CHEFE ESTADO MAIOR DO EXÉRCITO', 'VCEME', 0, b'0'),
(6, 'CHEFE DA DIVISÃO DE PESSOAL', 'CH. DIV', 0, b'0'),
(7, 'CHEFE DA DIRECÇÃO DE PESSOAL E QUADROS', 'CDPQEXE', 88816, b'0'),
(8, 'CHEFE', 'CDI', NULL, b'0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_estrutura_sub_unidade`
--

DROP TABLE IF EXISTS `tbl_estrutura_sub_unidade`;
CREATE TABLE IF NOT EXISTS `tbl_estrutura_sub_unidade` (
  `id_es` int NOT NULL AUTO_INCREMENT,
  `descricao_sub_unidade` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_grupo` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `visualizacao` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id_es`) USING BTREE,
  UNIQUE KEY `descricao_sub-unidade` (`descricao_sub_unidade`) USING BTREE,
  KEY `id_tipo` (`id_tipo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_estrutura_sub_unidade`
--

INSERT INTO `tbl_estrutura_sub_unidade` (`id_es`, `descricao_sub_unidade`, `id_grupo`, `id_tipo`, `visualizacao`) VALUES
(1, 'Comando', 1, 6, b'0'),
(2, 'Chefia', 2, 7, b'0'),
(3, 'Repartição de Planeamento e Sistemas de Informação', 3, 2, b'1'),
(4, 'Repartição de Análise e Desenvolvimento de Software', 3, 2, b'1'),
(5, 'Repartição de Asseguramento Técnico', 3, 2, b'1'),
(6, 'Centro de Processamento de Dados Principal', 3, 2, b'1'),
(7, 'Expediente e Arquivo(Secretária)', 5, 2, b'1'),
(8, 'Estado Maior', 3, 6, b'1'),
(9, 'Secção de Operações', 6, 5, b'1'),
(10, 'Secção de Inteligência Militar Operativa ', 6, 5, b'1'),
(11, 'Outros Orgãos e Serviços', 7, 9, b'1'),
(12, 'Secção de Logistica', 8, 5, b'1'),
(13, 'Secção de armamento e Técnica', 8, 5, b'1'),
(14, 'Sub-Unidades de Asseguramento Combativo', 9, 1, b'1'),
(15, 'Companinha de Reconhecimento', 10, 3, b'1'),
(16, 'Pelotão de Reconhecimento', 10, 4, b'1'),
(17, 'Grupo de Reconhecimento', 10, 4, b'1'),
(18, 'Companhia de Engenheiros sapadores', 11, 3, b'1'),
(19, 'Pelotão de Engenheiro Sapadores', 12, 4, b'1'),
(20, 'Pelotão de Engenharia Técnica', 13, 4, b'1'),
(21, 'Secção de Travessia ', 14, 5, b'1'),
(22, 'Secção de Extração de Aguas', 14, 5, b'1'),
(23, 'Repartição de Pessoal e Quadro', 3, 2, b'1'),
(24, 'Repartição de Informática', 3, 2, b'1'),
(25, 'Repartição de Logística', 3, 2, b'1'),
(26, 'Pessoal Excedentário', 15, 1, b'0'),
(27, ' Sem Dependência', 2, 9, b'1'),
(28, 'Comando Estado Maior', 0, 8, b'1'),
(32, 'Centro de Processamento de Dados', NULL, 5, b'1'),
(33, 'Repartição de Operações', NULL, 8, b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_grauparentesco`
--

DROP TABLE IF EXISTS `tbl_grauparentesco`;
CREATE TABLE IF NOT EXISTS `tbl_grauparentesco` (
  `idGParentesco` int NOT NULL,
  `Parentesco` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Grupo` int DEFAULT NULL,
  PRIMARY KEY (`idGParentesco`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_grauparentesco`
--

INSERT INTO `tbl_grauparentesco` (`idGParentesco`, `Parentesco`, `Grupo`) VALUES
(1, 'Pai', 1),
(2, 'Mãe', 1),
(3, 'Esposa (o)', 1),
(4, 'Filho (a)', 1),
(5, 'Tio(a)', 2),
(6, 'Irmã(o)', 2),
(8, 'Sobrinho(a)', 2),
(9, 'Amigo(a)', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_grupo_lingua`
--

DROP TABLE IF EXISTS `tbl_grupo_lingua`;
CREATE TABLE IF NOT EXISTS `tbl_grupo_lingua` (
  `id_grupo_lingua` smallint NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_grupo_lingua`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_grupo_lingua`
--

INSERT INTO `tbl_grupo_lingua` (`id_grupo_lingua`, `descricao`) VALUES
(1, 'NACIONAL'),
(2, 'ESTRANGEIRA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_grupo_tipo_subunidade`
--

DROP TABLE IF EXISTS `tbl_grupo_tipo_subunidade`;
CREATE TABLE IF NOT EXISTS `tbl_grupo_tipo_subunidade` (
  `id_grupo_tipo_subunidade` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_grupo_tipo_subunidade`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_grupo_tipo_subunidade`
--

INSERT INTO `tbl_grupo_tipo_subunidade` (`id_grupo_tipo_subunidade`, `descricao`) VALUES
(1, 'Administrativo'),
(2, 'Operativos'),
(3, 'Hospitalar');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_gsanguineo`
--

DROP TABLE IF EXISTS `tbl_gsanguineo`;
CREATE TABLE IF NOT EXISTS `tbl_gsanguineo` (
  `idGSangue` int DEFAULT NULL,
  `Tipo_Sanguinio` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `factor_RH` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `idGSangue` (`idGSangue`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_gsanguineo`
--

INSERT INTO `tbl_gsanguineo` (`idGSangue`, `Tipo_Sanguinio`, `factor_RH`) VALUES
(1, 'A+', 'Positivo'),
(2, 'A-', 'Negativo'),
(3, 'AB+', 'Positivo'),
(4, 'AB-', 'Negativo'),
(5, 'B+', 'Positivo'),
(6, 'B-', 'Negativo'),
(7, 'O+', 'Positivo'),
(8, 'O-', 'Negativo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_historico_progressao`
--

DROP TABLE IF EXISTS `tbl_historico_progressao`;
CREATE TABLE IF NOT EXISTS `tbl_historico_progressao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idOrdem` int DEFAULT NULL,
  `idPessoa` int DEFAULT NULL,
  `CodPatente` smallint DEFAULT NULL,
  `Cargo_id` int DEFAULT NULL,
  `Cargo_por_normalizar` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `Data_Registo` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idOrdem` (`idOrdem`,`idPessoa`),
  KEY `pessoa_ordem_unique` (`idPessoa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3077 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_historico_progressao`
--

INSERT INTO `tbl_historico_progressao` (`id`, `idOrdem`, `idPessoa`, `CodPatente`, `Cargo_id`, `Cargo_por_normalizar`, `Data_Registo`) VALUES
(1, 257, 118, 127, 1, 'OPERADOR DE CONTROLO E REVISAO DA SECCAO DE EXPLORACAO DA DIRECCAO PRINCIPAL DE OPERACOES/EMGFAA', '2022-12-01'),
(2, 188, 205, 128, 2, 'TECNICO DE ESTATISTICA DE SUB-SECCAO DE ESTATISTICA DO HOSPITAL MILITAR DA REGIAO MILITAR SUL', '2022-12-01'),
(3, 188, 160, 128, 3, 'CHEFE DO POSTO DE SOCORRO DA UNIDADE DE APOIO DA REGIAO MILITAR LESTE', '2022-12-01'),
(4, 272, 204, 120, 4, 'CHEFE DA OFICINA SECRETA DAS OFICINAS GERAIS DE REPARACAO DO EXERCITO', '2022-12-01'),
(5, 244, 124, 120, 5, 'OFICIAL DE PATRIMONIO DA SECCAO DE ADMINISTRACAO E FINANCAS DA UNIDADE DE APOIO/EMGFAA', '2022-12-01'),
(6, 272, 102, 117, 10, 'OFICIAL DE INFORMATICA E IDENTIFICACAO DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR NORTE', '2022-12-01'),
(7, 272, 263, 120, 11, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(8, 272, 245, 120, 35, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (DISPONIVEL)', '2022-12-01'),
(9, 245, 81, 127, 12, 'OPERADOR DE COMPUTADOR DA SECCAO DE PESSOAL E QUADROS DA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(10, 256, 124, 117, 14, 'OFICIAL DO PATRIMONIO DA SECCAO DE ADMINISTRACAO E FINANCAS DA UNIDADE DE APOIO/EMGFAA', '2022-12-01'),
(11, 379, 68, 128, 15, 'OPERADOR DE COMPUTADOR DA SECCAO DOS SERVICOS GERAIS DO CENTRO DE CLASSIFICACAO E SELECCAO DA HUILA REGIAO MILITAR SUL', '2022-12-01'),
(12, 333, 288, 121, 18, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 20ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(13, 333, 108, 121, 16, 'OFICIAL DE ESTUDOS DA REPARTICAO DE PLANEAMENTO E PROGRAMACAO FINANCEIRA DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(14, 491, 370, 127, 21, 'SGTO DE INFORMATICA E DIGITALIZACAO DA BIBLIOTECA MILITAR DO EXERCITO', '2022-12-01'),
(15, 333, 43, 121, 15, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 71ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(16, 451, 285, 120, 28, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(17, 487, 114, 120, 30, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ENGENHARIA E INFRA-ESTRUTURAS/EXE', '2022-12-01'),
(19, 333, 12, 121, 36, 'OFICIAL OPERATIVO DA REPARTICAO DE OPERACOES DA REGIAO MILITAR SUL', '2022-12-01'),
(21, 333, 169, 121, 11, 'COMANDANTE DO 1º PELOTAO DA 3ª COMPANHIA DO BATALHAO DE POLICIA MILITAR DO REGIMENTO DE POLICIA MILITAR/EXE', '2022-12-01'),
(22, 333, 52, 121, 13, 'OFICIAL DE LEGISLACAO DA REPARTICAO DE ORGANIZACAO E DIREITO DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(23, 333, 110, 121, 10, 'PROFESSOR DE PEDAGOGIA MILITAR, PSICOLOGIA MILITAR, HISTORIA E GEOGRAFIA DE ANGOLA E HISTORIA MILITAR DE ANGOLA DA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(24, 487, 282, 120, 14, 'OFICIAL DE PREPARACAO ESPECIAL DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(25, 487, 285, 120, 12, 'OFICIAL DE INFORMATICA E IDENTIFICACAO DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(26, 448, 371, 129, 17, 'OPERADOR DE INFORMATICA DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(27, 451, 250, 120, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(28, 448, 370, 127, NULL, 'SARGENTO PARA SEGURANCA INFORMATICA E DIGITALIZADOR DA OFICINA SECRETA DA BIBLIOTECA MILITAR DO EXERCITO', '2022-12-01'),
(29, 451, 73, 117, NULL, 'CHEFE DA SECCAO DE INFORMATICA DO DEPOSITO PRINCIPAL DE MATERIAL DE GUERRA/EXE', '2022-12-01'),
(30, 454, 15, 127, NULL, 'OPERADOR DE COMPUTADOR CPD REGIMENTO DE ARTILHARIA TERRESTRE DA 4ª DIVISAO INFª REGIAO MILITAR CENTRO', '2022-12-01'),
(31, 454, 384, 128, NULL, 'OPERADOR DE COMPUTADOR DO BATALHAO DE COMANDO E SERVICO DA ESCOLA DE ESPECIALISTAS DE LOGISTICA/EXE', '2022-12-01'),
(32, 451, 392, 121, NULL, 'OFICIAL DE TURNO INFORMATICO DA SECCAO DE INFORMATICA DO HOSPITAL MILITAR REGIONAL DA REGIAO MILITAR CABINDA', '2022-12-01'),
(33, 451, 375, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 31ª BrI 3ª DIVISAO INFª DA REGIAO MILITAR LESTE', '2022-12-01'),
(34, 465, 393, 117, NULL, 'OFICIAL DE BASE DE DADOS DA SECCAO DE INFORMATICA DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(35, 471, 15, 127, NULL, 'OPERADOR DE COMPUTADOR CPD REGIMENTO DE ARTILHARIA DE CAMPANHA DA 4ª DIVISAO INFª REGIAO MILITAR CENTRO', '2022-12-01'),
(36, 333, 163, 121, NULL, 'CHEFE DA OFICINA SECRETA DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(38, 487, 73, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO DEPOSITO PRINCIPAL DE MATERIAL DE GUERRA/EXE', '2022-12-01'),
(39, 491, 18, 127, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO, EXPEDIENTE E ARQUIVO DO CRM CUANDO CUBANGO REGIAO MILITAR SUL', '2022-12-01'),
(40, 491, 240, 128, NULL, 'OPERADOR DE COMPUTADOR  DA SECCAO DE SERVICOS GERAIS DO CENTRO DE CLASSIFICACAO E SELECCAO DE MALANGE DA REGIAO MILITAR NORTE', '2022-12-01'),
(41, 487, 250, 120, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(42, 482, 293, 131, NULL, 'AMANUENSE SECC DOCENCIA E CARREIRA REPARTICAO ADMINISTRACAO E FINANCAS DIRECCAO SAUDE MILITAR/EXE', '2022-12-01'),
(43, 68, 268, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE NA ORDEM Nº 0003/DE 28/09/2021 CMDTE EXERCITO', '2022-12-01'),
(44, 68, 271, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE NA ORDEM Nº 0003/DE 28/09/2021 CMDTE EXERCITO', '2022-12-01'),
(45, 379, 33, 127, NULL, 'AJUDANTE DO CENTRO DE PROCESSAMENTO DE DADOS CPD DIRECCAO PESSOAL E QUADROS/EXE', '2022-12-01'),
(46, 379, 333, 129, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(47, 470, 88, 136, NULL, 'ATIRADOR AKM 3ª SECCAO 2º PELOTAO COMPANHIA COMANDO E SERVICO REGIMENTO MANUTENCAO ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(48, 224, 313, 117, NULL, 'OFICIAL DE INFORMATICA DA REPARTICAO DE GESTAO E TECNOLOGIA DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(49, 333, 46, 121, NULL, 'TECNICO DE SUPORTE AO UTILIZADOR (HELP DESCK) DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(50, 333, 50, 121, NULL, 'PROGRAMADOR DO CENTRO DE PROCESSAMENTO DE DADOS DAS OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(51, 333, 173, 121, NULL, 'OFICIAL DE SISTEMAS DE INFORMACAO GEOGRAFICA DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(52, 140, 373, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DA HUILA', '2022-12-01'),
(53, 355, 92, 121, NULL, 'OFICIAL PARA CONCURSO, ADMISSAO, CARREIRAS E APOSENTACAO DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(54, 355, 147, 121, NULL, 'OFICIAL DE PESSOAL E QUADROS DO BATALHAO DE INFANTARIA INDEPENDENTE DA REGIAO MILITAR CABINDA', '2022-12-01'),
(55, 224, 312, 117, NULL, 'PROFESSOR DE INFORMATICA DO DEPARTAMENTO DE CIENCIAS SOCIAIS E HUMANAS E LIGUAS DA ACADEMIA MILITAR/EXE', '2022-12-01'),
(56, 68, 245, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE NA ORDEM Nº 0003/DE 28/09/2021 CMDTE EXERCITO', '2022-12-01'),
(57, 68, 244, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE NA ORDEM Nº 0003/DE 28/09/2021 CMDTE EXERCITO', '2022-12-01'),
(58, 224, 236, 117, NULL, 'OFICIAL DE PROGRAMACAO DA SECCAO DE TECNOLOGIAS DE INFORMACAO DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(59, 224, 248, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO COMANDO E ESTADO MAIOR DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(60, 224, 128, 117, NULL, 'CHEFE DA SECRETARIA DA ESCOLA PRATICA DE CONSTRUCAO/EXE', '2022-12-01'),
(61, 578, 165, 113, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA DIRECCAO DE CONTRA INTELIGENCIA MILITAR/EXE', '2022-12-01'),
(62, 95, 253, 121, NULL, 'OFICIAL DE PESSOAL E QUADROS DO 2º BATALHAO DA 51ª BRIGADA DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(63, 95, 2, 121, NULL, 'OFICIAL DE INFORMATICA DA COMPANHIA DE SERVICO DE PESSOAL/EXE', '2022-12-01'),
(64, 95, 152, 121, NULL, 'OFICIAL DE INFORMATICA DA ESCOLA PRATICA DE CONSTRUCAO DO EXERCITO', '2022-12-01'),
(65, 95, 220, 121, NULL, 'OFICIAL DE PESSOAL E QUADROS DO 1º BATALHAO DA 70ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(66, 95, 116, 121, NULL, 'OFICIAL DE PESSOAL E QUADROS DO 3º BATALHAO DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(67, 94, 278, 127, NULL, 'AJUDANTE DE ELABORACAO DE ORDENS DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(68, 94, 215, 127, NULL, 'AJUDANTE DE ELABORACAO DE ORDENS DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DIRECCAO DE PESSOAL E QUADROS DO COMANDO DO EXERCITO', '2022-12-01'),
(69, 387, 118, 127, NULL, 'ADJUNTO DE COMANDO DO 3º BATALHAO DA 21ª BrI 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(70, 284, 289, 129, NULL, 'SARGENTOS OPERACOES REPARTICAO OPERACOES CAMPO MILITAR GRAFANIL/EXE', '2022-12-01'),
(71, 224, 232, 117, NULL, 'PROGRAMADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(72, 384, 235, 117, NULL, 'OFICIAL DE GESTAO DE MAPAS DIGITAIS DA REPARTICAO DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(73, 578, 143, 115, NULL, 'OFICIAL DE PLANEAMENTO E SISTEMA DE INFORMACAO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(74, 416, 380, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA UNIDADE DE APOIO/EXE', '2022-12-01'),
(75, 384, 228, 120, NULL, 'OFICIAL DE REDES DA SECCAO DE INFORMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(76, 384, 275, 120, NULL, 'OFICIAL EM INACTIVIDADE/EXE', '2022-12-01'),
(77, 384, 380, 120, NULL, 'OFICIAL PROGRAMADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(78, 384, 175, 117, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 6ª DIVISAO DE INFANTARIA MOTORIZADA DA REGIAO MILITAR SUL', '2022-12-01'),
(79, 297, 287, 129, NULL, 'OPERADOR DE COMPUTADOR  DO HOSPITAL MILITAR RM CENTRO', '2022-12-01'),
(80, 387, 390, 129, NULL, 'AMANUENSE DOS SERVICOS GERAIS DO MUSEU/EXE', '2022-12-01'),
(81, 297, 96, 130, NULL, 'OPERADOR DE COMPUTADOR DO ARQUIVO DA RM CENTRO', '2022-12-01'),
(82, 373, 378, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA REGIAO MILITAR LESTE', '2022-12-01'),
(83, 373, 364, 121, NULL, 'OFICIAL PROGRAMADOR DA REPARTICAO DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(86, 373, 392, 121, NULL, 'OFICIAL PARA PROCESSAMENTO DE DADOS DA SECCAO DE ADMINISTRACAO EXPEDIENTE E ARQUIVO GERAL DO DRM-BENGUELA REGIAO MILITAR CENTRO', '2022-12-01'),
(88, 384, 250, 120, NULL, 'OFICIAL DE REDES E SISTEMAS DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(89, 384, 284, 120, NULL, 'OFICIAL DE TURNO DO CENTRO DE PROCESSAMENTO DE DADOS DO HOSPITAL MILITAR REGIONAL DA REGIAO MILITAR SUL', '2022-12-01'),
(90, 416, 315, 121, NULL, 'PROFESSOR CHEFE DE INFORMATICA DO CENTRO DE LINGUAS DA DIRECCAO DE ENSINO/EXE', '2022-12-01'),
(91, 416, 318, 120, NULL, 'OFICIAL DE ASSEGURAMENTO DE SISTEMA CENTRO DE CRIPTOLOGIA DO COMANDO DO EXERCITO', '2022-12-01'),
(93, 384, 393, 117, NULL, 'OFICIAL DE BASE DE DADOS DA REPARTICAO DE INFORMATICA DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(94, 499, 116, 127, NULL, 'SARGENTO DE INFORMATICA DOS SERVICOS FUNERARIOS CENTRAIS DO EXERCITO', '2022-12-01'),
(95, 499, 278, 128, NULL, 'AJUDANTE DE ELABORACAO DE ORDENS DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DPQ/EXE', '2022-12-01'),
(96, 373, 379, 121, NULL, 'OFICIAL DE TURNO INFORMATICO DA SECCAO DE INFORMATICA DO HOSPITAL MILITAR REGIONAL DA REGIAO MILITAR SUL', '2022-12-01'),
(97, 373, 394, 121, NULL, 'OFICIAL DE CONTRA PROPAGANDA DA REPARTICAO DE MOBILIZACAO DA DIRECCAO DE GUERRA PSICOLOGICA DO EXERCITO', '2022-12-01'),
(98, 401, 389, 136, NULL, 'OPERADOR COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(99, 401, 322, 136, NULL, 'OPERADOR COMPUTADOR SECCAO DE ADMINISTRACAO EXPEDIENTE E ARQUIVO CENTRO DE RECRUTAMENTO E MOBILIZACAO DE LUANDA', '2022-12-01'),
(100, 67, 397, 121, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(101, 535, 209, 128, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE INVESTIGACAO BIBLIOTECA MILITAR DO EXERCITO', '2022-12-01'),
(102, 530, 249, 120, NULL, 'CHEFE DA SALA VIRTUAL E MEDIATECA DA BIBLIOTECA DO EXERCITO', '2022-12-01'),
(103, 93, 248, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO COMANDO E ESTADO MAIOR DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(104, 530, 77, 117, NULL, 'OFICIAL DE DESENVOLVIMENTO E SISTEMAS DA SECCAO DE INFORMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(105, 416, 80, 117, NULL, 'OFICIAL DE ESTUDOS E REGULAMENTACAO NO INSTITUTO SUPERIOR DO EXERCITO', '2022-12-01'),
(106, 422, 169, 127, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE OPERACOES DO REGIMENTO DE POLICIA MILITAR/EXE', '2022-12-01'),
(107, 67, 296, 121, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA DE CONSTRUCOES E FORTIFICACOES NO ISTM/EMGFAA', '2022-12-01'),
(108, 530, 115, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO MUSEU DO EXERCITO', '2022-12-01'),
(110, 416, 238, 120, NULL, 'OFICIAL HARDWARE DA SECCAO DE INFORMATICA DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(111, 401, 289, 129, NULL, 'SARGENTO DE OPERACOES REPARTICAO DE OPERACOES CAMPO MILITAR GRAFANIL/EXE', '2022-12-01'),
(112, 535, 33, 127, NULL, 'OPERADOR DE TURNO CENTRO DE PROCESSAMENTO DE DADOS REPARTICAO DE OPERACOES DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(113, 430, 109, 121, NULL, 'OFICIAL DE ANALISE E CONTRATO DA REPARTICAO DE PLANEAMENTO DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(114, 605, 146, 115, NULL, 'OFICIAL DE SEGURANCA DE AUDITORIA DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(115, 529, 26, 115, NULL, 'OFICIAL DE SISTEMAS E REDES DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR SUL', '2022-12-01'),
(116, 529, 142, 115, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DAS OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(118, 529, 180, 115, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(119, 435, 302, 129, NULL, 'AUXILIAR DE HARDWARE DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(120, 605, 167, 111, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(121, 435, 32, 127, NULL, 'AJUDANTE P/CAPTURA DE IMAGEM DA REPARTICAO REGISTO E IDENTIFICACAO/DPQ/EXE', '2022-12-01'),
(122, 435, 49, 128, NULL, 'SGTO EM INACTIVIDADE TEMPORARIA/EXE (POR MOTIVO DE ESTUDOS)', '2022-12-01'),
(123, 116, 251, 117, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(124, 115, 109, 120, NULL, 'OFICIAL DE SISTEMAS E SERVIDORES DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(125, 499, 10, 128, NULL, 'OPERADOR DE COMPUTADOR DO CPD DA REPARTICAO DE OPERACOES DA REGIAO MILITAR CENTRO', '2022-12-01'),
(126, 605, 79, 115, NULL, 'OFICIAL DE PESQUISA E SISTEMAS EMBUTIDOS DA REPARTICAO DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(127, 203, 153, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA UNIDADE DE APOIO/EXE', '2022-12-01'),
(128, 605, 23, 113, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS DO EXERCITO', '2022-12-01'),
(129, 605, 177, 113, NULL, '1º OFICIAL DE SISTEMAS E SERVIDORES DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO INFORMATICA DO EXERCITO', '2022-12-01'),
(130, 187, 246, 117, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS DIRECAO PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(131, 116, 109, 117, NULL, 'OFICIAL DE ANALISE E CONTRATO DA REPARTICAO DE PLANEAMENTO DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(132, 187, 227, 117, NULL, 'OFICIAL TECNICO DE SISTEMAS E REDES DA SECCAO DE INFORMATICA DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(133, 116, 52, 126, NULL, 'AUXILIAR REDES E HARDWARE CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(134, 116, 122, 127, NULL, 'SARGENTO DE PLANEAMENTO DA REPARTICAO DE PLANEAMENTO DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(135, 63, 182, 128, NULL, 'SARGENTO DA SECRETARIA DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(136, 116, 265, 117, NULL, 'OFICIAL DE SOFTWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(137, 116, 348, 117, NULL, 'OFICIAL DE TECNICA DA WEB DA REPARTICAO DE GESTAO TECNOLOGICA DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(138, 21, 22, 128, NULL, 'SARGENTO DA COMPANHIA DE SERVICO DE PESSOAL DO EXERCITO', '2022-12-01'),
(139, 21, 101, 128, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE ASSISTENCIA E APOIO SOCIAL DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(140, 21, 240, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DE MALANGE', '2022-12-01'),
(141, 21, 302, 128, NULL, 'AUXILIAR DE HARDWARE DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(142, 187, 291, 117, NULL, 'CHEFE DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(143, 187, 235, 117, NULL, 'OFICIAL DE EXPLORACAO E SISTEMAS DA SECC DE INFOMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(144, 499, 134, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE CLASSIFICACAO E SELECCAO DE LUANDA', '2022-12-01'),
(145, 490, 62, 117, NULL, 'OFICIAL DE REGISTO DE RESERVISTA DA SECCAO DE REGISTO E MOBILIZACAO DO CRM BENGUELA REGIAO MILITAR CENTRO', '2022-12-01'),
(146, 499, 82, 129, NULL, 'AUXILIAR PARA REGISTO DE MEIOS MOVEIS DO CRM HUILA REGIAO MILITAR SUL', '2022-12-01'),
(147, 499, 85, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE SERVICOS GERAIS CENTRO DE CLASSIFICACAO E SELECCAO DE LUANDA', '2022-12-01'),
(148, 525, 105, 129, NULL, 'OPERADOR COMPUTADOR DA REPARTICAO DE OPERACOES RM CENTRO', '2022-12-01'),
(149, 513, 22, 129, NULL, 'SARGENTO DA COMPANHIA DE SERVICO DE PESSOAL DO EXERCITO', '2022-12-01'),
(150, 63, 98, 127, NULL, 'AMANUENSE DA REPARTICAO DE PLANEAMENTO E ORGANIZACAO DA REGIAO MILITAR CENTRO', '2022-12-01'),
(151, 91, 102, 117, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(152, 63, 116, 127, NULL, 'AMANUENSE DA REPARTICAO DE APOIO E ASSISTENCIA SOCIAL DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(153, 63, 186, 126, NULL, 'ADJUNTO DE COMANDO DO REGIMENTO DE DEFESA ANTI-AEREA DA 4ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(154, 20, 242, 120, NULL, 'FINALISTA DO CURSO DE ENGENHARIA E INFORMATICA DO INSTITUTO TECNICO MILITAR \"JOSE MARTI\" REPUBLICA DE CUBA', '2022-12-01'),
(155, 499, 253, 128, NULL, 'OPERADOR DE COMPUTADOR REPARTICAO DE REGISTO E IDENTIFICACAO DA DPQ/EXE', '2022-12-01'),
(156, 499, 195, 127, NULL, 'AMANUENSE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(157, 187, 272, 128, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES', '2022-12-01'),
(158, 535, 98, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA REGIAO MILITAR SUL', '2022-12-01'),
(159, 535, 217, 129, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 5ª DIVISAO INFª DA REGIAO MILITAR SUL', '2022-12-01'),
(160, 535, 31, 127, NULL, 'OPERADOR DE COMPUTADOR REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(161, 63, 202, 127, NULL, 'SARGENTO DE ABASTECIMENTO DA REPARTICAO DE ENGENHARIA E INFRA-ESTRUTURAS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(162, 91, 207, 117, NULL, 'AJUDANTE DE CAMPO DO CHEFE DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(163, 91, 208, 117, NULL, 'OFICIAL GESTOR DE MAPAS DIGITAIS DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(164, 63, 209, 128, NULL, 'OPERADOR DE COMPUTADOR DO CPD 41ª BRIGADA INFANTARIA 4ª DIVISAO INFANTARIA/RM CENTRO', '2022-12-01'),
(165, 91, 210, 117, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(166, 63, 215, 128, NULL, 'AJUDANTE DE ELABORACAO DE ORDENS DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DIRECCAO DE PESSOAL E QUADROS DO COMANDO DO EXÉRCITO', '2022-12-01'),
(167, 63, 220, 128, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DIRECCAO DE PESSOAL E QUADROS DO EXÉRCITO', '2022-12-01'),
(168, 91, 222, 117, NULL, 'PROGRAMADOR DA REPARTICAO DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(169, 91, 223, 117, NULL, 'OFICIAL DE SISTEMAS DE INFORMACAO GEOGRAFICA DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(170, 91, 225, 117, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(171, 18, 335, 136, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(172, 630, 164, 120, NULL, 'CHEFE SECRETARIA GERAL ESCOLA FORMACAO CONDUTORES AUTO NAMIBE/EXE', '2022-12-01'),
(173, 743, 249, 121, NULL, 'ESPECIALISTA DE INFORMATICA/ISTM', '2022-12-01'),
(175, 731, 208, 123, NULL, 'CADETE 4º ANO CURSO ELECTROTECNIA NO ISTM', '2022-12-01'),
(176, 390, 38, 129, NULL, 'OPERADOR CONTROLO REVISAO CPD DIR. INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(177, 565, 145, 128, NULL, 'SERRALHEIRO PTAO METALO MECANICO CIA TRABALHOS ESPECIAIS BTAO MANUT. ARMTO REGTO MANUTENCAO ARMTO TECNICA EXE', '2022-12-01'),
(178, 602, 176, 128, NULL, 'ADJUNTO CMDO 31ª BrI 3ª DIVISAO INFª RM LESTE', '2022-12-01'),
(179, 148, 176, 128, NULL, 'ADJ. CMDO 31ª BrI 3ª DIV. INFª RM LESTE', '2022-12-01'),
(180, 632, 162, 117, NULL, 'CHEFE SECCAO INFORMATICA 4ª DIVISAO INFª RM CENTRO', '2022-12-01'),
(181, 462, 164, 120, NULL, 'CHEFE SECRETARIA EFCA EXERCITO', '2022-12-01'),
(183, 457, 214, 129, NULL, 'OPERADORA CENTRO PROCESSAMENTO DADOS DIRECCAO INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(184, 6, 6, 117, NULL, 'OFICIAL HARDWARE REPART. ANALISE E DESENVOL. SISTEMA DIR. INFORMATICA EME', '2022-12-01'),
(185, 390, 213, 129, NULL, 'OPERADORA CPD DIR. INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(186, 224, 224, 117, NULL, 'OFICIAL DE PROGRAMACAO DA SECCAO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE CONTRA INTELIGENCIA MILITAR/EXE', '2022-12-01'),
(187, 224, 264, 117, NULL, 'OFICIAL DE SOFTWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(188, 602, 186, 128, NULL, 'AMANUENSE REP. PESS. QUADROS RM CENTRO', '2022-12-01'),
(189, 602, 195, 128, NULL, 'AMANUENSE REP. INFORMATICA RM LESTE', '2022-12-01'),
(190, 674, 218, 129, NULL, NULL, '2022-12-01'),
(191, 32, 121, 131, NULL, 'OPERADOR COMPUTADOR 21ª BrI 2ª DIV INFª RM NORTE', '2022-12-01'),
(192, 312, 69, 128, NULL, 'OPERADOR COMPUTADOR CPD DIRECCAO INFORMATICA EXE', '2022-12-01'),
(193, 32, 49, 129, NULL, 'AUXILIAR DE HARDWERE REPª ASSEG. TECNICO DIR. INFORMATICA EXE', '2022-12-01'),
(194, 729, 131, 117, NULL, 'TECNICO DE SISTEMAS DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA EMG', '2022-12-01'),
(195, 593, 60, 123, NULL, 'OFICIAL FORMACAO SEC. INFORMATICA RM CENTRO', '2022-12-01'),
(196, 560, 60, 121, NULL, 'OFICIAL INFORMACOES SECCAO INFORMATICA RM CENTRO', '2022-12-01'),
(197, 299, 12, 129, NULL, 'STO CMDO 54º RI ZONA MILITAR UIGE 1ª RM', '2022-12-01'),
(198, 290, 12, 128, NULL, 'STO CMDO 54º RI ZONA MILITAR UIGE 1ª RM', '2022-12-01'),
(199, 289, 66, 129, NULL, 'OPERADOR COMPUTADOR CPD DIREC. ARMAMENTO TECNICA/EME', '2022-12-01'),
(200, 520, 57, 136, NULL, 'APONTADOR GRUPO DAA 59ª BRIM', '2022-12-01'),
(201, 523, 57, 131, NULL, 'APONTADOR GRUPO DAA 59ª BRIM', '2022-12-01'),
(202, 569, 57, 129, NULL, 'CHEFE PECA GPO DAA 59ª BRIM', '2022-12-01'),
(203, 697, 154, 111, NULL, 'INSPECTOR P/OPERACOES IGE', '2022-12-01'),
(204, 347, 154, 113, NULL, 'INSPECTOR P/OPERAÇOES IGE', '2022-12-01'),
(205, 588, 66, 129, NULL, 'OPERADOR COMPUTADOR DIREC. SVC MATERIAL/EME', '2022-12-01'),
(206, 606, 144, 129, NULL, 'STO PESSOAL SECRETARIA GERAL COP/CUNENE RM SUL', '2022-12-01'),
(207, 603, 144, 128, NULL, 'STO PESSOAL SECRETARIA GERAL COP/CUNENE RM SUL', '2022-12-01'),
(208, 604, 370, 128, NULL, 'STO INFORMACOES GRUPO MISTO DAA/FM-CABINDA', '2022-12-01'),
(209, 30, 136, 128, NULL, 'STO OPERACOES CIA OPERACOES 5ª BRIM', '2022-12-01'),
(210, 664, 154, 113, NULL, 'CHEFE SECCAO PESSOAL CENTRO INSTRUCAO COMANDOS KATALANGOMBE', '2022-12-01'),
(211, 46, 154, 113, NULL, 'INSPECTOR ADJUNTO FM LESTE', '2022-12-01'),
(212, 440, 60, 120, NULL, 'OFICIAL HARDWER SEC. INFORMATICA 4ª RM', '2022-12-01'),
(213, 539, 174, 117, NULL, 'CHEFE SECCAO INFORMATICA REPARTICAO TRANSMISSOES QG RM SUL', '2022-12-01'),
(214, 687, 174, 117, NULL, 'CH.CENTRO PROCESS. DADOS REPART. PESS. QUADROS 2ª RM', '2022-12-01'),
(215, 708, 174, 115, NULL, 'CH.CENTRO PROCESS. DADOS REPART. PESS. QUADROS 2ª RM       \r\n', '2022-12-01'),
(216, 608, 144, 126, NULL, 'STO SECRETARIA GERAL COP CUNENE 5ª RM.', '2022-12-01'),
(217, 654, 46, 136, NULL, 'OPERADOR RADIO BCS CAMPO MILITAR GRAFANIL', '2022-12-01'),
(218, 424, 157, 128, NULL, 'SARG. OPERACOES SECCAO OPERACOES REPART. OPERACOES DIR. OPERACOES ì\nCMDO OPERACIONAL', '2022-12-01'),
(219, 29, 157, 128, NULL, 'STO PESSOAL ESCOLA PRATICA SVC MAT. REGTO SVC MATERIAIS/EME', '2022-12-01'),
(220, 657, 157, 128, NULL, 'STO SEC. OPERAC. REPART. OPERAC. DIREC. OPERACOES/COE', '2022-12-01'),
(221, 289, 157, 128, NULL, 'AMANUENSE SEC. EXPED. ARQUIVO DIREC. OPERACOES/EME', '2022-12-01'),
(222, 500, 157, 133, NULL, 'ESCRT.DACT.SEC.EXP.ARA.SALA OPERATIVA/EME', '2022-12-01'),
(223, 49, 46, 129, NULL, 'CHEFE SEC. RADIO PTAO TRANSMISSOES CAMPO MILITAR GRAFANIL/EME', '2022-12-01'),
(224, 289, 46, 136, NULL, 'OPERADOR RADIO SEC. Trx CAMPO MILITAR GRAFANIL', '2022-12-01'),
(225, 568, 50, 129, NULL, 'AMANUENSE PTAO REABASTº BTAO APOIO SVC RM BENGO', '2022-12-01'),
(226, 289, 50, 129, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMENTO DADOS DIR. PESS/EME', '2022-12-01'),
(227, 604, 9, 128, NULL, 'ADJ. SECT. SERV. PESS. BTAO APOIO E SVC FM/CABINDA ', '2022-12-01'),
(228, 121, 9, 121, NULL, 'OFICIAL PESSOAL QUADROS 2ª RM', '2022-12-01'),
(229, 569, 51, 128, NULL, 'STO OPERACOES SEC. OPERACOES INFORM. REGTO SVC MATERIAL/EME', '2022-12-01'),
(230, 98, 3, 121, NULL, 'OF. MANUTENCAO SEC. TEC. ENGª REGTO RADIO ELECTRONICO EME', '2022-12-01'),
(231, 323, 3, 121, NULL, 'INSTRUTOR SEC. FORMACAO REPART. INFORMATICA EMC', '2022-12-01'),
(232, 547, 3, 120, NULL, 'PROGRAMADOR COMPUTADOR SEC. PLAN. ADM. PESS. REPART. PESSOAL EMC', '2022-12-01'),
(233, 582, 3, 120, NULL, 'OFICIAL ESTUDOS PLANEAM. SEC. INFORMAT. REPART. PESSOAL RM NORTE', '2022-12-01'),
(234, 206, 3, 120, NULL, 'INSTRUTOR SEC. FORMACAO REPART. INFORMATICA EMC\r\n', '2022-12-01'),
(235, 160, 155, 120, NULL, 'OF. VIVERES VESTUARIO SEC. LOGISTICA COP/HUILA FM SUL', '2022-12-01'),
(236, 608, 39, 128, NULL, 'STO PTAO INFANTª BTAO RESERVA 7ª RM', '2022-12-01'),
(237, 260, 3, 117, NULL, 'CH. SEC. INFORMATICA 8ª RM   \r\n', '2022-12-01'),
(238, 4, 78, 129, NULL, 'CMDTE SECCAO INFANTARIA 101ª BRIGADA TANQUES', '2022-12-01'),
(239, 246, 3, 120, NULL, 'OFICIAL P/REPARACAO SEC. TECNICA ENGª REGº RADIO ELECTRONICO EME', '2022-12-01'),
(240, 645, 3, 121, NULL, 'CMDTE PELOTAO INFANTARIA', '2022-12-01'),
(241, 205, 3, 121, NULL, 'CHEFE GRUPO RADIO GEONEOMETRIA REGMTO RADIO ELECTRONICA EME', '2022-12-01'),
(242, 287, 155, 120, NULL, 'CMDTE PTAO ALIMENTACAO FM SUL', '2022-12-01'),
(243, 18, 218, 127, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(244, 18, 220, 128, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(245, 18, 32, 126, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(246, 18, 253, 128, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(247, 354, 366, 129, NULL, 'AMANUENSE SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(248, 43, 318, 117, NULL, 'OFICIAL DE ASSEGURAMENTO DE SISTEMAS DO CENTRO DE CRIPTOLOGIA DO EXERCITO', '2022-12-01'),
(249, 19, 396, 129, NULL, 'COMANDANTE DA 2ª SECCAO DO 3º PELOTAO DA 1ª COMPANHIA DO 1º BATALHAO DA 11ª BrI DA 1ª DIVISAO INFª DA REGIAO MILITAR CABINDA', '2022-12-01'),
(250, 19, 39, 128, NULL, 'OPERADOR DE COMPUTADOR DO DEPOSITO MATERIAL DE GUERRA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(251, 19, 125, 128, NULL, 'AMANUENSE DA SECCAO ADMINISTRACAO EXPEDIENTE E ARQUIVO DO DRM BENGUELA REGIAO MILITAR CENTRO', '2022-12-01'),
(252, 42, 248, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO PESSOAL E QUADROS CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(254, 43, 314, 117, NULL, 'COORDENADOR DE INFORMATICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(255, 43, 199, 133, NULL, 'ARQUIVISTA DA SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(256, 43, 88, 133, NULL, 'CMDTE DE ESQUADRA 3ª SECCAO 2º PTAO  DO REGIMENTO DE MANUTENCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(257, 43, 230, 117, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(258, 43, 69, 126, NULL, 'SARGENTO DE GESTAO DE PESSOAL CIVIL DA SECCAO DE PESSOAL E QUADROS DA BRIGADA DE ENGENHARIA DE CONSTRUCAO/EXE', '2022-12-01'),
(259, 43, 108, 127, NULL, 'OPERADOR DE CONTROLO E REVISAO DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(260, 43, 309, 45, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO/EXE LUANDA', '2022-12-01'),
(261, 354, 333, 129, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(262, 66, 331, 129, NULL, 'SANITARIO DO POSTO MEDICO DA ESCOLA PRATICA DE CONSTRUCAO/EXE', '2022-12-01'),
(263, 66, 330, 131, NULL, 'OPERADOR DE COMUPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 70ª BrIM/RM NORTE', '2022-12-01'),
(264, 43, 96, 45, NULL, 'CMDTE DA 1ª SECCAO DO 2º PELOTAO DA 3ª CIA DO 2º BTAO DA 40 BRIGADA/RM CENTRO', '2022-12-01'),
(265, 43, 126, 45, NULL, 'AMANUENSE SECCAO DE SAUDE RGTO DAA 4ª DIV. INFª/RM CENTRO', '2022-12-01'),
(266, 446, 360, 136, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS REGIMENTO MANUTENCAO ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(267, 354, 381, 128, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(268, 364, 138, 117, NULL, 'OFICIAL DE PESSOAL E QUADROS DO GRUPO ARTILHARIA TERRESTRE 2S 7M DA BRIGADA DE ARTILHARIA DE CAMPANHA/EXE', '2022-12-01'),
(269, 344, 242, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 20ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(270, 43, 273, 133, NULL, 'CONDUTOR-AUTO SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(271, 43, 201, 133, NULL, 'ARQUIVISTA DA SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(272, 43, 327, 133, NULL, 'OPERADOR COMPUTADOR DO CENTRO DE CLASSIFICACAO E SELECCAO/EXE-LUANDA', '2022-12-01'),
(273, 43, 200, 133, NULL, 'CONDUTOR-AUTO DA SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(274, 22, 286, 120, NULL, 'TECNICA DE REDES E HARDWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(275, 156, 298, 136, NULL, 'OPERADOR COMPUTADOR SECCAO INFORMATICA CAMPO MILITAR GRAFANIL/EXE', '2022-12-01'),
(276, 353, 184, 131, NULL, 'CONDUTOR-AUTO DA SECCAO DE ADMINISTRACAO DISTRITO DE RECRUTAMENTO E MOBILIZACAO CUNENE/RM SUL', '2022-12-01'),
(277, 307, 309, 131, NULL, 'AMANUENSE UNIDADE APOIO RM LESTE', '2022-12-01'),
(278, 434, 48, 117, NULL, 'OFICIAL DE INFORMATICA E IDENTIFICACAO DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CENTRO', '2022-12-01'),
(279, 17, 46, 126, NULL, 'REVOGADO A ORDEM Nº 001/CMDTE EXE DE 02-02-2017 DE FEVEREIRO', '2022-12-01'),
(280, 421, 276, 121, NULL, 'OFICIAL DE METEOROLOGIA DA SECCAO DE GEOGRAFIA DA REPARTICAO DE GEOGRAFIA DA DIRECCAO DOS SERVICOS DE GEOGRAFIA E CARTOGRAFIA MILITAR/EMGFAA', '2022-12-01'),
(281, 421, 277, 121, NULL, 'OFICIAL DE GEODESIA DA REPARTICAO DE CARTOGRAFIA DA DIRECCAO DOS SERVICOS DE GEOGRAFIA E CARTOGRAFIA MILITAR/EMGFAA', '2022-12-01'),
(284, 439, 55, 111, NULL, 'LICENCIADO POR LIMITE DE IDADE A REFORMA', '2022-12-01'),
(285, 383, 184, 133, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUNENE REGIAO MILITAR SUL', '2022-12-01'),
(286, 371, 394, 121, NULL, 'FINALISTA CURSO DE FORMACAO ENGENHARIA INFORMATICA OFICIAIS DO QP INSTITUTO SUPERIOR MILITAR/EMGFAA', '2022-12-01'),
(287, 352, 180, 117, NULL, 'CHEFE SECCAO DE INFORMATICA DA 2ª DIVISAO INFANTARIA REGIAO MILITAR NORTE', '2022-12-01'),
(288, 372, 10, 128, NULL, 'OPERADOR DE COMPUTADOR DO CPD DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO UIGE DA REGIAO MILITAR NORTE', '2022-12-01'),
(289, 372, 15, 127, NULL, 'OPERADOR DE COMPUTADOR CPD REGIMENTO DE ARTILHARIA TERRESTRE DA 1ª DIVISAO INFª REGIAO MILITAR CABINDA', '2022-12-01'),
(290, 372, 21, 128, NULL, 'OPERADOR DE COMPUTADOR DO CPD DA 12ª BrI 1ª DIVISAO INFª REGIAO MILITAR CABINDA', '2022-12-01'),
(291, 372, 31, 127, NULL, 'OPERADOR DE COMPUTADOR SECCAO INFORMATICA DA 1ª DIVISAO DA REGIAO MILITAR CABINDA', '2022-12-01'),
(292, 269, 363, 133, NULL, 'LICENCIADO A RESERVA REQUERIDA ORDEM Nº 0014/CMDTE.EXE/2020 DE 24 DE JUNHO', '2022-12-01'),
(293, 352, 291, 120, NULL, 'CHEFE DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(294, 371, 378, 121, NULL, 'FINALISTA CURSO DE FORMACAO ENGENHARIA INFORMATICA OFICIAIS DO QP INSTITUTO SUPERIOR MILITAR/EMGFAA', '2022-12-01'),
(295, 371, 364, 121, NULL, 'FINALISTA CURSO DE FORMACAO ENGENHARIA INFORMATICA OFICIAIS DO QP INSTITUTO SUPERIOR MILITAR/EMGFAA', '2022-12-01'),
(296, 372, 90, 127, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(297, 372, 98, 128, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(298, 371, 392, 121, NULL, 'FINALISTA CURSO DE FORMACAO ENGENHARIA INFORMATICA OFICIAIS DO QP INSTITUTO SUPERIOR MILITAR/EMGFAA', '2022-12-01'),
(299, 372, 182, 129, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE RECRUTAMENTO E MOBILIZACAO DO CUANDO-CUBANGO REGIAO MILITAR SUL', '2022-12-01'),
(300, 372, 191, 128, NULL, 'OPERADOR DE COMPUTADOR CPD DA 12ª BrI 1ª DIVISAO INFª REGIAO MILITAR CABINDA', '2022-12-01'),
(301, 352, 123, 117, NULL, 'OFICIAL DE PREPARACAO ESPECIAL DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(302, 352, 207, 120, NULL, 'AJUDANTE DE CAMPO DO CHEFE DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(303, 352, 223, 120, NULL, 'OFICIAL DE SISTEMAS DE INFORMACAO GEOGRAFICA DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(304, 352, 228, 120, NULL, 'OFICIAL DE HARDWARE DA SECCAO DE INFORMATICA DIRECCAO DE ARMAMENTO E TECNICA DO EXERCITO', '2022-12-01'),
(306, 352, 276, 121, NULL, 'OFICIAL DE SISTEMA DE INFORMATICA GEOGRAFICA DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(307, 352, 277, 121, NULL, 'OFICIAL DE SISTEMA DE INFORMACAO GEOGRAFICA DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(308, 352, 79, 117, NULL, 'OFICIAL DE PESQUISA E SISTEMAS EMBUTIDOS PROGRAMADOR DA REPARTICAO DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(309, 372, 206, 129, NULL, 'OPERADOR DE COMPUTADOR DA UNIDADE DOS SERVICOS PENITENCIARIOS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(310, 372, 217, 129, NULL, 'OPERADOR DE COMPUTADOR DO CPD DA 12ª BrI DA 1ª DIVISAO INFª REGIAO MILITAR CABINDA', '2022-12-01'),
(311, 372, 147, 127, NULL, 'OPERADOR DE COMPUTADOR DO CPD 1ª DIVISAO DA REGIAO MILITAR CABINDA', '2022-12-01'),
(312, 343, 235, 120, NULL, 'OFICIAL DE EXPLORACAO E SISTEMAS DA SECC DE INFOMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(313, 372, 172, 127, NULL, 'AMANUENSE REPARTICAO DE INFORMATICA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(314, 372, 87, 128, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE INFORMATICA DA 1ª DIVISAO INFª REGIAO MILITAR CABINDA', '2022-12-01'),
(315, 306, 97, 131, NULL, 'OPERADOR DE COMPUTADOR DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUANDO CUBANGO RM SUL', '2022-12-01'),
(316, 306, 65, 131, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO BIE RM CENTRO', '2022-12-01'),
(317, 306, 99, 131, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS SECCAO DE INFORMATICA 3ª DIVISAO DE INFANTARIA RM LESTE', '2022-12-01'),
(318, 306, 93, 133, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS COMANDO DA 5ª DIVISAO DE INFANTARIA RM SUL', '2022-12-01'),
(319, 306, 100, 133, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE INFORMATICA RM NORTE', '2022-12-01'),
(320, 343, 356, 136, NULL, 'OPERADOR COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS 72ª BRIM RM LESTE', '2022-12-01'),
(321, 331, 235, 120, NULL, 'COMANDANTE 3ª COMPANHIA 1º BATALHAO 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(322, 434, 238, 120, NULL, 'OFICIAL DE SISTEMAS E REDES DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(323, 383, 111, 133, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR SUL', '2022-12-01'),
(324, 429, 389, 61, NULL, ' RECRUTAS INGRESSO NA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(325, 91, 284, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 42ª BBRIGADA DE INFANTARIA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(326, 91, 252, 120, NULL, 'OFICIAL TECNICO DE SISTEMAS E REDES SECCAO DE INFORMATICA HOSPITAL MILITAR RM CENTRO', '2022-12-01'),
(327, 408, 360, 61, NULL, 'CENTRO DE INSTRUCAO DO LUENA', '2022-12-01'),
(328, 242, 324, 131, NULL, 'OPERADORA DE COMPUTADOR SEC. CPD DO CMDO E/MAIOR DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(329, 222, 92, 129, NULL, 'OPERADOR COMPUTADOR CPD/REP PESS QUADROS RM CABINDA', '2022-12-01'),
(330, 91, 279, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 21ª BRIGADA DE INFANTARIA DA 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(331, 91, 285, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 50ª BRIGADA DE INFANTARIA DA 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(332, 91, 249, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 31ª BrI 3ª DIVISAO INFª DA RM LESTE', '2022-12-01'),
(333, 91, 250, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 72ª BrIM DA RM LESTE', '2022-12-01'),
(334, 91, 251, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DE INFORMATICA DA 30ª BrIM RM LESTE', '2022-12-01'),
(335, 222, 101, 129, NULL, 'OPERADOR COMPUTADOR RAAS DIRECCAO PESSOAL QUADROS/EXE', '2022-12-01'),
(336, 222, 197, 129, NULL, 'SGTO SISTEMA CPD DAA 32ª BRI DA 3ª DIV. INFª RM LESTE', '2022-12-01'),
(337, 115, 351, 120, NULL, 'OFICIAL DE HARDWARE REPARTICAO DE TECNOLOGIAS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(338, 115, 266, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA RM CENTRO', '2022-12-01'),
(339, 115, 275, 120, NULL, 'OFICIAL DE SISTEMA DE INFORMACAO GEOGRAFICA DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(340, 91, 263, 120, NULL, 'OFICIAL DE HARDWARE DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(341, 115, 265, 120, NULL, 'OFICIAL DE SOFTWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(342, 115, 311, 120, NULL, 'OFICIAL INFORMATICA REPARTICAO GESTAO TECNOLOGIA ACADEMIA MILITAR/EXE', '2022-12-01'),
(343, 91, 391, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 20ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(344, 91, 282, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 12ª BRIGADA DE INFANTARIA DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(345, 115, 269, 120, NULL, 'OFICIAL DE SOFTWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARTILHARIA TERRESTRE/EXE', '2022-12-01'),
(346, 115, 270, 120, NULL, 'OFICIAL DE SOFWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE DEFESA ANTI-AEREA/EXE', '2022-12-01'),
(348, 64, 13, 121, NULL, 'OFICIAL DE REDE E PROGRAMACAO DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(349, 63, 57, 127, NULL, 'AMANUENSE DO GABINETE DO 2º COMANDANTE DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(350, 92, 218, 127, NULL, 'AMANUENSE DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CENTRO', '2022-12-01'),
(351, 91, 78, 117, NULL, 'OFICIAL DE REDES DA SECCAO DE INFORMATICA DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(352, 63, 49, 127, NULL, 'AUXILIAR DE HARDWARE DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(353, 242, 127, 131, NULL, 'AMANUENSE SEC. PESOAL E QUADROS RGTO DAA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(354, 115, 62, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO MUSEU DO EXERCITO', '2022-12-01'),
(355, 63, 71, 128, NULL, 'OPERADOR DE COMPUTADOR DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(356, 529, 137, 113, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(357, 529, 165, 113, NULL, 'OFICIAL DE PLANEAMENTO E SISTEMA DE INFORMACAO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(358, 332, 276, 120, NULL, 'OFICIAL DE SISTEMA DE INFORMATICA GEOGRAFICA DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(359, 65, 32, 126, NULL, 'SARGENTO DE CAPTURA DE IMAGEM DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(360, 242, 372, 131, NULL, 'ATIRADOR L/G. 3ª SEC. 1º PTÃO 2ª CIA 3º BTÃO 52ª BrI 2ª DIV. RM NORTE', '2022-12-01'),
(361, 363, 277, 120, NULL, 'OFICIAL DE SISTEMAS DE INFORMACAO GEOGRAFICA DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(362, 242, 336, 131, NULL, 'OPERADOR COMPUTADOR REPARTICAO DE PESSOAL E QUADROS RM CABINDA', '2022-12-01'),
(364, 254, 96, 130, NULL, 'AMANUENSE SECRETARIA GERAL CMDO 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(365, 202, 354, 133, NULL, 'OPERADOR COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS UNIDADE E APOIO/EXE', '2022-12-01'),
(366, 242, 293, 131, NULL, 'OP. TURNO POSTO CMDO RM CENTRO', '2022-12-01'),
(367, 242, 126, 131, NULL, 'AMANUENSE SEC. SAUDE RGTO DAA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(368, 254, 94, 130, NULL, 'OPERADOR DE DADO DO CPD DO DEPOSITO MATERIAL DE GUERRA/RM SUL', '2022-12-01'),
(369, 254, 130, 130, NULL, 'CMDO 73ª BRIM RM CENTRO', '2022-12-01'),
(370, 139, 241, 120, NULL, 'CHEFE DO CPD DA SECCAO DE INFORMATICA DA INSPECÇÃO GERAL/EXE', '2022-12-01'),
(371, 139, 262, 120, NULL, 'OFICIAL DE IDENTIFICACAO E INFORMATICA DA REPARTICAO DE PESSOAL E QUADROS DA RM LESTE', '2022-12-01'),
(372, 139, 115, 120, NULL, 'CMDTE DO PDI DO CMDO EM DA 1ª DIVISAO INFª REGIAO MILITAR CABINDA', '2022-12-01'),
(373, 202, 100, 133, NULL, 'OPERADOR DE COMPUTADOR DO CPD DO CMDO EM DA 1ª DIVISAO RM CABINDA', '2022-12-01'),
(375, 202, 383, 133, NULL, 'CONDUTOR AUTO DA DIRECCAO DE INFORMATICA', '2022-12-01'),
(376, 202, 310, 133, NULL, 'OPERADOR DE COMPUTADOR CPD 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(377, 202, 353, 133, NULL, 'OPERADOR COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS UNIDADE DE APOIO/EXE', '2022-12-01'),
(378, 453, 249, 121, NULL, 'CHEFE DA SALA VIRTUAL E MEDIATECA DA BIBLIOTECA DO EXERCITO', '2022-12-01'),
(379, 202, 320, 133, NULL, 'OP. COMPUTADOR CPD DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(380, 459, 390, 129, NULL, 'AUXILIAR DE SISTEMAS DA SALA VIRTUAL MEDIATECA DA BIBLIOTECA DO EXERCITO', '2022-12-01'),
(381, 579, 277, 120, NULL, 'OFICIAL DE GEODESIA DA REPARTICAO DE CORTOGRAFIA DIRECCAO DOS SERVICOS DE GEOGRAFIA E CARTOGRAFIA MILITAR/EMGFAA', '2022-12-01'),
(382, 459, 209, 129, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE INVESTIGACAO DA BIBLIOTECA MILITAR DO EXERCITO', '2022-12-01'),
(383, 450, 22, 129, NULL, 'AUXILIAR DE REGISTO PELOTAO SERVICOS GERAIS COMPANHIA DE SERVICO DE PESSOAL/EXE', '2022-12-01'),
(384, 450, 309, 133, NULL, 'OPERADOR COMPUTADOR SECCAO ADMINISTRACAO EXPEDIENTE E ARQUIVO CENTRO RECRUTAMENTO E MOBILIZACAO DE LUANDA', '2022-12-01'),
(385, 450, 88, 136, NULL, 'ATIRADOR AKM 3ª SECCAO DO 2º PELOTAO COMPANHIA COMANDO SERVICO REGIMENTO MANUTENCAO ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(386, 579, 276, 120, NULL, 'OFICIAL DE METEREOLOGIA DA SECCAO DE GEOGRAFIA DA REPARTICAO DE GEOGRAFIA DIRECCAO DOS SERVICOS DE GEOGRAFIA E CARTOGRAFIA MILITAR/EMGFAA', '2022-12-01'),
(387, 408, 385, 61, NULL, 'CENTRO DE INSTRUCAO DA SANTA EULALIA', '2022-12-01'),
(388, 415, 295, 136, NULL, 'LICENCIADO A RESERVA POR TERMINO DO CUMPRIMENTO DO SVC MILITAR (MILITARES INCORPORADOS NO ANO 2014)', '2022-12-01'),
(389, 394, 82, 129, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO ARQUIVO E EXPEDIENTE DO CRM MOXICO REGIAO MILITAR LESTE', '2022-12-01'),
(390, 394, 83, 128, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE ADMINISTRACAO ARQUIVO E EXPEDIENTE DO CRM CUNENE REGIAO MILITAR SUL', '2022-12-01'),
(391, 342, 10, 128, NULL, 'OPERADOR DE COMPUTADOR DO PC REPARTICAO OPERACOES DO 2º CORPO DO EXERCITO', '2022-12-01'),
(392, 411, 112, 129, NULL, 'OPERADOR COMPUTADOR REPARTICAO DE INFORMATICA RM CENTRO', '2022-12-01'),
(393, 394, 68, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO ARQUIVO E EXPEDIENTE DO CRM NAMIBE REGIAO MILITAR SUL', '2022-12-01'),
(394, 400, 332, 136, NULL, 'OPERADOR COMPUTADOR SECCAO PESSOAL E QUADROS 75ª BRIM 3ª DIVISAO DE INFANTARIA RM LESTE', '2022-12-01'),
(395, 411, 117, 120, NULL, 'OFICIAL PROCESSAMENTO DE DADOS DISTRITO DE RECRUTAMENTO E MOBILIZACAO DE MALANGE RM NORTE', '2022-12-01'),
(396, 394, 367, 128, NULL, 'OPERADOR DE COMPUTADOR DO CPD REGIMENTO MANUTENCAO ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(397, 394, 85, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO ARQUIVO E EXPEDIENTE DO CRM CUANDO-CUBANGO REGIAO MILITAR SUL', '2022-12-01'),
(398, 330, 79, 117, NULL, 'OFICIAL DE SISTEMA DE REDES DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(399, 330, 146, 117, NULL, 'OFICIAL DE SEGURANCA DE AUDITORIA DA REPARTICAO DE PLANEAMENTO E SISTEMA DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(400, 330, 282, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(401, 330, 391, 121, NULL, 'TECNICO DE SISTEMAS DO CPD DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(402, 252, 389, 61, NULL, 'MATRICULA DE RECRUTA DO XIV CURSO DE FORMACAO DE INSTRUCAO BASICA MILITAR DO 1º TURNO DE RECRUTAMENTO MILITAR DO ANO DE 2019 CITE/SANTA EULALIA', '2022-12-01'),
(403, 240, 360, 61, NULL, 'MATRICULA DE RECRUTA DO XIV CURSO DE FORMACAO DE INSTRUCAO BASICA MILITAR DO 1º TURNO DE RECRUTAMENTO MILITAR DO ANO DE 2019 CITE/LUENA', '2022-12-01'),
(404, 370, 203, 128, NULL, 'OPERADOR DE COMPUTADOR DA SUB-SECCAO DE INFORMATICA DA SECCAO DE ESTATISTICA E INFORMATICA DO HOSPITAL MILITAR REGIONAL SUL', '2022-12-01'),
(405, 138, 117, 120, NULL, 'OFICIAL PROCESSAMENTO DE DADOS SECCAO ADMINISTRACAO ARQUIVO E EXPEDIENTE CENTRO RECRUTAMENTO MOBILIZACAO MALANJE REGIAO MILITAR NORTE', '2022-12-01'),
(406, 12, 380, 121, NULL, 'COMANDANTE DO 1º PELOTAO DA 3ª COMPANHIA DO 2º BATALHAO DA 22ª BRIGADA DE INFANTARIA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(407, 305, 276, 121, NULL, 'FINALISTA DO CURSO DE CARTOGRAFIA GEOINFORMATICA NA ACADEMIA MILITAR DE DEFESA COSMICA MOJAISKI (TVER, SÃO PETERSBURGO) NA FEDERACAO RUSSIA', '2022-12-01'),
(408, 305, 277, 121, NULL, 'FINALISTA DO CURSO DE ASTRONOMOGEODEGIA ACADEMIA MILITAR DE DEFESA COSMICA MOJAISKI (TVER, SÃO PETERSBURGO) NA FEDERACAO RUSSIA', '2022-12-01'),
(409, 90, 263, 121, NULL, 'OFICIAL DE HARDWARE DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(410, 15, 276, 121, NULL, 'FINALISTA DO CURSO DE CARTOGRAFIA GEOINFORMATICA NA ACADEMIA MILITAR DE DEFESA COSMICA MOJAISKI (TVER, SÃO PETERSBURGO)', '2022-12-01'),
(411, 15, 277, 121, NULL, 'FINALISTA DO CURSO DE ASTRONOMOGEODEGIA ACADEMIA MILITAR DE DEFESA COSMICA MOJAISKI (TVER, SÃO PETERSBURGO)', '2022-12-01'),
(412, 13, 366, 133, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTO DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(413, 362, 291, 120, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE', '2022-12-01'),
(414, 13, 302, 133, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTO DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(415, 137, 203, 128, NULL, 'SGTO EM INACTIVIDADE TEMPORARIA/EXE', '2022-12-01'),
(416, 13, 193, 133, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTO DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(417, 90, 391, 121, NULL, 'OFICIAL DE HARDWARE DA 71ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(418, 136, 391, 121, NULL, 'CHEFE DO CPD DA 20ª BrIM RM NORTE', '2022-12-01'),
(419, 296, 82, 129, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DA HUILA', '2022-12-01'),
(420, 136, 263, 121, NULL, 'CHEFE DO CPD DA 71ª BrIM DA RM NORTE', '2022-12-01'),
(421, 13, 333, 131, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTO DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(423, 360, 202, 128, NULL, 'SARGENTO DE ABASTECIMENTO DA REPARTICAO DE ENGENHARIA E INFRA-ESTRUTURAS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(424, 174, 109, 121, NULL, 'OFICIAL DE SISTEMAS E SERVIDORES DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01');
INSERT INTO `tbl_historico_progressao` (`id`, `idOrdem`, `idPessoa`, `CodPatente`, `Cargo_id`, `Cargo_por_normalizar`, `Data_Registo`) VALUES
(425, 174, 238, 120, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDOS DURANTE 4 ANOS)', '2022-12-01'),
(426, 186, 69, 127, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE GESTAO DE PESSOAL CIVIL DA DPQ/EXE', '2022-12-01'),
(427, 341, 256, 136, NULL, 'LICENCIADO A RESERVA POR TERMINO DO CUMPRIMENTO DO SVÇ MILITAR (MILITAR ENTREGUE A PN)', '2022-12-01'),
(428, 361, 390, 136, NULL, 'ALUNOS INTEGRAR NO CURSO DE PROMOCAO DE SARGENTOS DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(429, 319, 203, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECRETARIA DA UNIDADE UNIDADE DE APOIO DA RM SUL', '2022-12-01'),
(430, 88, 146, 117, NULL, 'OFICIAL DE PESSOAL E QUADROS DO GRUPO KUADRATE DO REGIMENTO DE DEFESA ANTI-AEREA/EXE', '2022-12-01'),
(431, 393, 263, 121, NULL, 'COMANDANTE PELOTAO DE RADIO CIA DE TELECOM DA 72ª BrIM RM LESTE', '2022-12-01'),
(432, 536, 315, 121, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDO REPUBLICA DE CUBA)', '2022-12-01'),
(433, 536, 316, 120, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDO REPUBLICA DE CUBA)', '2022-12-01'),
(434, 536, 317, 120, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDO REPUBLICA DE CUBA)', '2022-12-01'),
(435, 360, 187, 128, NULL, 'AUXILIAR PARA REGISTO DE MEIOS MOVEIS DA SECCAO DE REGISTO E MOBILIZACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DE BENGUELA', '2022-12-01'),
(436, 442, 284, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 42ª BrI 2ª DIVISAO INFª DA RM NORTE', '2022-12-01'),
(437, 13, 396, 136, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTO DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(438, 407, 298, 136, NULL, 'OPERADOR DE COMPUTADOR DA COMPANHIA DE COMANDO E SERVIÇO DO EXÉRCITO', '2022-12-01'),
(439, 218, 349, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(440, 41, 390, 136, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO MILICIANO NA EIAS', '2022-12-01'),
(441, 407, 215, 129, NULL, 'AJUDANTE DE ELABORAÇÃO DE ORDENS DA REPARTIÇÃO DE REGISTO E IDENTIFICAÇÃO DA DIRECÇÃO DE PESSOAL E QUADROS DO COMANDO DO EXÉRCITO', '2022-12-01'),
(442, 173, 204, 120, NULL, 'OFICIAL DE REGISTO EXPEDIENTE 6ª DIRECCAO/EXE', '2022-12-01'),
(443, 88, 268, 121, NULL, 'CHEFE DO CPD REPARTICAO DE OPERACOES DA RM CABINDA', '2022-12-01'),
(444, 536, 266, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA RM CENTRO', '2022-12-01'),
(445, 13, 371, 136, NULL, 'ALUNO DO XXI CURSO DE FORMACAO DE SARGENTO DO QUADRO PERMANENTE NA EIAS/EXE', '2022-12-01'),
(446, 88, 180, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 51ª BrI DA RM NORTE', '2022-12-01'),
(447, 185, 194, 133, NULL, 'INACT. TEMP./EXE (DISPONIVEIS)', '2022-12-01'),
(448, 336, 343, 133, NULL, 'FINALISTA 8º CURSO INSTRUCAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(449, 752, 174, 113, NULL, 'CHEFE DE SECCAO DE INFORMATICA DO INSTITUTO SUPERIOR/EXE', '2022-12-01'),
(450, 88, 135, 117, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 1ª DIVISAO DE INFª RM CABINDA', '2022-12-01'),
(451, 88, 224, 120, NULL, 'CHEFE DO CPD DA 11ª BrI DA 1ª DIVISAO INFª RM CABINDA', '2022-12-01'),
(452, 218, 350, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(453, 113, 152, 126, NULL, 'AJUDANTE DO CENTRO DE PROCESSAMENTO DE DADOS CPD DPQ/EXE', '2022-12-01'),
(454, 113, 2, 126, NULL, 'AJUDANTE DO CENTRO DE PROCESSAMENTO DE DADOS CPD DPQ/EXE', '2022-12-01'),
(455, 11, 40, 128, NULL, 'SARGENTO DE SECRETARIA DO HOSPITAL MILITAR DA RM CENTRO', '2022-12-01'),
(456, 154, 224, 120, NULL, 'CHEFE DO CPD DA 11ª BrIM DA 1ª DIVISAO INFª RM CABINDA', '2022-12-01'),
(457, 282, 350, 121, NULL, 'PROFESSOR DE CRIPTOLOGIA CATEDRA DA DIRECCAO OCULTA DAS TROPAS ACADEMIA MILITAR/EXE', '2022-12-01'),
(458, 114, 353, 136, NULL, 'CONTROLADOR SEC.CONT. ACESSO PEÕES PTÃO RES BCS/UA', '2022-12-01'),
(459, 88, 266, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA RM CENTRO', '2022-12-01'),
(460, 752, 109, 121, NULL, 'OFICIAL EM EMINACTIVIDADE TEMPORARIA/EXE', '2022-12-01'),
(461, 154, 245, 120, NULL, 'CHEFE DO CPD DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(462, 60, 269, 121, NULL, 'FINALISTA DE CURSO DE ENGENHARIA DE INFORMATICA NO INSTITUTO TÉCNICO MILITAR “JOSÉ MARTI”  – REPUBLICA DE CUBA', '2022-12-01'),
(463, 60, 270, 121, NULL, 'FINALISTA DE CURSO DE ENGENHARIA DE INFORMATICA NO INSTITUTO TÉCNICO MILITAR “JOSÉ MARTI”  – REPUBLICA DE CUBA', '2022-12-01'),
(464, 268, 302, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE (ESPECIALIDADE DE TELECOMUNICACOES) NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(465, 268, 396, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(466, 268, 193, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE (ESPECIALIDADE DE TELECOMUNICACOES) NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(467, 268, 333, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE (ESPECIALIDADE DE TELECOMUNICACOES) NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(468, 268, 366, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE (ESPECIALIDADE DE TELECOMUNICACOES) NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(469, 268, 390, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE (ESPECIALIDADE DE TELECOMUNICACOES) NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(470, 268, 371, 129, NULL, 'FINALISTA DO XXI CURSO DE FORMACAO DE SARGENTOS DO QUADRO PERMANENTE NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(471, 82, 331, 45, NULL, 'SANITARIO ESCOLA PRATICA DE CONSTRUCAO/EXE', '2022-12-01'),
(472, 200, 105, 129, NULL, 'SARGENTO DE TURNO DO POSTO COMANDO DA REPARTICAO DE OPERACOES DA REGIAO MILITAR CABINDA', '2022-12-01'),
(473, 253, 385, 136, NULL, 'FINALISTA DO 10º CURSO INSTRUCAO BASICA CI SANTA EULALIA', '2022-12-01'),
(474, 741, 165, 115, NULL, 'OF. SISTEMA REDES E SERVIDORES REPART. INFORMATICA RM NORTE', '2022-12-01'),
(475, 420, 146, 117, NULL, 'CHEFE DA OFICINA SECRETA DA DIRECCAO DE PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(476, 449, 224, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 31ª BrI DA 3ª DIVISAO DE INFANTARIA DA RM LESTE', '2022-12-01'),
(477, 449, 227, 121, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE INFORMATICA DA RM NORTE', '2022-12-01'),
(478, 155, 244, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 32ª BRIGADA DE INFANTARIA 3ª DIVISAO DE INFANTARIA REGIAO MILITAR LESTE', '2022-12-01'),
(479, 449, 228, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 73ª BrIM DA RM CENTRO', '2022-12-01'),
(480, 358, 351, 121, NULL, 'OFICIAL DE HARDWARE REPARTICAO DE TECNOLOGIAS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(481, 744, 139, 113, NULL, 'CHEFE DE REPARTICAO DE INFORMATICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(482, 155, 241, 121, NULL, 'CHEFE DA SECRETARIA DA INSPECCAO GERAL DO EXERCITO', '2022-12-01'),
(483, 744, 162, 115, NULL, 'CHEFE DE REPARTICAO DE INFORMATICA DA RM SUL', '2022-12-01'),
(484, 743, 251, 121, NULL, 'ESPECIALISTA DE INFORMATICA/ISTM', '2022-12-01'),
(485, 358, 348, 121, NULL, 'OFICIAL DE TECNICA DA WEB DA REPARTICAO DE GESTAO TECNOLOGICA DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(486, 358, 339, 121, NULL, 'OFICIAL DE ADMINISTRACAO DE SISTEMAS DA REPARTICAO DE GESTAO TECNOLOGICA DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(487, 336, 342, 133, NULL, 'FINALISTA 12º CURSO INSTRUCAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(488, 111, 78, 121, NULL, 'OFICIAL CATALOGADOR SECCAO DE INFORMATICA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(489, 154, 268, 121, NULL, 'CHEFE DO CPD REPARTICAO DE OPERACOES RM CABINDA', '2022-12-01'),
(490, 449, 237, 121, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE INFORMATICA DA RM LESTE', '2022-12-01'),
(491, 449, 86, 121, NULL, 'OFICIAL PARA PROCESSAMENTO DE DADOS (PROGRAMACAO) DO CENTRO DE CLASSIFICACAO E CELECCAO DA HUILA/RM SUL', '2022-12-01'),
(492, 219, 288, 129, NULL, 'CHEFE ADJUNTO DE TRIPULACAO DA 1ª SECCAO DO 2º PELOTAO DA 1ª COMPANHIA DO 2º BATALHAO DA 20ª BRIGADA DE INFANTARIA DA RM NORTE', '2022-12-01'),
(493, 232, 39, 128, NULL, 'SGTO OPERACOES E INFORMACOES SECCAO OPERACOES RGTO ARTª TERRESTRE 1ª DIVISAO INFª RM CABINDA', '2022-12-01'),
(494, 610, 72, 120, NULL, 'CHEFE CENTRO DE PROCESSAMENTO DE DADOS UNIDADE APOIO/EXE', '2022-12-01'),
(495, 172, 106, 133, NULL, 'ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(496, 610, 26, 117, NULL, 'CHEFE SECCAO INFORMATICA 1ª DIVISAO INFª RM CABINDA', '2022-12-01'),
(497, 183, 373, 45, NULL, 'FINALISTA 18º CURSO FORMACAO SGTOS-EIAS/EXE', '2022-12-01'),
(498, 706, 55, 113, NULL, 'CHEFE DA SECCAO DE ENSINO DE MATEMATICA, INFORMATICA E ESTATISTICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(499, 233, 135, 117, NULL, 'OF. HARDWARE REPART. INFORMATICA M CENTRO', '2022-12-01'),
(500, 392, 204, 121, NULL, 'CHEFE SERVICOS GERAIS 6ª DIRECCAO/EXE', '2022-12-01'),
(501, 449, 238, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 72ª BrIM DA RM LESTE', '2022-12-01'),
(502, 754, 86, 121, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(504, 464, 30, 120, NULL, 'OFICIAL SOFTWARE SECCAO INFORMATICA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(505, 741, 178, 111, NULL, 'CHEFE REPART. INFORMATICA  RM NORTE', '2022-12-01'),
(506, 133, 201, 136, NULL, 'ATIRADOR AKM 3ª SECCAO 2º PTAO 3ª CIA 1º BTAO 72ª BrIM RM LESTE', '2022-12-01'),
(507, 233, 60, 117, NULL, 'OF. SISTEMA E SERVIDORES REPART. INFORMATICA RM CENTRO', '2022-12-01'),
(508, 743, 252, 121, NULL, 'ESPECIALISTA DE INFORMATICA/ISTM', '2022-12-01'),
(509, 743, 250, 121, NULL, 'ESPECIALISTA DE INFORMATICA/ISTM', '2022-12-01'),
(510, 754, 238, 121, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(511, 381, 275, 121, NULL, 'OFICIAL DE SISTEMA DE INFORMACAO GEOGRAFICA DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(512, 183, 388, 45, NULL, 'FINALISTA 18º CURSO FORMACAO SGTOS-EIAS/EXE', '2022-12-01'),
(513, 386, 145, 128, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(514, 185, 299, 136, NULL, 'CIA TELECOM 41ª BRIM RM CENTRO', '2022-12-01'),
(515, 420, 170, 117, NULL, 'CHEFE SECCAO INFORMATICA DA 4ª DIVISAO INFª RM CENTRO', '2022-12-01'),
(516, 554, 394, 123, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(517, 648, 115, 129, NULL, 'MONITOR PREP. FISICA SEC. ENS. EDUC. FISICA DESPORTOS ACADEMIA MILITAR/EXE', '2022-12-01'),
(518, 754, 228, 121, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(519, 741, 3, 115, NULL, 'OF. SISTEMA REDES INFORMATICA REPART. COMUNICACAO INFORMATICA 1º CORPO EXERCITO', '2022-12-01'),
(520, 754, 227, 121, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(521, 218, 340, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(522, 521, 122, 129, NULL, 'SGTO PLANEAMENTO REPARTICAO PLANEAMENTO OPERATIVO DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(523, 358, 340, 121, NULL, 'PROFESSOR DE PROGRAMACAO DE COMPUTADORES DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(524, 358, 350, 121, NULL, 'PROFESSOR DE SISTEMA DE INFORMACAO DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(525, 358, 347, 121, NULL, 'OFICIAL DE TECNICA WEB DA REPARTICAO DE GESTAO TECNOLOGICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(526, 648, 123, 121, NULL, 'PROF. SISTEMA INF. SEC. ENS. INFORMAT. ACADEMIA MILITAR/EXE', '2022-12-01'),
(527, 419, 68, 128, NULL, 'OPERADOR DE COMPUTADOR SECCAO ADMINISTRACAO DRM HUILA RM SUL', '2022-12-01'),
(528, 419, 254, 129, NULL, 'SGTO P/MANUSEAMENTO MATERIAL CLASSIFICADO DRM HUILA RM SUL', '2022-12-01'),
(529, 358, 341, 121, NULL, 'PROFESSOR DE BASE DE DADOS DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(530, 358, 346, 121, NULL, 'PROFESSOR DE REDES DE DADOS DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(531, 634, 135, 120, NULL, 'OF. EXERCICIO TREINOS SEC OPERACOES 74ª BrI RM CENTRO', '2022-12-01'),
(532, 625, 22, 131, NULL, 'AUXILIAR REPART. GESTAO DE EFECTIVOS DPQ/EXE', '2022-12-01'),
(534, 741, 159, 111, NULL, 'CHEFE CPD PRINCIPAL DIRECCAO INFORMATICA/EXE', '2022-12-01'),
(535, 449, 265, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 42ª BrI DA 2ª DIVISAO DE INFANTARIA DA RM NORTE', '2022-12-01'),
(536, 215, 288, 133, NULL, 'OP. COMPUTADOR CPD SEC. INFORMATICA 3ª DIV. INFª RM LESTE', '2022-12-01'),
(537, 148, 186, 128, NULL, 'AMANUENSE REP. PESS. QUADROS RM CENTRO', '2022-12-01'),
(538, 731, 207, 123, NULL, 'CADETE 4º ANO CURSO DE INFORMATICA NO ISTM', '2022-12-01'),
(539, 83, 109, 121, NULL, 'FINALISTAS DO 2ª CURSO DE OFICIAIS DOS ORGAOS DE EDUCACAO PATRIOTICA/FAA', '2022-12-01'),
(540, 554, 364, 123, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(541, 443, 168, 117, NULL, 'OFICIAL DE EXPLORACAO DE SISTEMAS CPD PRINCIPAL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(542, 381, 26, 117, NULL, 'OFICIAL DE SISTEMA E SERVIDORES DA REPARTICAO DE INFORMATICA DA RM SUL', '2022-12-01'),
(543, 10, 46, 126, NULL, 'CAMPO MILITAR DO GRAFANIL', '2022-12-01'),
(545, 218, 341, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(546, 218, 346, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(547, 218, 351, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(548, 624, 14, 126, NULL, 'OPERADOR COMPUTADOR CPD OFICINAIS GERAIS REPARACAO/EXE', '2022-12-01'),
(549, 218, 348, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(551, 464, 114, 121, NULL, 'CHEFE CPD 70ª BrIM RM NORTE', '2022-12-01'),
(552, 218, 339, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(553, 167, 163, 127, NULL, 'AJUD. P/MANUS. MAT. CLASSIF. EXP. ARQUIVO DIRECCAO INFORMATICA EXE', '2022-12-01'),
(554, 148, 195, 128, NULL, 'AMANUENSE REP. INFORMATICA RM LESTE', '2022-12-01'),
(555, 167, 13, 127, NULL, 'OPERADOR COMPUTADOR CPD DIR. INFORMATICA EXE', '2022-12-01'),
(556, 754, 237, 121, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(557, 167, 147, 127, NULL, 'AMANUENSE REPART. PESS. QUADROS RM CABINDA', '2022-12-01'),
(558, 218, 347, 121, NULL, ' FINALISTA DO 2º CURSO DE FORMACAO DE OFICIAIS INFª ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(559, 183, 278, 45, NULL, 'FINALISTA 18º CURSO FORMACAO SGTOS-EIAS/EXE', '2022-12-01'),
(560, 167, 186, 127, NULL, 'AMANUENSE REP. PESS. QUADROS RM CENTRO', '2022-12-01'),
(561, 405, 388, 45, NULL, 'SGTO LABORATORIO BTAO PNBQ/EXE', '2022-12-01'),
(562, 707, 50, 128, NULL, 'SARGENTO DISPONIVEL/CEXE', '2022-12-01'),
(564, 131, 367, 128, NULL, 'OPERADOR DE COMPUTADOR DRM LUANDA', '2022-12-01'),
(565, 127, 383, 136, NULL, 'AT. AKM 1ª SEC. PTAO ASSEG. CCS BTAO REP. 12ª BrI RM CABINDA', '2022-12-01'),
(566, 167, 195, 127, NULL, 'AMANUENSE REP. INFORMATICA RM LESTE', '2022-12-01'),
(567, 167, 172, 127, NULL, 'AUXILIAR REPART. INFORMATICA RM CABINDA', '2022-12-01'),
(568, 106, 239, 45, NULL, 'FINALISTA 16º CURSO FORMACAO SARGENTOS-EIAS/EXE', '2022-12-01'),
(569, 7, 37, 120, NULL, 'OF. REGISTO SECCAO ADMINISTRATIVA DRM RM  SUL', '2022-12-01'),
(570, 385, 155, 117, NULL, 'CHEFE CDP DIRECCAO INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(571, 648, 57, 129, NULL, 'CMDTE SEC. PDI CCS LUANDA/EXE', '2022-12-01'),
(572, 634, 36, 120, NULL, 'OF. PROCESSAMENTO DADOS SEC. INFORMATICA 41ª BrI 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(573, 183, 280, 45, NULL, 'FINALISTA 18º CURSO FORMACAO SGTOS-EIAS/EXE', '2022-12-01'),
(574, 550, 66, 128, NULL, 'OPERADOR RECEPCAO EXPEDICAO CPD DIRECCAO  ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(575, 32, 163, 128, NULL, 'AJUDANTE P/MANUSEAMENTO MATERIAS CLASSIFICADA EXPEDIENTE ARQUIVO DIRECCAO INFORMATICA/EXE', '2022-12-01'),
(577, 165, 82, 129, NULL, 'MONITOR TECNICA BLINDADA EIAS/EXERCITO', '2022-12-01'),
(578, 700, 77, 121, NULL, 'PROFESSOR DE TACTICA DO CENTRO DE INSTRUCAO DA 101ªBRIGADA DE TANQUES/EMGFAA', '2022-12-01'),
(579, 390, 4, 128, NULL, 'OPERADOR CPD DIR. INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(580, 390, 212, 129, NULL, 'OPERADORA CPD DIR. INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(581, 587, 141, 113, NULL, 'CHEFE REPART. ANALISE DESENVOL. SOFYWARE DIRECCAO INFORMATICA EXE', '2022-12-01'),
(582, 526, 381, 128, NULL, 'SGTO DE COMANDO DA CIA DE FORTIFICACOES DO BATALHAO DE ENGENHARIA E SAPADORES DA REGIAO MILITAR SUL', '2022-12-01'),
(583, 224, 315, 117, NULL, 'PROFESSOR CHEFE DE INFORMATICA DO CENTRO DE LINGUAS DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(585, 196, 368, 136, NULL, 'AMANUENSE DESENHADOR SEC. PRECOM 22ª Brl 2ª DIV. RM NORTE', '2022-12-01'),
(586, 546, 145, 128, NULL, 'MECANICO AUTO DO BATALHAO DE MANUTENCAO DE TECNICA AUTO DO REGIMENTO DE MANUTENCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(587, 32, 181, 129, NULL, 'AMANUENSE REP. INFORMATICA RM SUL', '2022-12-01'),
(589, 537, 171, 117, NULL, 'OFICIAL OPERATIVO DO POSTO COMANDO DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(590, 537, 128, 120, NULL, 'COMANDANTE DE PELOTAO DE LOGISTICA DO GRUPO DE ARTILHARIA DE CAMPANHA DA 71ª BrIM DA REGIAO MILITAR NORTE', '2022-12-01'),
(591, 551, 378, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO REGIMENTO DE MANUTENCAO ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(592, 546, 66, 127, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE ARMAMENTO E TECNICA DA REGIAO MILITAR SUL', '2022-12-01'),
(593, 522, 73, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO SERVIDAO MILITAR DO EXERCITO/MARIA TERESA', '2022-12-01'),
(594, 522, 204, 120, NULL, 'CHEFE DA SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(595, 526, 81, 128, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 60ª BrIM DA 6ª DIVISAO INFª MOTORIZADA DA REGIAO MILITAR SUL', '2022-12-01'),
(596, 96, 382, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0004/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(597, 255, 303, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(598, 255, 335, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(599, 255, 32, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(600, 224, 124, 117, NULL, 'OFICIAL DE SISTEMAS E SERVIDORES DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(601, 255, 179, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(602, 255, 218, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(603, 96, 259, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0004/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(604, 96, 248, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0004/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(605, 96, 260, 120, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0004/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(606, 96, 369, 121, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0004/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(607, 117, 280, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(608, 117, 388, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(609, 224, 375, 117, NULL, 'OFICIAL DE HARDWARE DA SECCAO DE INFORMATICA DA 3ª DIVISAO DE INFANTARIA DA REGIAO MILITAR LESTE', '2022-12-01'),
(610, 224, 394, 120, NULL, 'OFICIAL DE CONTRA PROPAGANDA DA REPARTICAO DE MOBILIZACAO DA DIRECCAO DE GUERRA PSICOLOGICA DO EXERCITO', '2022-12-01'),
(611, 224, 237, 117, NULL, 'OFICIAL TECNICO DE SISTEMAS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE CONTRA INTELIGENCIA MILITAR/EXE', '2022-12-01'),
(612, 224, 267, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO DEPOSITO DE MATERIAL DE GUERRA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(613, 224, 316, 117, NULL, 'PROFESSOR DE INFORMATICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(614, 224, 117, 117, NULL, 'OFICIAL PARA PROCESSAMENTO DE DADOS (PROGRAMADOR) DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DE MALANJE', '2022-12-01'),
(615, 224, 317, 117, NULL, 'PROFESSOR DE INFORMATICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR/EXE', '2022-12-01'),
(616, 224, 238, 117, NULL, 'OFICIAL PARA HARDWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(617, 607, 164, 120, NULL, 'PROF. MATERIAS GERAIS GRUPO ESTUDO MATERIAS GERAIS EFCA EXE NAMIBE', '2022-12-01'),
(618, 229, 220, 129, NULL, 'SGTO OPERACOES 2º GPO BUK-M1 REGTO DAA/EXE', '2022-12-01'),
(619, 646, 3, 117, NULL, 'OFICIAL DE SISTEMAS E REDES INFORMATICAS REPARTICAO COMUNICACAO E INFORMATICA CORPO EXERCITO NORTE', '2022-12-01'),
(620, 224, 378, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA REGIAO MILITAR LESTE', '2022-12-01'),
(621, 224, 153, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA UNIDADE DE APOIO/EXE', '2022-12-01'),
(622, 224, 13, 120, NULL, 'OFICIAL DE REDES E PROGRAMACAO DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(623, 224, 364, 120, NULL, 'PROGRAMADOR DA REPARTICAO DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(626, 224, 226, 117, NULL, 'TECNOLOGICO E DESIGN DA REPARTICAO DE GESTAO DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(627, 224, 233, 117, NULL, 'OFICIAL DE SOFTWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR SUL', '2022-12-01'),
(628, 224, 228, 117, NULL, 'OFICIAL DE TECNICO DE REDES DA SECCAO DE INFORMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(629, 183, 281, 45, NULL, 'FINALISTA 18º CURSO FORMACAO SGTOS-EIAS/EXE', '2022-12-01'),
(630, 196, 161, 129, NULL, 'OP.COMPUTADOR CPD REP. LOGISTICA  RM LESTE', '2022-12-01'),
(631, 196, 70, 129, NULL, 'ADJUNTO CMDO GDAA RM LESTE', '2022-12-01'),
(632, 196, 103, 129, NULL, 'SARGENTO PESSOAL E QUADROS GAC 52ª BrI RM NORTE', '2022-12-01'),
(633, 213, 272, 45, NULL, 'FINALISTA 16º CURSO FORMACAO SARGENTOS-EIAS/EXE', '2022-12-01'),
(634, 196, 96, 131, NULL, 'AMANUENSE SECRETARIA GERAL CMDO 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(635, 24, 254, 121, NULL, 'OFICIAL DE EDUCACAO PATRIOTICA DA 1ª COMPANHIA DO 2º  BATALHAO DE RECRUTAS DO CENTRO DE INSTRUCAO DE TROPAS DO EXERCITO/SANTA EULALIA', '2022-12-01'),
(636, 117, 197, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(637, 117, 289, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(639, 117, 294, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(640, 542, 382, 120, NULL, 'OFICIAL DE SISTEMA E SERVIDOR DA SECCAO DE INFORMATICA DA 4ª DIVISAO DE INFANTARIA RM CENTRO', '2022-12-01'),
(641, 117, 331, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(642, 659, 61, 115, NULL, 'OFICIAL DE PLANEAMENTO E SISTEMA DE INFORMACAO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR SUL', '2022-12-01'),
(643, 24, 121, 121, NULL, 'OFICIAL DE ANALISE DE FUNCOES DA REPARTICAO DE ESTUDO E PLANEAMENTO DA DIRECCAO DE PESSOAL E QUADROS DO EXERCITO', '2022-12-01'),
(644, 24, 179, 121, NULL, 'OFICIAL DE EDUCACAO PATRIOTICA DA 1ª COMPANHIA DO BATALHAO DE PROTECCAO NUCLEAR BIOLOGICA E QUIMICA/EXE', '2022-12-01'),
(645, 24, 335, 121, NULL, 'OFICIAL DE EDUCACAO PATRIOTICA DA COMPANHIA DE COMANDO DO BATALHAO DE COMANDO E SERVICOS DO INSTITUTO SUPERIOR/EXE', '2022-12-01'),
(646, 24, 218, 121, NULL, 'OFICIAL DE EDUCACAO PATRIOTICA DA COMPANHIA DE MANUTENCAO TECNICA BLINDADA DO BATALHAO DE MANUTENCAO DE ARMAMENTO TECNICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(647, 243, 145, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(648, 24, 198, 121, NULL, 'OFICIAL DE RELACOES PUBLICAS DA REPARTICAO DE EDUCACAO PATRIOTICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(649, 24, 303, 121, NULL, 'OFICIAL DE EDUCACAO PATRIOTICA DA COMPANHIA DE SERVICOS DA UNIDADE DE APOIO DA REGIAO MILITAR CABINDA', '2022-12-01'),
(650, 659, 60, 115, NULL, '1º OFICIAL DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(651, 659, 160, 115, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(652, 659, 58, 115, NULL, 'PROFESSOR DE INFORMATICA DA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(653, 659, 178, 111, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE', '2022-12-01'),
(655, 243, 33, 126, NULL, 'OPERADOR DE TURNO CENTRO DE PROCESSAMENTO DE DADOS REPARTICAO DE OPERACOES DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(656, 374, 138, 115, NULL, 'OFICIAL DE PESSOAL E QUADROS DA SECCAO DE PESSOAL E QUADROS DA 75ª BRIGADA DE INFANTARIA MOTORIZADA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(657, 374, 171, 115, NULL, 'OFICIAL OPERATIVO DO POSTO COMANDO DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(658, 243, 81, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 60ª BRIGADA DE INFANTARIA MOTORIZADA DA 6ª DIVISAO DE INFANTARIA MOTORIZADA DA REGIAO MILITAR SUL', '2022-12-01'),
(659, 243, 91, 127, NULL, 'AMANUENSE DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(660, 243, 217, 128, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(661, 196, 153, 129, NULL, 'OPERADOR DE COMPUTADOR CPD DESTACAMENTO APOIO/CEXE', '2022-12-01'),
(662, 325, 386, 120, NULL, 'PROFESSOR SEC. ESTUDOS INFORMATICOS CENTRO LINGUA INFORMATICA CMDO EXE', '2022-12-01'),
(663, 236, 182, 129, NULL, 'SARGENTO DA SECRETARIA DO COMANDO DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(664, 8, 37, 120, NULL, 'OF. REGISTO SECCAO ADMINISTRATIVA DRM RM  SUL', '2022-12-01'),
(665, 196, 95, 131, NULL, 'CMDTE SEC. CIA CMDO UNIDADE PRISAO PREVENTIVA BENGUELA RM CENTRO', '2022-12-01'),
(667, 196, 83, 129, NULL, 'AUXILIAR  ADMINISTRATIVO DRM HUILA RM SUL', '2022-12-01'),
(668, 196, 81, 129, NULL, 'CHEFE SEC.TRANSPORTES RGTO DAA 6ª DIV. INFª  RM SUL', '2022-12-01'),
(669, 196, 94, 131, NULL, 'ESCRITURARIA SEC. OPERACOES DESTACAMENTO APOIO RM CABINDA', '2022-12-01'),
(670, 32, 188, 136, NULL, 'OP COMPUTADOR CENTRO PROCESSAMENTO DADOS CSC RM SUL', '2022-12-01'),
(671, 32, 92, 131, NULL, 'OPERADOR COMPUTADOR CPD REPARTICAO PESSOAL QUADROS RM CABINDA', '2022-12-01'),
(672, 548, 110, 129, NULL, 'MONITOR ARMTO ARTª GRUPO ESTUDO ARMTO ESCOLA ARMTO TECNICA E ELECTROMECANICA/EXE', '2022-12-01'),
(673, 247, 204, 136, NULL, NULL, '2022-12-01'),
(674, 609, 115, 129, NULL, 'MONITOR PREPARACAO FISICA SECCAO ENSINO PREPARACAO FISICA ACADEMIA MILITAR EXERCITO', '2022-12-01'),
(675, 725, 77, 120, NULL, 'PROFESSOR DE TACTICA DO CENTRO DE INSTRUCAO DA 101ª BRIGADA DE TANQUES/EMG', '2022-12-01'),
(676, 196, 122, 129, NULL, 'AUX. TURNO ROP RM LESTE', '2022-12-01'),
(677, 247, 22, 131, NULL, NULL, '2022-12-01'),
(678, 103, 143, 117, NULL, 'CHEFE DO CPD REPARTICAO OPERACOES RM CENTRO', '2022-12-01'),
(679, 230, 118, 128, NULL, 'DESENHADOR REPARTICAO PREPARACAO OPERATIVA DIRECCAO OPERACOES/EXE', '2022-12-01'),
(680, 192, 69, 128, NULL, 'SGTO PESSOAL SEC. PESSOAL E QUADROS 2ª BRIM/2ª RM', '2022-12-01'),
(681, 166, 49, 128, NULL, 'AUXILIAR HARDWARE REPª ASSEG. TECNICO DIR. INFORMATICA EXE', '2022-12-01'),
(682, 147, 232, 121, NULL, 'CHEFE 4º GPO INT. 3ª CIA BTAO INT. MILITAR OPERATIVA/EXE', '2022-12-01'),
(683, 147, 150, 117, NULL, 'PROFESSOR INFORMATICA CENTRO LINGUAIS DIR. ENSINO EXE', '2022-12-01'),
(684, 147, 235, 121, NULL, 'CMDTE PTAO TANQUES BTAO TANQUES 101ª BRIGADA TANQUES/EXE', '2022-12-01'),
(685, 166, 108, 128, NULL, 'AMANUENSE DIR. ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(686, 230, 153, 129, NULL, 'OPERADOR COMPUTADOR CPD UNIDADE APOIO/EXE', '2022-12-01'),
(688, 147, 48, 117, NULL, 'OF. PESS. QUADROS 2º BTAO INFª 40ª BrI 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(689, 694, 133, 120, NULL, 'OFICIAL SECCAO PROCESSAMENTO DADOS REPARTICAO INFORMATICA DIRECCAO PESSOAL QUADROS/EME', '2022-12-01'),
(690, 147, 234, 121, NULL, 'CMDTE PTAO TRANSPORTES CURSOS AQUATICO BTAO ENGª E SAPADORES RM SUL', '2022-12-01'),
(691, 726, 50, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE IDENTIFICACAO DA REPARTICAO DE REGISTO CENTRAL DA DIRECCAO PRINCIPAL DE PESSOAL E QUADROS EMG', '2022-12-01'),
(692, 725, 174, 113, NULL, 'OF. PLANEAM. E SISTEMA INFORM. REP. INFORMATICA RM CABINDA', '2022-12-01'),
(693, 166, 152, 126, NULL, 'OPERADOR COMPUTADOR CPD/DPQ/EXE', '2022-12-01'),
(694, 147, 34, 117, NULL, 'OF. TECNICO HARDWARE SEC. INFORMATICA DIR. PRECOM EXE', '2022-12-01'),
(696, 193, 73, 120, NULL, 'CMDTE PTAO DEFESA IMEDIATA 48º RI ZM DUNDO 10ª RM', '2022-12-01'),
(697, 146, 105, 131, NULL, 'AT. AKM', '2022-12-01'),
(698, 666, 109, 129, NULL, NULL, '2022-12-01'),
(699, 74, 111, 136, NULL, 'AT. AKM', '2022-12-01'),
(700, 74, 113, 136, NULL, 'AT. AKM', '2022-12-01'),
(701, 72, 165, 117, NULL, 'CHEFE SECRETARIA GERAL DESTACAMENTO APOIO 8ª RM', '2022-12-01'),
(702, 690, 23, 120, NULL, 'PROGRAMADOR REP.PESSOAL QUADROS GML/EMG', '2022-12-01'),
(703, 101, 81, 136, NULL, NULL, '2022-12-01'),
(704, 310, 68, 129, NULL, 'CHEFE DE PEÇA ARTª ANTI-AEREA RM SUL', '2022-12-01'),
(705, 310, 86, 129, NULL, 'CMDTE SEC. INFANTARIA RM SUL', '2022-12-01'),
(706, 74, 106, 136, NULL, 'AT. AKM', '2022-12-01'),
(707, 76, 116, 129, NULL, NULL, '2022-12-01'),
(708, 310, 117, 129, NULL, 'CMDTE SEC. RECTO RM SUL', '2022-12-01'),
(709, 164, 27, 121, NULL, 'OFICIAL INFORMATICA SECCAO INFORMATICA 5ª RM', '2022-12-01'),
(710, 164, 58, 120, NULL, 'OFICIAL HARDWARE SECCAO INFORMATICA 9ª RM', '2022-12-01'),
(711, 164, 177, 120, NULL, 'OFICIAL APOIO UTILIZADOR SECCAO ASSEGURAMENTO TECNICO REPART. ì\nINFORMATICA EME', '2022-12-01'),
(712, 72, 76, 121, NULL, 'CHEFE SECCAO EXPEDIENTE ARQUIVO GAB. PLANAEAMENTO ORGANIZ. EME', '2022-12-01'),
(713, 146, 104, 131, NULL, 'AT. AKM', '2022-12-01'),
(714, 666, 108, 129, NULL, NULL, '2022-12-01'),
(715, 714, 131, 120, NULL, 'TECNICO SISTEMAS SECCAO ASSEGURAMENTO TECNICO DIRECCAO INFORMATICA/EMG', '2022-12-01'),
(716, 74, 105, 136, NULL, 'AT. AKM', '2022-12-01'),
(717, 666, 381, 129, NULL, NULL, '2022-12-01'),
(718, 194, 123, 123, NULL, NULL, '2022-12-01'),
(719, 208, 34, 120, NULL, 'OFICIAL ORGANIZACAO PLANIF. SECCAO INFORMATICA 8ª RM', '2022-12-01'),
(720, 120, 172, 128, NULL, 'AUXILIAR ARMA CATEDRA TOPOGRAFICA REPART. OPERACOES FM CABINDA', '2022-12-01'),
(721, 194, 114, 123, NULL, NULL, '2022-12-01'),
(722, 260, 166, 120, NULL, 'OF. ANALISE POSTO CMDO DIR. OPERACOES EME', '2022-12-01'),
(723, 121, 27, 121, NULL, 'OFICIAL PESSOAL QUADROS 5ª RM', '2022-12-01'),
(724, 478, 166, 128, NULL, 'SARGENTO OPERACOES 1º BTAO 105º RI FM-NORTE     \r\n', '2022-12-01'),
(725, 597, 141, 117, NULL, 'CHEFE ADJUNTO SECCAO INSTRUCAO REGMTO TRANSMISSOES/EME', '2022-12-01'),
(726, 335, 141, 117, NULL, 'CH. SEC. FORMACAO DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL ì\nDO ESTADO MAIOR COORDENADOR', '2022-12-01'),
(727, 409, 157, 136, NULL, 'ATIRADOR 3ª CIA BTAO BMP-1\r\n', '2022-12-01'),
(728, 395, 166, 121, NULL, 'OFICIAL P/ANALISE SECCAO ANALISE DIRECCAO OPERACOES EME', '2022-12-01'),
(729, 1, 141, 120, NULL, 'CHEFE ADJUNTO EDUCACAO FISICA REGIMENTO TRMS', '2022-12-01'),
(730, 598, 166, 121, NULL, 'OFICIAL SEC. OPERACOES ZM CUANGO 9ª RM', '2022-12-01'),
(732, 643, 141, 117, NULL, 'CHEFE SEC. ESTUDOS PLANEAMENTO REP. INFORMATICA EMC', '2022-12-01'),
(733, 697, 141, 115, NULL, 'CH. SEC. ESTUDOS PLANEAM. REPART. INFORMATICA EME', '2022-12-01'),
(734, 348, 141, 115, NULL, 'CHEFE SECCAO ORGANIZ. PLANEAM. REPART. INFORMATICA EME\r\n', '2022-12-01'),
(736, 509, 44, 121, NULL, 'OF. INFORMATICA REPART. PESSOAL 9ª RM', '2022-12-01'),
(737, 260, 44, 120, NULL, 'OFICIAL INFORMATICA REPART. PESSOAL 9ª RM', '2022-12-01'),
(740, 617, 23, 128, NULL, 'AMANUENSE SEC. FINANCAS SECT. MILITAR CACULAMA 9ª RM', '2022-12-01'),
(741, 48, 23, 121, NULL, 'OFICIAL INFORMATICA E IDENTIFICACAO REPART. PESSOAL 9ª ì\nRM', '2022-12-01'),
(742, 260, 23, 120, NULL, 'CH. CPD REPART. PESS. QUADROS 9ª RM', '2022-12-01'),
(743, 334, 143, 128, NULL, 'SARGENTO PTAO RADIO 37º RIM FM-LESTE', '2022-12-01'),
(744, 593, 143, 121, NULL, 'OFICIAL MANUTENCAO SISTEMA SEC. INFORMATICA RM CENTRO', '2022-12-01'),
(745, 560, 143, 120, NULL, 'OFICIAL MANUTENCAO SISTEMA SECCAO INFORMATICA RM CENTRO', '2022-12-01'),
(746, 468, 164, 129, NULL, 'CHEFE SEC. EXPEDIENTE ARQUIVO CICA', '2022-12-01'),
(747, 488, 164, 123, NULL, 'OFICIAL PESSOAL BTAO COP/BENGUELA RM CENTRO', '2022-12-01'),
(748, 582, 164, 123, NULL, 'CHEFE SECRETARIA CICA NAMIBE', '2022-12-01'),
(749, 483, 164, 121, NULL, 'CHEFE SECRETARIA CICA NAMIBE', '2022-12-01'),
(750, 440, 164, 120, NULL, 'CHEFE SECRETARIA GERAL CICA NAMIBE\r\n', '2022-12-01'),
(751, 399, 266, 123, NULL, 'FINALISTA DE CURSO DE FORMACAO DE OFICIAIS DE TELECOMUNICACOES E SISTEMA DE INFORMATICA NA ACADEMIA MILITAR DA REPUBLICA DA SERVIA', '2022-12-01'),
(752, 627, 34, 128, NULL, 'STO SECRETARIA SECTOR MILITAR ESPECIAL KAMBAMBE RM NORTE', '2022-12-01'),
(753, 495, 223, 120, NULL, 'OFICIAL DE HARDEWER E REDE DA DIRECCAO DE ARMTO E TECNICA/EXE', '2022-12-01'),
(754, 505, 4, 133, NULL, 'CMDTE SECCAO TRANSPORTES', '2022-12-01'),
(755, 507, 4, 133, NULL, 'CONDUTOR DIRECCAO INFORMACOES CMDO OPERACIONAL                                                                                                                 ', '2022-12-01'),
(756, 289, 4, 129, NULL, 'AUXILIAR p/REGISTO ESTATISTICA REPART. PLANEAMENTO DIREC. ì\nINFORMACOES/EME', '2022-12-01'),
(757, 423, 13, 128, NULL, 'AUXILIAR SEC.ASS. GERAIS REP.OPERACOES', '2022-12-01'),
(758, 99, 3, 120, NULL, 'CHEFE SECCAO INFORMATICA 8ª RM', '2022-12-01'),
(759, 492, 177, 120, NULL, 'CH. SECRETARIA COP LESTE RM LESTE', '2022-12-01'),
(760, 260, 155, 117, NULL, 'CMDTE CIA MANUTENCAO BTAO APOIO SVC 5ª RM', '2022-12-01'),
(761, 162, 155, 117, NULL, 'CH. SEC. LOGISTICA CSC LUBANGO 5ª RM\r\n', '2022-12-01'),
(762, 424, 177, 128, NULL, 'AUXILIAR SECCAO GUARDA OPERATIVA REPART. OPERACOES DIR. OPERACOES ì\nCMDO OPERACIONAL', '2022-12-01'),
(763, 657, 177, 128, NULL, 'CHEFE SECRETARIA COP/LESTE RM LESTE', '2022-12-01'),
(764, 479, 169, 128, NULL, 'OPERAD. COMP. SEC. ANALISE INF. REPART. OP. DIR. OPERACOES/COE', '2022-12-01'),
(765, 289, 169, 128, NULL, 'DESENHADOR SEC. PREPARACAO OPERATIVA REPART. PREPARACAO OPERATIVA ì\nDIREC. OPERACOES/EME', '2022-12-01'),
(766, 468, 180, 126, NULL, 'STO LOGISTICA REGTO TRANSPORTES/EME', '2022-12-01'),
(767, 121, 180, 121, NULL, 'OF. LOG. SEC. LOGISTICA REGTO TRANSPORTES EME', '2022-12-01'),
(768, 227, 13, 128, NULL, 'OPERADOR COMPUTADOR DIREC.ARMA TROPAS BLINDADAS/EME', '2022-12-01'),
(769, 479, 13, 128, NULL, 'OPERADOR COMPUTADOR CPD  REPART. OPERACOES/GML', '2022-12-01'),
(770, 163, 180, 120, NULL, 'OFIC. LOGISTICA SEC LOGISTICA REGMTO TRANSPORTES EME', '2022-12-01'),
(771, 468, 150, 128, NULL, 'AUXILIAR SECCAO CARREIRA TIRO REGTO TRANSMISSOES/EME', '2022-12-01'),
(772, 652, 177, 121, NULL, 'CHEFE SECRETARIA COP LESTE RM LESTE', '2022-12-01'),
(773, 556, 177, 128, NULL, 'OP.COMPUTADOR SALA OPERATIVA/EME', '2022-12-01'),
(774, 289, 13, 128, NULL, 'CHEFE SEC. EXPED. ARQUIVO DIREC. ARMA TROPAS BLINDADAS/EME', '2022-12-01'),
(775, 71, 131, 123, NULL, 'CMDTE PTAO INFANTARIA', '2022-12-01'),
(776, 613, 42, 117, NULL, 'CMDTE CIA INFª 5ª RM', '2022-12-01'),
(777, 656, 386, 123, NULL, 'CMDTE PTAO INFANTARIA 32ª BRIM', '2022-12-01'),
(778, 288, 386, 123, NULL, 'CMDTE 2º PTAO 2ª CIA 2º BTAO 32ª BRIM\r\n', '2022-12-01'),
(779, 461, 386, 121, NULL, 'CH. SEC. INFORMATICA EPSM EME', '2022-12-01'),
(780, 3, 171, 131, NULL, 'ESCRITURARIO BTAO INSTRUÇAO REGTO TRANSMISSOES/EME\r\n\r\n- EFECTIVIDADE APARTIR DE JUNHO/94', '2022-12-01'),
(781, 375, 171, 123, NULL, 'PROFESSOR INFORMATICA GRUPO ESTUDO MATERIAS GERAIS ESCOLA PRATICA ì\nTRANSMISSOES EMEM', '2022-12-01'),
(782, 4, 84, 131, NULL, 'CHEFE ESQUADRA SECCAO RECTO 11º RI 3ª RM', '2022-12-01'),
(783, 440, 386, 120, NULL, 'CH. SEC. INFORMATICA EPSM EME', '2022-12-01'),
(784, 162, 386, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS 5ª RM', '2022-12-01'),
(785, 260, 171, 120, NULL, 'PROGRAMADOR COMP. CPD DIR. LOGIST. EME', '2022-12-01'),
(786, 4, 82, 129, NULL, 'MONITOR ARMAMENTO TECNICA EIAS', '2022-12-01'),
(787, 440, 171, 121, NULL, 'PROGRAMADOR COMP. CPD DIR. LOGIST. EME', '2022-12-01'),
(788, 569, 32, 129, NULL, 'ESCRITURARIO SECRETARIA BTAO SVC PESSOAL/EME', '2022-12-01'),
(789, 608, 32, 129, NULL, 'AMANUENSE SECRETARIA ARQUIVO BTAO SVC PESSOAL/EME', '2022-12-01'),
(790, 289, 32, 129, NULL, 'OPERADOR COMPUTADOR CPD DIREC. PESSOAL QUADROS/EME', '2022-12-01'),
(792, 569, 19, 128, NULL, 'AMANUENSE GAB. VICE-CEME', '2022-12-01'),
(793, 617, 19, 129, NULL, 'AMANUENSE GAB. VICE-CEME', '2022-12-01'),
(794, 102, 105, 131, NULL, 'CH. ESQ. 2ª SEC. 1º PTAO 1ª CIA BOAP 1ª BRIM 8ª RM', '2022-12-01'),
(795, 622, 146, 126, NULL, 'AMANUENSE SEC. JUSTIÇA DISCIPLINA DEPOSITO MATERIAL Trx REGTO ì\nTRANSMISSOES/EME', '2022-12-01'),
(796, 348, 6, 120, NULL, 'OF. ANALISE SISTEMAS SEC. ANALISE DESENVOL. SISTEMAS REPART. ì\nINFORMATICA/EME', '2022-12-01'),
(797, 596, 142, 136, NULL, 'RADIO TELEFONISTA PTAO CENTRAL TRANSMISSOES 1ª SECCAO 1ª CIA ì\nREGIMENTO TRANSMISSOES E INFORMATICA/EME                                             \r\n', '2022-12-01'),
(798, 595, 142, 136, NULL, 'RADIO TELEFONISTA PTAO CENTRAL TRANSMISSOES 1& CIA REGIMENTO \r\nTRANSMISSOES INFORMATICA/EME', '2022-12-01'),
(799, 69, 52, 136, NULL, 'ELESTRECISTA AUTO 59ª BRIGADA ', '2022-12-01'),
(800, 144, 6, 131, NULL, 'OPERADOR COMPUTADOR SECCAO MOBILIZACAO RECRUTAMENTO REPARTICAO ì\nPESSOAL ESTADO MAIOR COORDENADOR   ', '2022-12-01'),
(801, 75, 111, 136, NULL, 'CONDUTOR MECANICO 1ª SEC. 3º PTAO 1ª CIA 2º BOAP 1ª BRIM 8ª RM', '2022-12-01'),
(802, 5, 111, 136, NULL, NULL, '2022-12-01'),
(803, 461, 6, 121, NULL, 'OFICIAL SISTEMA SEC. SUPORTE REPART. INFORMATICA EME', '2022-12-01'),
(804, 593, 6, 123, NULL, 'OFICIAL SISTEMA SEC. SUPORTE SISTEMA REPART. SVC INFORMATICA EMC\r\n', '2022-12-01'),
(805, 440, 6, 120, NULL, 'OFICIAL SISTEMA REPART. INFORMATICA EME', '2022-12-01'),
(806, 440, 146, 120, NULL, 'CH. ADJ. SEC. PESSOAL ESC. PRAT. TELEC. EME', '2022-12-01'),
(807, 176, 146, 126, NULL, 'CHEFE SECCAO EXPED. E ARQUIVO REPARTICAO OPERACOES/EMC', '2022-12-01'),
(808, 375, 146, 121, NULL, 'CHEFE SECCAO INFORMATICA DIRECCAO INSTRUCAO ESCOLA PRATICA ì\nTRANSMISSOES EME', '2022-12-01'),
(809, 102, 113, 136, NULL, 'CONDUTOR CMDO EM 5ª BRIM 6ª RM', '2022-12-01'),
(810, 52, 58, 120, NULL, 'PROGRAMADOR CPD UNIDADE DE APOIO EME', '2022-12-01'),
(811, 102, 106, 136, NULL, 'AT. AKM 3ª SEC. 1º PTAO 3ª CIA 2º BOAP 1ª BRIM 8ª RM', '2022-12-01'),
(812, 713, 128, 120, NULL, 'OFICIAL SECRETARIOA GERAL ESCOLA ESPECIALISTAS MENORES DE LOGISTICA EMGFAA', '2022-12-01'),
(813, 102, 104, 131, NULL, 'CH. ESQ. 2ª SEC. 1º PTAO 2ª CIA 3º BTAO 11º RI 3ª RM', '2022-12-01'),
(814, 608, 15, 128, NULL, 'AMANUENSE SEC. INFORMATICA 10ª RM', '2022-12-01'),
(815, 428, 383, 136, NULL, 'AGENTE PM PTAO ESCOLTA CMDO/EXE', '2022-12-01'),
(816, 438, 124, 121, NULL, 'CONTABILISTA REP. ADMINISTRACAO E FIANCAS RM NORTE', '2022-12-01'),
(817, 506, 15, 133, NULL, 'CHEFE CARRO COMBATE BMP-2 COP/HUAMBO FM-CENTRO', '2022-12-01'),
(818, 675, 15, 129, NULL, 'OPERADOR COMPUTADOR SEC. INFORMATICA RM LESTE', '2022-12-01'),
(819, 102, 108, 136, NULL, 'AUXILIAR SEC. ALIM. PTAO 2º BOAT 1ª BRIM 8ª RM', '2022-12-01'),
(820, 724, 367, 136, NULL, 'ATIRADOR UGP\r\n(COM EFECTIVIDADE APARTIR JULHO/2001)', '2022-12-01'),
(821, 693, 131, 120, NULL, 'TECNICO SISTEMAS DIRECCAO INFORMATICA/EMG', '2022-12-01'),
(823, 273, 173, 126, NULL, 'AUXILIAR SEC. ASSEG. REPART. INFORMATICA/EME', '2022-12-01'),
(829, 613, 41, 120, NULL, 'OFICIAL PESSOAL BTAO 2ª RM', '2022-12-01'),
(830, 48, 67, 117, NULL, 'CHEFE SECCAO INFORMATICA 3ª RM', '2022-12-01'),
(831, 669, 168, 121, NULL, 'OFICIAL SEC. PESSOAL COP MALANGE RM NORTE', '2022-12-01'),
(832, 260, 168, 120, NULL, 'PROGRAMADOR REPARTICAO INFORMATICA EME  \r\n', '2022-12-01'),
(833, 159, 168, 121, NULL, 'CONTABILISTA REPART. FINANCAS DIVISAO TROPAS ESPECIAIS EMG', '2022-12-01'),
(834, 649, 168, 121, NULL, 'OFICIAL COLOCACOES TRANSF. CARREIRA REPART. PESSOAL COMANDO DE TROPAS ESPECIAIS EMG\r\n', '2022-12-01'),
(835, 677, 168, 121, NULL, 'ENTREGUE AO COPIE', '2022-12-01'),
(836, 71, 79, 123, NULL, 'CMDTE PTAO INFANTARIA', '2022-12-01'),
(837, 144, 5, 136, NULL, 'AMANUENSE SEC. EXPEDIENTE ARQUIVO DIRECCAO OPERACOES CMDO OPERACIONAL/EME ì\n  ', '2022-12-01'),
(838, 28, 5, 128, NULL, 'AMANUENSE SEC. EXPEDIENTE ARQUIVO DIRECCAO OPERACOES CMDO OPERACIONAL/EME ì\n  ', '2022-12-01'),
(839, 289, 5, 128, NULL, 'AUXILIAR SEC. LIGACAO REPART. LIGACAO COOPERACAO DIREC. ì\nOPERACOES/EME', '2022-12-01'),
(840, 653, 62, 123, NULL, 'CMDTE PTAO RECTO', '2022-12-01'),
(841, 665, 62, 123, NULL, 'OFICIAL INFORMACOES 8. REGIAO MILITAR', '2022-12-01'),
(842, 485, 62, 121, NULL, 'OFICIAL PESSOAL BTAO RESERVA 8ª RM', '2022-12-01'),
(843, 260, 62, 120, NULL, 'OF. PESSOAL BTAO DEFICIENTES FISICOS 7ª RM', '2022-12-01'),
(844, 226, 70, 136, NULL, 'RADIO TELEF. CIA TELECOM 9ª RM', '2022-12-01'),
(845, 47, 148, 126, NULL, 'CHEFE 1ª BRIGADA 1º DESTACAMENTO UNIDADE PENITECIARIA FM-LESTE\r\n', '2022-12-01'),
(846, 160, 158, 120, NULL, 'OF. OPERATIVO REPART. INF. FM CABINDA\r\n', '2022-12-01'),
(847, 290, 134, 128, NULL, 'OPERADOR COMPUTADOR CPD DIREC. PESSOAL QUADROS/EME', '2022-12-01'),
(848, 560, 58, 120, NULL, 'INSTRUTOR SEC. FORMACAO REPART. INFORMATICA EME', '2022-12-01'),
(849, 348, 58, 120, NULL, 'OFICIAL SEGURANCA AUDITORIA REPART. INFORMATICA EME\r\n', '2022-12-01'),
(850, 289, 134, 129, NULL, 'OPERADOR COMPUTADOR CPD DIREC. PESSOAL QUADROS/EME', '2022-12-01'),
(852, 508, 133, 133, NULL, 'ENTREGUE A DIVISAO DE PESSOAL EMG', '2022-12-01'),
(853, 701, 133, 121, NULL, NULL, '2022-12-01'),
(854, 708, 133, 120, NULL, 'CH.SEC.EXPEDIENTE ARQUIVOS DIR.QUADROS DPPQ/EMG', '2022-12-01'),
(855, 552, 58, 123, NULL, 'CMDTE PTAO INFª 5ª BRIM', '2022-12-01'),
(856, 71, 80, 123, NULL, 'CMDTE PTAO INFANTARIA', '2022-12-01'),
(857, 143, 139, 115, NULL, 'CHEFE CENTRO INFORMATICA DIRECCAO SVC MATERIAL/EME', '2022-12-01'),
(858, 608, 134, 129, NULL, 'AMANUENSE SEC. POLICIA MILITAR REGTO TRANSMISSOES/EME', '2022-12-01'),
(859, 628, 58, 121, NULL, 'CHEFE ADJUNTO SEC. PESSOAL 5ª BRIM', '2022-12-01'),
(860, 685, 133, 128, NULL, 'ARQUIVISTA SEC.NOM.TRANSFERENCIAS COMISSOES SVC REPART.NOM. ì\nTRANSFERENCIAS COMISSOES SVC DIV. PESSOAL EMG', '2022-12-01'),
(861, 702, 133, 128, NULL, '(POR DESERCAO DESDE 5/03/2000)', '2022-12-01'),
(862, 704, 133, 128, NULL, 'ESCRITURARIO SEC. NOMEAÇOES TRANSP. COMISSOES SVÇ REPART. ì\nNOMEAÇOES TRANSFERENCIAS COMISSOES SVÇ DIV. PESSOAL EMG', '2022-12-01'),
(863, 504, 133, 133, NULL, 'AMANUENSE SECRETARIA ISEM', '2022-12-01'),
(864, 676, 133, 129, NULL, 'ARQUIVISTA SUB-SECCAO EXP.ARQUIVO DIV.PESS EMG\r\n(Efectividade apartir de 01/08/97)', '2022-12-01'),
(865, 573, 134, 131, NULL, 'ESCRIT. SEC. LEGISLACAO DISCIPLINA REGTO TRANSMISSOES/EME', '2022-12-01'),
(866, 684, 133, 129, NULL, 'ARQUIVISTA SEC. NOMEAÇOES TRANSFERENCIAS COMISSOES SVÇ REPART. ì\nNOMEAÇOES TRANSFERENCIA COMISSOES SVÇ DIV. PESSOAL EMG', '2022-12-01'),
(868, 673, 134, 131, NULL, 'ENTREGUE A DIVISAO DE PESSOAL EMG', '2022-12-01'),
(869, 2, 139, 115, NULL, 'CHEFE SECCAO INFORMATICA REPARTICAO SVC TECNICOS DIRECCAO ì\nLOGISTICA EME', '2022-12-01'),
(870, 598, 26, 121, NULL, 'OFICIAL ANALISE SEC. INFORMATICA 7ª RM', '2022-12-01'),
(871, 191, 154, 121, NULL, 'CHEFE SECCAO INFORMATICA RM LESTE', '2022-12-01'),
(872, 543, 134, 131, NULL, 'ESCRITURARIO CCS ISEM', '2022-12-01'),
(873, 676, 134, 131, NULL, 'ESCRITURARIO DACTILOGRAFO 3.REPART.DIV.PESS EMG\r\n(Efectividade apartir de 01/08/97)', '2022-12-01'),
(874, 661, 56, 123, NULL, 'OFICIAL MANUTENCAO 4º BTAO COP SUDESTE \r\n', '2022-12-01'),
(875, 662, 56, 121, NULL, 'OFICIAL MANUTENCAO 4º BTAO COP SUDESTE \r\n', '2022-12-01'),
(876, 553, 56, 120, NULL, 'OFICIAL MANUTENCAO 3º BTAO 18º RI ZMIKK', '2022-12-01'),
(878, 346, 154, 125, NULL, 'ORDENANCA DO GABINETE DO CMDTE COP/L. NORTE 46\' RI FM-LESTE', '2022-12-01'),
(879, 619, 154, 121, NULL, 'OFICIAL ESTUDOS PLANEAM.  SECCAO INFORMATICA RM LESTE', '2022-12-01'),
(881, 492, 154, 120, NULL, 'CH. SEC. INFORMATICA RM LESTE', '2022-12-01'),
(882, 705, 139, 115, NULL, 'COMISSAO ESPECIAL SVC GOVERNO PROVINCIAL ZAIRE', '2022-12-01'),
(883, 290, 145, 128, NULL, 'ASRGENTO SEC SVC MATERIAL 2ºBTAO REP MANUTECAO REGTO ARMTO ì\nTECNICA/EME', '2022-12-01'),
(884, 682, 134, 131, NULL, 'DESERTOR DESDE OUTUBRO/98', '2022-12-01'),
(886, 472, 56, 123, NULL, 'OFICIAL MANUTENÇAO BTAO INFª MUCUSSO COP SUDESTE', '2022-12-01'),
(889, 620, 162, 121, NULL, 'CMDTE PTAO RADIO CIA TRMS/ZM-BIÉ', '2022-12-01'),
(890, 440, 26, 120, NULL, 'OF.PLANIF.ORGANIZACAO SEC.INFORMATICA 7ª RM', '2022-12-01'),
(891, 580, 154, 136, NULL, 'CMDTE 1ª SECC 2º PTAO CIA ENGENHARIA 16º RIM', '2022-12-01'),
(892, 639, 145, 129, NULL, 'CMDTE SEC. REABASTº CIA AUTO 2º BTAO  RGTO SVC MATERIAL/EME', '2022-12-01'),
(893, 678, 162, 120, NULL, 'CMDTE PTAO RADIO CIA TRMS COP BIE FM CENTRO', '2022-12-01'),
(895, 599, 162, 117, NULL, 'CHEFE SEC. INFORMACOES ZM BIE 4ª RM', '2022-12-01'),
(896, 593, 59, 121, NULL, 'OFICIAL MANUTENCAO SISTEMA SEC. INFORMATICA RM LESTE\r\n', '2022-12-01'),
(897, 460, 36, 120, NULL, 'CHEFE SECRETARIA DESTº APOIO COP HUAMBO RM CENTRO', '2022-12-01'),
(898, 455, 36, 121, NULL, 'CHEFE SECRETARIA DESTº APOIO COP HUAMBO RM CENTRO', '2022-12-01'),
(899, 492, 59, 120, NULL, 'OFICIAL MANUTENCAO SEC. INFORMATICA RM LESTE', '2022-12-01'),
(901, 708, 54, 115, NULL, 'CH.SEC.FUNERARIA DEST.APOIO GML/EMG', '2022-12-01'),
(902, 480, 393, 120, NULL, 'OFICIAL INFORMATICA SECTOR MILITAR ESPECIAL SOYO RM NORTE', '2022-12-01'),
(903, 593, 393, 121, NULL, 'OFICIAL INFORMATICA SECTOR MILITAR ESPECIAL SOYO RM NORTE', '2022-12-01'),
(904, 161, 8, 123, NULL, 'CMDTE PTAO INFANTARIA 2ª RM', '2022-12-01'),
(905, 163, 8, 121, NULL, 'CMDTE PTAO GUARDA GUARN. CIA CMDO DESTº APOIO 2ª RM', '2022-12-01'),
(906, 640, 43, 129, NULL, 'CMDTE 2ª SEC. 3º PTAO 1ª CIA 2º BTAO 85º RI RM NOROESTE', '2022-12-01'),
(907, 642, 43, 129, NULL, 'ATIRADOR AKM 2ª SEÇ. 3º PTAO 1ª CIA 2º BTAO 85º RI RM NOROESTE\r\n- EFECTIVIDADE A PARTIR DE MAIO DE 1997', '2022-12-01'),
(908, 604, 14, 128, NULL, 'FOTOGRAFO-ELECTRICISTA REP. PESSOAL CMDO E.M/F.M. CABINDA', '2022-12-01'),
(909, 604, 8, 131, NULL, 'ESCRIT. SEC. MATRICULA DESTAC. APOIO Q/G FM/CABINDA ', '2022-12-01'),
(910, 593, 175, 121, NULL, 'OFICIAL MANUTENCAO SISTEMA SEC. INFORMATICA RM SUL\r\n', '2022-12-01'),
(911, 483, 175, 120, NULL, 'OFICIAL MANUTENCAO SISTEMA SEC. INFORMATICA RM SUL', '2022-12-01'),
(912, 615, 156, 117, NULL, 'OFIC. PLAN. SECC. PLANIF. TACTICA OPER. REPART. OPERAC. FM NORTE', '2022-12-01'),
(913, 286, 4, 136, NULL, 'CONDUTOR-AUTO', '2022-12-01'),
(914, 688, 156, 115, NULL, 'CH. SECÇ. INFORMATICA 8. RM', '2022-12-01'),
(915, 679, 156, 117, NULL, 'CH. SEC. INFORMATICA / 8 RM', '2022-12-01'),
(916, 547, 156, 117, NULL, 'CH. CENTRO PROCESSAMENTO DE DADOS REPART. OPERACOES RM LESTE', '2022-12-01'),
(917, 584, 175, 128, NULL, 'CH. SEC SVÇ GERAIS ESCOLA FORM. SARG. EXERCITO LUBANGO', '2022-12-01'),
(918, 503, 175, 133, NULL, 'CHEFE SECCAO SVC GERAIS ESCOLA FORMACAO SARGENTOS/EME', '2022-12-01'),
(919, 501, 175, 133, NULL, 'CMDTE SECCAO CI LUBANGO CAHAMA', '2022-12-01'),
(920, 468, 142, 129, NULL, 'CMDTE 3ª EQUIPE FEIXES HARTEZIANOS 2ª CIA RGETO TRANSMISSOES/EME', '2022-12-01'),
(921, 616, 47, 120, NULL, 'OFICIAL PESSOAL BTAO ESCOLTA COP CUNENE RM SUL', '2022-12-01'),
(922, 122, 47, 117, NULL, 'OFICIAL CAMPO CMDTE ZM CUNENE 5ª RM\r\n', '2022-12-01'),
(923, 544, 160, 126, NULL, 'STO PTAO Trx CCP COP/MOXICO RM LESTE', '2022-12-01'),
(931, 177, 47, 121, NULL, 'OFICIAL PESSOAL BTAO CMDO SVC COP CUNENE RM SUL', '2022-12-01'),
(932, 207, 160, 121, NULL, 'CHEFE SECCAO INFORMATICA 3ª RM', '2022-12-01'),
(933, 591, 165, 120, NULL, 'INSTRUTOR NORMAS SVC UNIDADES ESCOLA PRATICA ADNIM. MILITAR', '2022-12-01'),
(934, 644, 165, 117, NULL, 'INSTRUTOR ORDEM UNIDA GRUPO INSTRUTORES MATERIAS GERAIS CI PM ì\nREGº POLICIA MILITAR EME', '2022-12-01'),
(935, 161, 72, 121, NULL, 'CMDTE PTAO 2º BTAO 2ª BRIM 2ª RM', '2022-12-01'),
(936, 190, 47, 128, NULL, 'SARG. PESSOAL BTAO CMDO SVC COP CUNENE RM SUL', '2022-12-01'),
(937, 31, 165, 117, NULL, 'OFICIAL INFORMACOES 2º GRUPO ZU-23mm REGTº DAA EME', '2022-12-01'),
(938, 635, 160, 121, NULL, 'CMDTE PTAO Trx CCP COP/MOXICO RM LESTE\r\n', '2022-12-01'),
(939, 440, 160, 120, NULL, 'OFICIAL INFORMATICA SEC. INFORMATICA 3ª RM', '2022-12-01'),
(940, 309, 155, 120, NULL, 'CMDTE PTAO DEFESA IMEDIATA REGMTO TRANSMISSOES ', '2022-12-01'),
(941, 663, 155, 120, NULL, 'OFICIAL IDENTIF.SEC.IDENTIF.REP.PCD PESSOAL DIV.PESS/EMG', '2022-12-01'),
(942, 629, 61, 117, NULL, 'OFICIAL REABASTECIMENTO', '2022-12-01'),
(943, 641, 61, 117, NULL, 'CMDTE 4ª CIA 115º BTAO CACADORES', '2022-12-01'),
(944, 598, 30, 121, NULL, 'OFICIAL OPERACOES 75º BTAO 17º RI ZM HUAMBO 4ª RM', '2022-12-01'),
(945, 617, 30, 128, NULL, 'STO OPERACOES 75º BTAO 17º RI COP/HUAMBO 4ª RM', '2022-12-01'),
(946, 260, 30, 120, NULL, 'CH. SECRETARIA 17º RI 4ª RM', '2022-12-01'),
(947, 461, 150, 121, NULL, 'PROGRAMADOR COMPUTADOR CENTRO PROCESSAM. DADOS DIR. PESSOAL EME', '2022-12-01'),
(948, 593, 150, 123, NULL, 'OFICIAL FORMACAO SEC. INFORMATICA RM BENGO', '2022-12-01');
INSERT INTO `tbl_historico_progressao` (`id`, `idOrdem`, `idPessoa`, `CodPatente`, `Cargo_id`, `Cargo_por_normalizar`, `Data_Registo`) VALUES
(949, 440, 150, 120, NULL, 'PROGRAMADOR CENTRO PROCESSAM. DADOS DIR. PESSOAL EME', '2022-12-01'),
(950, 99, 150, 120, NULL, 'PROGRAMADOR SECCAO ANALISE DESENVOLVIMENTO SISTEMAS REPART. ì\nINFORMATICA EME', '2022-12-01'),
(951, 686, 155, 117, NULL, 'OFIC. IDENTIF. REP. P.C.D PESS. DIV. PESS/EMG', '2022-12-01'),
(952, 4, 74, 129, NULL, 'CMDTE SECCAO INFANTARIA 59ª BRIM', '2022-12-01'),
(953, 715, 124, 123, NULL, NULL, '2022-12-01'),
(954, 637, 16, 136, NULL, 'OPERADOR COMPUTADOR SECCAO OPERACOES E INFORMACOES REGIMENTO ì\nPOLICIA MILITAR/EME', '2022-12-01'),
(956, 532, 150, 131, NULL, 'ATIRADOR CIA ASSEGUR.ESCOLA PATRIA ART&TERRESTRE', '2022-12-01'),
(957, 604, 10, 136, NULL, 'ATIRADOR (A K M) CIA INFª LIGEIRA P/COMANDO BELIZE FM/CABINDA ', '2022-12-01'),
(958, 621, 149, 128, NULL, 'MECANICO CHEFE TANQUE CIA REPARACAO TECNICA BLINDADA 2º BTAO ì\nREGTO SVC MATERIAL/EME', '2022-12-01'),
(959, 681, 142, 121, NULL, 'COMISSAO NORMAL SVC MINDEN (TECNICO ADMINISTRACAO PUBLICA GAB. ì\nRECURSOS HUMANOS CSS FAA)', '2022-12-01'),
(960, 571, 142, 121, NULL, 'CMDTE PTAO 2ª CIA REGIMENTO TRANSMISSOES/EME\r\n', '2022-12-01'),
(962, 71, 76, 123, NULL, 'CMDTE PTAO INFANTARIA', '2022-12-01'),
(964, 27, 167, 117, NULL, 'OFICIAL P/ ARTILHARIA ANTI-AEREA SECCAO ENSINO ARMAS REPART. ì\nENSINO ESPECIALIZADO DIRECCAO INSTRUCAO COPEIE', '2022-12-01'),
(965, 205, 167, 120, NULL, 'OFICIAL TRANSMISSOES REPART. ENSINO ESPECIALIZADO DIR. INSTRUCAO ì\nE ENSINO/EME', '2022-12-01'),
(966, 189, 167, 120, NULL, 'OFICIAL P/ARTª ANTI-AEREA SEC. ENSINO DAS ARMAS REPART. ENSINO ESPECIALIZADO DIR. INSTCUCAO/COPIE', '2022-12-01'),
(967, 402, 138, 128, NULL, 'SARGENTO AUXILIAR SUB-SECCAO CARREIRA SECCAO PRACAS REPART. SARG. ì\nPRACAS DIRECCAO PESSOAL CMDO PESSOAL INSTRUCAO', '2022-12-01'),
(968, 366, 49, 131, NULL, 'CMDTE SECCAO ENGENHARIA 32ª BRIM', '2022-12-01'),
(969, 569, 31, 128, NULL, 'STO SECRETARIA DESTº APOIO RM NORTE', '2022-12-01'),
(970, 697, 167, 115, NULL, 'OFICIAL P/ENSINO TRMS DIR. INSTRUCAO EME', '2022-12-01'),
(971, 601, 167, 115, NULL, 'OFICIAL PLANEAMTº SECCAO ESTUDO PLANEAMTº REPART. INFORMATICA EME', '2022-12-01'),
(972, 348, 167, 115, NULL, 'OF. PLANEAMTº SEC. ORGANIZ. PLANEAMTº REPART. INFORMATICA EME', '2022-12-01'),
(973, 440, 138, 120, NULL, 'OFICIAL INFORMAT. E IDENT. CPD REP. PESS. 1ª RM', '2022-12-01'),
(974, 540, 49, 131, NULL, 'SAPADOR 2ª SEC. 2º PTAO CIA SAPADOR RM BENGO', '2022-12-01'),
(975, 225, 176, 131, NULL, 'STO 2º PTAO 3ª CIA DESTº PROTENCAO OBJECTIVOS ECONOMICOS RM-BENGO', '2022-12-01'),
(976, 45, 138, 128, NULL, 'AMANUENSE SEC. EXPEDIENTE E ARQUIVO DIR. PESSOAL/EME', '2022-12-01'),
(977, 569, 33, 129, NULL, 'RADIO TELEF. SEC. Trx BTAO APOIO SVC RM NORTE', '2022-12-01'),
(978, 502, 152, 128, NULL, 'SGTO SECCAO DE PESSOAL E QUADROS 2º BTAO 66ª RIM FM NORTE', '2022-12-01'),
(979, 611, 152, 129, NULL, 'CMDTE 1ª SECCAO 2º P.D.I. DESTº APOIO/EME', '2022-12-01'),
(980, 622, 152, 128, NULL, 'SGTO OPERACOES SEC. OPERACOES INFORMACOES BTAO SVC PESSOAL/EME', '2022-12-01'),
(981, 289, 152, 128, NULL, 'OPERADOR COMPUTADOR CPD DIREC. PESSOAL QUADROS/EME', '2022-12-01'),
(982, 598, 138, 121, NULL, 'OFICIAL SECCAO INFORMATICA REPART. PESSOAL 1ª RM', '2022-12-01'),
(983, 71, 73, 123, NULL, 'CMDTE PTAO INFANTARIA', '2022-12-01'),
(984, 612, 152, 129, NULL, 'CMDTE 2ª SECCAO 3º PTAO BTAO CMDO E SERVICO DESTº APOIO/EME', '2022-12-01'),
(993, 161, 375, 121, NULL, 'CMDTE PTAO INFANTARIA 9ª RM', '2022-12-01'),
(994, 163, 375, 120, NULL, 'CHEFE SECRETARIA 32ª BRIM', '2022-12-01'),
(995, 209, 38, 129, NULL, 'AUXILIAR SVC GERAIS DIREC. INFORMACOES/EME', '2022-12-01'),
(996, 348, 34, 120, NULL, 'OFICIAL EXPEDIENTE ARQUIVO REPART. INFORMATICA EME ', '2022-12-01'),
(997, 558, 159, 117, NULL, 'OF. P/ANALISE E PROGRAMACAO DA SEC.INFORMATICA DA SEC.INFORM. DA ì\nDL/EME\r\n', '2022-12-01'),
(998, 258, 159, 117, NULL, 'OFICIAL INFORMATICA CENTRO PROCESSAMENTO DADOS DIR SVC ì\nMATERIAL/EME', '2022-12-01'),
(999, 335, 159, 117, NULL, 'PROGRAMADOR SEC. DESENVOLVIMENTO DE SISTEMAS SVC INFORMATICA DO ESTADO MAIOR COORDENADOR\r\n', '2022-12-01'),
(1000, 98, 159, 117, NULL, 'CH. SEC. ESTUDOS PLANEAMENTO REPART. INFORMATICA EM COORDENADOR', '2022-12-01'),
(1001, 686, 159, 115, NULL, 'OFIC.P/ANAL.PROG.SEC.INF/DL', '2022-12-01'),
(1002, 70, 159, 115, NULL, 'CHEFE SECCAO ANALISES DESENVOLV. SISTEMA REPART. INFORMATICA EME\r\n', '2022-12-01'),
(1003, 348, 159, 115, NULL, 'CH. SEC. ANALISES DESENVOLV. SISTEMA REPART. INFORMATICA EME', '2022-12-01'),
(1008, 3, 38, 136, NULL, 'OPERAD. CIFRAS SUB-SEC. INFORM. ESPECIAS DIRECÇAO INFORMAÇOES/COE\r\n\r\n- EFECTIVIDADE APARTIR DE JUNHO/94', '2022-12-01'),
(1009, 519, 38, 136, NULL, 'OPERADOR CIFRAS SEC. INFORMAÇOES ESPECIAS REPART. INFORMAÇOES RM ì\nNORTE', '2022-12-01'),
(1010, 622, 38, 136, NULL, 'OPERADOR RADIO TELEGRAFISTA REPART. INFORMAÇOES ESPECIAIS DIREC. ì\nINFORMAÇOES/COE', '2022-12-01'),
(1011, 468, 34, 128, NULL, 'ADJUNTO PTAO TRANSPORTES REGTO SVC MATERIAL/EME', '2022-12-01'),
(1012, 488, 34, 121, NULL, 'CMDTE PTAO TRANSPORTAÇOES VIAS 101ª BRIGADA TANQUES EME', '2022-12-01'),
(1013, 461, 34, 120, NULL, 'INSTRUTOR SEC. FORMACAO REPART. INFORMATICA EME', '2022-12-01'),
(1014, 608, 38, 131, NULL, 'OPERADOR RADIO TELEGRAFIA SEC. Trx REPARTICAO INFORMACAO DIREC. ì\nINFORMACAO/EME', '2022-12-01'),
(1015, 289, 38, 131, NULL, 'ESTAFETA SEC. EXPED. ARQUIVO DIREC. DIREC. INFORMACOES/EME', '2022-12-01'),
(1017, 71, 77, 123, NULL, 'CMDTE PTAO INFANTARIA', '2022-12-01'),
(1018, 204, 137, 120, NULL, 'CHEFE SECCAO EXPEDIENTE ARQUIVO DIVISAO FINANCAS EMG', '2022-12-01'),
(1019, 567, 137, 120, NULL, 'A disposicao Direccao Pessoal EME', '2022-12-01'),
(1020, 335, 178, 117, NULL, 'CH. SEC. SUPORTE DE SISTEMAS DO CENTRO DE PROCESSAMENTO DE DADOS ì\nPRINCIPAL DO ESTADO MAIOR COORDENADOR\r\n', '2022-12-01'),
(1021, 145, 137, 117, NULL, 'OFICIAL A DISPOSICAO EME     \r\n', '2022-12-01'),
(1022, 191, 137, 117, NULL, 'OFICIAL A DISPOSICAO EME', '2022-12-01'),
(1023, 259, 137, 117, NULL, 'CHEFE SECCAO EXPEDIENTE ARQUIVO DIRECCAO FINANCAS EME', '2022-12-01'),
(1024, 321, 137, 120, NULL, 'CH. SEC. DE FINANCAS REGTO INTENDENCIA/EME', '2022-12-01'),
(1026, 322, 137, 117, NULL, 'CH. SEC. FINANCAS REGº INTENDENCIA EME', '2022-12-01'),
(1027, 572, 178, 117, NULL, 'OFICIAL INFORMATICA REPART. TRMS INFORMATICA/GML', '2022-12-01'),
(1030, 298, 178, 115, NULL, 'CHEFE SECCAO INFORMATICA 9ª RM', '2022-12-01'),
(1031, 100, 79, 121, NULL, 'OFICIAL HARDWARE SEC. INFORMATICA 4ª RM', '2022-12-01'),
(1032, 100, 73, 121, NULL, 'CMDTE 2º PTAO 3ª CIA 1º BTAO 48º RI ZM DUNDO 10ª RM', '2022-12-01'),
(1034, 547, 178, 117, NULL, 'CHEFE SEC. EXPLORACAO SISTEMAS REPART. INFORMATICA EMC', '2022-12-01'),
(1035, 686, 178, 115, NULL, 'CH.SEC.EXPL.SIST./EME', '2022-12-01'),
(1036, 689, 27, 121, NULL, 'OF.PESS.SEC.PESS. QUADROS RDE/EMG', '2022-12-01'),
(1040, 124, 8, 120, NULL, 'CMDTE PDI CIA CMDO DESTAC. APOIO 2ª RM', '2022-12-01'),
(1041, 124, 80, 121, NULL, 'OF. INFORMACOES SEC. OPERACOES 21ª BRIM 5ª RM', '2022-12-01'),
(1042, 100, 72, 120, NULL, 'OFICIAL AUDITORIA SEC. INFORMACAO ANALISE REPART. GUERRA PSICOL. ì\n2ª RM \r\n', '2022-12-01'),
(1043, 100, 9, 120, NULL, 'OFICIAL CAMPO GAB. CMDTE 2ª RM \r\n', '2022-12-01'),
(1044, 100, 77, 121, NULL, 'CMDTE 1º PTAO 3ª CIA 1º BTAO 11º RI 3ª RM', '2022-12-01'),
(1045, 51, 46, 129, NULL, 'CHEFE SEC. RADIO CAMPO MILITAR GRAFANIL', '2022-12-01'),
(1046, 124, 76, 121, NULL, 'CMDTE 1º PTAO DESEMBARQUE 3º BTAO 20ª BRIM 4ª RM', '2022-12-01'),
(1047, 123, 135, 120, NULL, 'OF. OPERACOES 3º BTAO 190º RI 4ª RM\r\nEFECTIVIDADE APARTIR DE AGOSTO DE 2000', '2022-12-01'),
(1049, 103, 177, 117, NULL, 'OFICIAL DE SISTEMAS ANALISE E DESENV. DIR. INFORMATICA EME', '2022-12-01'),
(1050, 477, 160, 115, NULL, 'OFICIAL DE PLANEAMENTO E SISTEMA DE INFORMACAO DA REPARTICAO DE  INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(1051, 103, 41, 117, NULL, 'OFICIAL ESTATISTICA PLANEAM. REPART. PESSOAL E QUADROS RM CABINDA', '2022-12-01'),
(1052, 73, 19, 128, NULL, 'AMANUENSE BTAO CMDO SVÇ UNIDADE DE APOIO/EME', '2022-12-01'),
(1053, 477, 168, 115, NULL, 'ADMINISTRADOR DO CENTRO DE PROCESSAMENTO DE DADOS  DA BASE DADOS DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(1054, 76, 117, 129, NULL, NULL, '2022-12-01'),
(1055, 445, 170, 115, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1056, 477, 166, 115, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES DO EXERCITO', '2022-12-01'),
(1057, 445, 177, 115, NULL, '1º OFICIAL DE SISTEMAS E SERVIDORES DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO INFORMATICA DO EXERCITO', '2022-12-01'),
(1058, 489, 9, 115, NULL, 'OFICIAL DE SISTEMA DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1059, 718, 141, 113, NULL, '1º OF. PLANEAM.  E ORGANIZ. DIR. INFORMATICA EME', '2022-12-01'),
(1060, 103, 58, 117, NULL, 'OFICIAL ASSEGURAMENTO TECNICO SEC. INFORMATICA 2ª DIV.INFª RM ì\nNORTE', '2022-12-01'),
(1061, 195, 214, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1062, 126, 66, 128, NULL, ' OPERADOR COMPUTADOR DIRECÇAO DE ARMTO E TÉCNICA/EME', '2022-12-01'),
(1063, 76, 86, 129, NULL, NULL, '2022-12-01'),
(1064, 195, 212, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1065, 195, 213, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1066, 720, 14, 126, NULL, 'CH. TURNO REP. DE INFORMATICA DPPQ EMGFAA', '2022-12-01'),
(1067, 698, 23, 117, NULL, 'INACTIVIDADE TEMPORARIA POR MOTIVO DE ESTUDO', '2022-12-01'),
(1070, 719, 142, 117, NULL, 'CH.GAB/INFORMAT.C.S.S/FAA/MDN', '2022-12-01'),
(1071, 261, 235, 123, NULL, 'CMDTE PTAO TECNICA BLINDADA', '2022-12-01'),
(1072, 425, 150, 120, NULL, 'PROFESSOR SEC. ESTUDO DE INFORMATICA CENTRO DE LINGUAS E INFORMATICA/EME', '2022-12-01'),
(1073, 403, 156, 115, NULL, 'CHEFE SECCAO INFORMATICA DIRECCAO PRECOM/EME', '2022-12-01'),
(1075, 179, 58, 117, NULL, 'CHEFE CPD DIR. ENGENHARIA INFRA-ESTRUTURAS/EME', '2022-12-01'),
(1076, 211, 215, 129, NULL, 'FINALISTA 8º CURSO ESPECIALISTA MENOR ARMATEC', '2022-12-01'),
(1077, 696, 139, 115, NULL, 'OF. INACTIVIDADE TEMPORARIA EME', '2022-12-01'),
(1078, 195, 219, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1081, 533, 67, 117, NULL, ' OFICIAL PLANEAMENTO  E SISTEMAS DE INFORMACAO REP. DE INFORMATICA RM LESTE', '2022-12-01'),
(1082, 228, 80, 121, NULL, 'CHEFE SECRETARIA EIAS/EME', '2022-12-01'),
(1083, 735, 61, 115, NULL, 'CH. SEC. INFORMATICA 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1084, 719, 23, 117, NULL, 'CH. SEC. ADM. E SVC REPART. PESSOAL E QUADROS EMGFAA', '2022-12-01'),
(1085, 261, 233, 123, NULL, 'CMDTE PTAO TECNICA BLINDADA', '2022-12-01'),
(1086, 261, 234, 123, NULL, 'CMDTE PTAO ENGENHARIA E SAPADORES', '2022-12-01'),
(1087, 54, 46, 128, NULL, 'AMANUENSE GAB. CMDTE CM GRAFANIL EXE', '2022-12-01'),
(1088, 735, 162, 115, NULL, 'OF. PLANEAM. E SISTEMA INFORMACAO REP. INFORMATICA RM CENTRO', '2022-12-01'),
(1089, 261, 232, 123, NULL, 'CMDTE GPO INTELIGENCIA MILITAR OPERATIVA', '2022-12-01'),
(1091, 474, 160, 120, NULL, 'OFICIAL INFORMATICA REPART. TELECOMUNICACOES RM CENTRO', '2022-12-01'),
(1092, 527, 174, 115, NULL, 'OFICIAL PLANEAMENTO SISTEMAS INFORMACAO REPART. INFORMATICA RM CABINDA', '2022-12-01'),
(1093, 533, 42, 117, NULL, 'CHEFE SECCAO INFORMATICA 6ª DIVISAO INFª MOTORIZADA RM SUL', '2022-12-01'),
(1094, 510, 80, 121, NULL, 'CHEFE SECRETARIA EIAS/EME', '2022-12-01'),
(1095, 54, 116, 128, NULL, 'AMANUENSE REPART. ACCAO SOCIAL DIR. PESSOAL E QUADROS EXE', '2022-12-01'),
(1096, 54, 109, 128, NULL, 'TESOUREIRO UNID. PRISAO PREVENTIVA RM SUL', '2022-12-01'),
(1097, 533, 60, 120, NULL, 'OFICIAL SOFTWARE REPARTICAO INFORMATICA RM CENTRO', '2022-12-01'),
(1098, 311, 44, 117, NULL, 'OF. PROCESSAMENTO DADOS CPD DPQ EME', '2022-12-01'),
(1099, 54, 68, 128, NULL, 'OPERADOR COMPUTADOR CRM-HUILA RM SUL', '2022-12-01'),
(1101, 311, 133, 117, NULL, 'OFICIAL CPD DPQ EME', '2022-12-01'),
(1102, 33, 146, 117, NULL, 'CH CPD DIR. PLANEAM. E ORGANIZACAO EXE', '2022-12-01'),
(1103, 324, 52, 128, NULL, 'AMANUENSE DIRECCAO ADMINISTRACAO E FINANCAS/EME', '2022-12-01'),
(1104, 734, 254, 129, NULL, 'FINALISTA DO 10º CURSO DE FORMAÇAO DE SARGENTOS', '2022-12-01'),
(1105, 275, 204, 133, NULL, 'ENFERMEIRA PTAO SANITARIO CIA SVCOS GERAIS BTAO SVCOS PESSOAL/EXE', '2022-12-01'),
(1106, 510, 123, 121, NULL, 'PROFESSOR  SISTEMA INFORMATICO ACADEMIA MILITAR/EME', '2022-12-01'),
(1107, 533, 9, 120, NULL, 'OFICIAL HARDWARE REPARTICAO INFORMATICA RM CABINDA', '2022-12-01'),
(1108, 311, 393, 117, NULL, 'OFICIAL IMO SECC INTELIGENCIA MILITAR OPERATIVA 71ª BRI RM NORTE', '2022-12-01'),
(1109, 311, 80, 120, NULL, 'CHEFE SECRETARIA EIAS RM SUL', '2022-12-01'),
(1110, 291, 185, 129, NULL, 'OPERADOR DE COMPUTADOR REP.PESSOAL E QUADROS RM CENTRO', '2022-12-01'),
(1111, 275, 188, 133, NULL, 'OP. COMPUTADOR CENTRO PROCESSAMENTO DADOS CSC RM SUL', '2022-12-01'),
(1112, 107, 226, 121, NULL, 'CMDTE PTAO INFª AME/EXE', '2022-12-01'),
(1113, 533, 170, 117, NULL, 'CHEFE SECCAO INFORMATICA 2ª DIVISAO INFª RM NORTE', '2022-12-01'),
(1114, 533, 143, 117, NULL, 'OFICIAL SISTEMAS E REDES REPARTICAO INFORMATICA RM CENTRO', '2022-12-01'),
(1115, 736, 54, 113, NULL, 'OFICIAL DE PLANEAMENTO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LUANDA EMG', '2022-12-01'),
(1116, 723, 67, 115, NULL, 'CH. REPART. INFORMATICA RM LESTE', '2022-12-01'),
(1117, 734, 253, 129, NULL, 'FINALISTA DO 10º CURSO DE FORMAÇAO DE SARGENTOS', '2022-12-01'),
(1118, 311, 76, 120, NULL, 'OF. ESTATISTICA REP. PLAN. EST. GERAIS DIR. PLAN. ORGANIZ. EME', '2022-12-01'),
(1119, 723, 156, 113, NULL, 'CH. SEC. INFORMATICA DIR. PRECOM EME', '2022-12-01'),
(1121, 311, 166, 117, NULL, 'OF. OPERATIVO SEC. GUARDA OPERAT. POSTO CMDO DIR. OPERACOES EME', '2022-12-01'),
(1122, 311, 154, 117, NULL, 'CH. SEC. INFORMATICA 3ª DIV. INFª RM LESTE', '2022-12-01'),
(1123, 533, 154, 120, NULL, 'CHEFE SECCAO INFORMATICA 3ª DIVISAO INFª RM LESTE', '2022-12-01'),
(1124, 533, 162, 117, NULL, 'OFICIAL SISTEMAS E SERVIDORES SECCAO INFORMATICA 4ª DIVISAO INFª RM CENTRO', '2022-12-01'),
(1125, 533, 59, 120, NULL, 'OFICIAL SISTEMAS E SERVIDORES SEC. INFORMATICA 3ª DIVISAO INFª RM LESTE', '2022-12-01'),
(1126, 723, 139, 113, NULL, 'CH. SEC. INFORMATICA DIR. INST. ENSINO EME', '2022-12-01'),
(1127, 324, 2, 126, NULL, 'ADJUNTO CMDO BTAO INSTRUCAO RGTO TELECOM/EME', '2022-12-01'),
(1128, 734, 209, 129, NULL, 'FINALISTA DO 10º CURSO DE FORMAÇAO DE SARGENTOS', '2022-12-01'),
(1129, 311, 138, 117, NULL, 'OF. INFORMAT. IDENTIF. REP. PESS. QUAD. RM NORTE', '2022-12-01'),
(1130, 311, 114, 121, NULL, 'CMDTE PTAO MANUTENCAO TECNICA BLINDADA CIA REP. MOVEL REPARACAO RM CENTRO', '2022-12-01'),
(1131, 723, 42, 115, NULL, 'CH. SEC. INFORMATICA 6ª DIV. INFª RM SUL', '2022-12-01'),
(1132, 311, 27, 117, NULL, 'PROF. INFORMATICA EIAS EME', '2022-12-01'),
(1133, 723, 167, 113, NULL, '1º OF. ANALISE DESENV. REP. ANALISE DESENV. SISTEMA DIR. INFORMATICA EME', '2022-12-01'),
(1135, 311, 180, 117, NULL, 'OFICIAL LOGISTICA REGTO TRANSPORTE EME', '2022-12-01'),
(1136, 311, 160, 117, NULL, 'OF. PLANEAM. SISTEMA INFORMACAO REP. INFORMATICA RM LESTE', '2022-12-01'),
(1137, 231, 370, 128, NULL, 'AUXILIAR P/PLANIF. RECOLHA ORGAN. ARQUIVO MILITAR RM CABINDA', '2022-12-01'),
(1138, 564, 139, 115, NULL, 'OF. INACTIVIDADE TEMPORARIA EME', '2022-12-01'),
(1139, 614, 213, 129, NULL, 'SARGENTO MEIOS MATERIAIS CLASSIFICADAS BIMO/EXE', '2022-12-01'),
(1140, 614, 212, 129, NULL, 'SARGENTO CMDO 2ª CIA BIMO/EXE', '2022-12-01'),
(1141, 516, 79, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DE DADOS DIRECCAO ENGENHARIA E INFRA-ESTRUTURAS/EXE', '2022-12-01'),
(1142, 516, 386, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DE DADOS UNIDADE DE APOIO/EXE', '2022-12-01'),
(1143, 594, 58, 117, NULL, 'OFICIAL ANALISE SISTEMAS CENTRO PROCESSAMENTO DADOS DIRECCAO ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(1144, 594, 79, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DE DADOS DIRECCAO ENGENHARIA E INFRA-ESTRUTURAS/EXE', '2022-12-01'),
(1145, 594, 386, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS UNIDADE APOIO/EXE', '2022-12-01'),
(1146, 262, 117, 121, NULL, 'FINALISTA 2º CURSO  FORMACAO OFICIAIS ACADEMIA MILITAR EXERCITO', '2022-12-01'),
(1147, 108, 71, 129, NULL, 'FINALISTA 17º CURSO FORMACAO SARGENTOS/ESCOLA INTER ARMAS SARGENTOS/EXE', '2022-12-01'),
(1149, 514, 167, 113, NULL, '1º OFICIAL PLANEAMENTO E SISTEMAS INFORMACAO REPARTICAO PLANEAMENTO E SISTEMAS DE INFORMACAO DIRECCAO INFORMATICA/EXE', '2022-12-01'),
(1150, 126, 33, 128, NULL, 'SGTO DEPOSITO DOC. BIBLIOTECA REGIONAL RM NORTE', '2022-12-01'),
(1152, 717, 137, 115, NULL, 'INSPECTOR SEC. AUDIT. REPARTICAO ORGANIZACAO E AUDITORIA DIRECCAO FINANCAS EME', '2022-12-01'),
(1153, 692, 147, 128, NULL, NULL, '2022-12-01'),
(1154, 717, 159, 113, NULL, 'CH. SEC. ANALISES DESENVOLV. SISTEMA REPART. INFORMATICA EME', '2022-12-01'),
(1155, 717, 178, 113, NULL, 'CHEFE REP. INFORMATICA CMDO DA RM NORTE', '2022-12-01'),
(1156, 228, 123, 121, NULL, 'PROFESSOR  SISTEMA INFORMATICO ACADEMIA MILITAR/EME', '2022-12-01'),
(1157, 180, 260, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1158, 104, 4, 128, NULL, 'AUX. P/ESTATISTICA SEC. PLAN. REP. PLAN./DIMO/EME', '2022-12-01'),
(1159, 311, 60, 117, NULL, 'OF. PLAN. SIST. INFORMACAO REP. INFORMATICA RM CENTRO', '2022-12-01'),
(1160, 108, 105, 129, NULL, 'FINALISTA 17º CURSO FORMACAO SARGENTOS/ESCOLA INTER ARMAS SARGENTOS/EXE', '2022-12-01'),
(1161, 180, 376, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1162, 180, 268, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1163, 180, 382, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1164, 737, 225, 123, NULL, 'FINALISTA DO 4º ANO CURSO DE INFORMATICA ISTM/EMG', '2022-12-01'),
(1165, 180, 248, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1166, 181, 126, 136, NULL, 'AMANUENSE SEC. SAUDE RGTO DAA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1167, 275, 101, 133, NULL, 'OP. COMPUTADOR REPARTICAO ACCAO SOCIAL DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1168, 181, 372, 136, NULL, 'AT. LG 2ª SEC. PTAO G. GUARNICAO CCS 52ª BrI  RM NORTE', '2022-12-01'),
(1169, 426, 194, 136, NULL, 'AMANUENSE SECRETARIA CMDO E/MAIOR 4ª DIVISAO INFª RM CENTRO', '2022-12-01'),
(1170, 426, 184, 136, NULL, 'CONDUTOR AUTO DRM RM SUL', '2022-12-01'),
(1171, 181, 189, 136, NULL, 'OP. COMPUTADOR SEC. PSS/QUADROS 61ª BrIM 6ª DIV. INFº  RM SUL', '2022-12-01'),
(1172, 703, 55, 113, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS OPERACIONAL/EMGFAA', '2022-12-01'),
(1173, 180, 241, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1174, 180, 245, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1175, 77, 124, 121, NULL, 'OFICIAL FINANC. REP FINANC.  RM SUL', '2022-12-01'),
(1177, 180, 271, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1178, 670, 86, 129, NULL, NULL, '2022-12-01'),
(1179, 327, 43, 129, NULL, 'OPERADOR COMPUTADOR CPD 71ª BrI RM NORTE', '2022-12-01'),
(1180, 149, 110, 129, NULL, 'MEC. ARMTO CIA REP. ARMTO BTAO MOVEL REP. 5ª DIV/RM SUL', '2022-12-01'),
(1181, 108, 121, 129, NULL, 'FINALISTA 17º CURSO FORMACAO SARGENTOS/ESCOLA INTER ARMAS SARGENTOS/EXE', '2022-12-01'),
(1182, 680, 262, 123, NULL, 'FINALISTA 10º CURSO DE FORMACAO DE OFICIAIS/EMGFAA', '2022-12-01'),
(1183, 180, 242, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1184, 703, 54, 113, NULL, 'OFICIAL DE PLANEAMENTO DA REPARTICAO DE INFORMACAO DA REGIAO MILITAR LUANDA/EMGFAA', '2022-12-01'),
(1186, 737, 230, 123, NULL, 'FINALISTA DO 4º ANO CURSO DE INFORMATICA ISTM/EMG', '2022-12-01'),
(1187, 149, 383, 136, NULL, 'CONDUTOR AUTO 2º CMDTE 2º CORPO EXE', '2022-12-01'),
(1188, 180, 264, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1189, 600, 155, 117, NULL, 'OFICIAL VIVERES E VESTUARIO REPARTICAO LOGISTICA 4ª DIVISAO INFª RM CENTRO', '2022-12-01'),
(1190, 149, 117, 121, NULL, 'CHEFE CPD 20ª BRIM/RM NORTE', '2022-12-01'),
(1191, 108, 95, 129, NULL, 'FINALISTA 17º CURSO FORMACAO SARGENTOS/ESCOLA INTER ARMAS SARGENTOS/EXE', '2022-12-01'),
(1192, 181, 127, 136, NULL, 'AMANUENSE SEC. PESOAL E QUADROS RGTO DAA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1193, 181, 194, 136, NULL, 'OP. COMPUTADOR SECCAO INFORMATICA 4ª DIV. INF. RM CENTRO', '2022-12-01'),
(1194, 149, 71, 129, NULL, 'OPERADOR COMP. SEC. INFORMATICA DIR. INSTR. ENSINO/CEXE', '2022-12-01'),
(1195, 412, 158, 128, NULL, 'OPERADOR COMPUTADOR SECCAO INFORMATICA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1196, 180, 204, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1197, 412, 28, 128, NULL, 'AMANUENSE SECCAO PESSOAL E QUADROS 11ª BrI 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1198, 368, 288, 136, NULL, 'FINALISTA DO 14º CURSO INSTRUCAO BASICA CI HUAMBO', '2022-12-01'),
(1199, 376, 286, 136, NULL, 'FINALISTA DO 8º CURSO INSTRUCAO BASICA CI LUENA', '2022-12-01'),
(1200, 749, 207, 121, NULL, NULL, '2022-12-01'),
(1201, 376, 287, 136, NULL, 'FINALISTA DO 8º CURSO INSTRUCAO BASICA CI LUENA', '2022-12-01'),
(1202, 128, 366, 136, NULL, 'ARQ. EXP. ARQUIVO DIR. INFORMATICA/CEXE', '2022-12-01'),
(1203, 534, 293, 136, NULL, 'FINALISTA 4º CURSO CENTRO INSTRUCAO SANTA EULALIA/EXE', '2022-12-01'),
(1204, 737, 102, 123, NULL, 'FINALISTA DO 4º ANO CURSO DE INFORMATICA ISTM/EMG', '2022-12-01'),
(1205, 745, 275, 121, NULL, 'FINALISTAS 11º CURSO DE FORMACAO DE OFICIAIS ESCOLA DE ADMINISTRACAO MILITAR/EMGFAA', '2022-12-01'),
(1206, 441, 340, 121, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDOS) LICENCA Nº 0051/CMDTE EXE/2017 DE 03 DE JUNHO (3 ANOS)', '2022-12-01'),
(1207, 441, 341, 121, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDOS) LICENCA Nº 0050/CMDTE EXE/2017 DE 03 DE JUNHO (3 ANOS)', '2022-12-01'),
(1208, 590, 267, 121, NULL, 'CHEFE CENTRO PROCESSAMENTO DDADOS DEPOSITO MAT. GUERRA RM CENTRO', '2022-12-01'),
(1209, 534, 294, 136, NULL, 'FINALISTA 4º CURSO CENTRO INSTRUCAO SANTA EULALIA/EXE', '2022-12-01'),
(1211, 180, 244, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1212, 737, 222, 123, NULL, 'FINALISTA DO 4º ANO CURSO DE INFORMATICA ISTM/EMG', '2022-12-01'),
(1213, 737, 223, 123, NULL, 'FINALISTA DO 4º ANO CURSO DE INFORMATICA ISTM/EMG', '2022-12-01'),
(1214, 368, 289, 136, NULL, 'FINALISTA DO 14º CURSO INSTRUCAO BASICA CI HUAMBO', '2022-12-01'),
(1215, 180, 259, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1216, 180, 246, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1217, 180, 267, 121, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1218, 181, 193, 136, NULL, 'OP. COMPUTADOR SEC. INFORMATICA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1219, 528, 295, 136, NULL, 'FINALISTA 15º CURSO CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1220, 73, 148, 126, NULL, ' OPERADOR COMPUTADOR REPART. ORG. PLANEAMENTO DIREC. LOGISTICA/EME', '2022-12-01'),
(1221, 425, 67, 117, NULL, ' 1º OF. P/PLANEAM.  E SISTEMAS DE INFORMACAO REP. DE INFORMATICA RM LESTE', '2022-12-01'),
(1222, 195, 220, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1223, 458, 23, 115, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS DO EXERCITO', '2022-12-01'),
(1225, 324, 185, 128, NULL, 'OPERADOR CPD REP.PESSOAL E QUADROS RM CENTRO', '2022-12-01'),
(1226, 76, 68, 129, NULL, NULL, '2022-12-01'),
(1227, 489, 34, 115, NULL, 'OFICIAL DE DESENVOLVIMENTO DE SISTEMAS DA SECCAO DE INFORMACAO DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(1228, 592, 239, 129, NULL, 'DESENH. SEC. PRONT. COMB. ANALISE REP. PLANEAMENTO DIR. OPERACOES/EXE', '2022-12-01'),
(1229, 524, 292, 136, NULL, 'FINALISTA 9º CURSO CENTRO INSTRUCAO HUAMBO/EXE', '2022-12-01'),
(1230, 749, 208, 121, NULL, NULL, '2022-12-01'),
(1231, 73, 51, 128, NULL, 'OPERADOR CPD DIREC. ARMAMENTO TECNICA/EME', '2022-12-01'),
(1232, 311, 168, 117, NULL, 'OFICIAL REDES REP. ASSEGUR. TECNICO DIR. INFORMATICA EME', '2022-12-01'),
(1233, 431, 173, 126, NULL, 'OPERADOR COMPUTADOR SEC. EXPEDIENTE E ARQUIVO DIRECCAO INFORMATICA/EME', '2022-12-01'),
(1234, 477, 27, 115, NULL, 'CHEFE DE SECCAO DE PSICO-PEDAGOGIA E ORIENTACAO EDUCACIONAL DA REPARTICAO DE ENSINO ESCOLA INTER-ARMAS DE SARGENTOS DO EXERCITO', '2022-12-01'),
(1235, 195, 217, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1236, 445, 41, 115, NULL, 'CHEFE DE SECCAO DE RECRUTAMENTO E MOBILIZACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUANZA SUL', '2022-12-01'),
(1237, 445, 47, 115, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(1238, 555, 240, 136, NULL, 'OP. APONT. BTAO INFª BMP BTR-90 42ª BrI. RM NORTE', '2022-12-01'),
(1239, 458, 42, 113, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1240, 125, 108, 129, NULL, NULL, '2022-12-01'),
(1241, 626, 12, 128, NULL, 'OPERADOR 2º TURNO REPART. OPERACOES RM SUL', '2022-12-01'),
(1242, 626, 206, 129, NULL, 'OPERADOR COMPUTADOR REPARTICAO OPERACOES RM SUL', '2022-12-01'),
(1243, 631, 221, 129, NULL, 'AUXILIAR SECCAO DE ENGª E SAPADORES 41ª BrIM 4ª DIVISAO INFª RM CENTRO', '2022-12-01'),
(1244, 561, 179, 128, NULL, 'OPERADOR DE COMPUTADOR CPD SERVIDAO MILITAR DO EXERCITO/MARIA TERESA', '2022-12-01'),
(1245, 555, 99, 136, NULL, 'APONT. BTAO ANTI-TANQUES 60ª BrIM 6ª DIV. INFª RM SUL', '2022-12-01'),
(1246, 555, 258, 136, NULL, 'OPERADOR RADIO SECCAO VEICULO ESTADO MAIOR PTAO RADIO CIA TELECOM. 22ª Brl 2ª DIV. RM NORTE', '2022-12-01'),
(1247, 555, 257, 136, NULL, 'CMDTE ESQ. 1ª SEC. 1º PTAO 2ª CIA BTAO PM RGTO PME/EXE', '2022-12-01'),
(1248, 555, 93, 136, NULL, 'BATE CHAPA CH. CIA MANUT. 12ª BrI. 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1249, 633, 61, 115, NULL, 'CHEFE SECCAO DE INFORMATICAO 6ª DIVISAO INFª MOTORIZADA RM SUL', '2022-12-01'),
(1250, 633, 42, 115, NULL, 'OFICIAL PLANEAMENTO E SISTEMAS DE INFORMACAO REPARTICAO DE INFORMATICA RM NORTE', '2022-12-01'),
(1251, 35, 369, 121, NULL, 'FINALISTA 1º CURSO NIVEL MEDIO FORMACAO OFICIAIS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1252, 493, 80, 120, NULL, 'PROF. INFORMATICA CATEDRA MATERIAIS GERAIS EIAS-LUBANGO/EXE', '2022-12-01'),
(1253, 559, 78, 121, NULL, 'CMDTE PTO MANUTENCAO CCS 101ª BRIGª TANQUES/EXE', '2022-12-01'),
(1254, 650, 178, 111, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE', '2022-12-01'),
(1255, 748, 224, 123, NULL, NULL, '2022-12-01'),
(1256, 748, 237, 123, NULL, NULL, '2022-12-01'),
(1257, 748, 227, 123, NULL, NULL, '2022-12-01'),
(1258, 748, 228, 123, NULL, NULL, '2022-12-01'),
(1259, 748, 238, 123, NULL, NULL, '2022-12-01'),
(1260, 651, 55, 113, NULL, 'CHEFE REPARTICAO DE GESTAO TECNOLOGIA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1261, 559, 211, 120, NULL, 'PROGRAMADOR CPD AME', '2022-12-01'),
(1262, 716, 163, 127, NULL, 'SGTO EM INACTIVIDADE TEMPORARIA/EMG (POR RAZOES DE ESTUDOS)', '2022-12-01'),
(1263, 349, 294, 136, NULL, 'OPERADOR COMP. C.P.D. 71ª BRIG/RM NORTE', '2022-12-01'),
(1264, 650, 42, 115, NULL, 'CHEFE REPARTICAO DE INFORMATICA RM NORTE', '2022-12-01'),
(1265, 650, 142, 117, NULL, 'PROGRAMADOR CENTRO DE PROCESSAMENTO DE DADOS DAS OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(1266, 79, 300, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1267, 647, 103, 129, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMENTO DADOS DEP. MAT. GUERRA/RM SUL', '2022-12-01'),
(1268, 349, 292, 136, NULL, 'OPERADOR COMP. C.P.D. 101ª BRIG. TANQUES/EXE', '2022-12-01'),
(1269, 56, 286, 123, NULL, 'FINALISTA 1º CURSO NIVEL MEDIO FORMACAO OFICIAIS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1271, 396, 59, 120, NULL, 'OFICIAL PESSOAL E QUADROS 2º BTAO 11ª BrI 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1272, 198, 313, 121, NULL, 'OFICIAL INFORMATICA REPARTICAO GESTAO TECNOLOGIA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1273, 433, 294, 133, NULL, 'MATRICULA DE ALUNOS DO 20º CURSO DE FORMACAO DE SARGENTOS MELICIANO', '2022-12-01'),
(1274, 38, 331, 45, NULL, 'SANITARIO ESCOLA PRATICA DE CONSTRUCAO/EXE', '2022-12-01'),
(1275, 279, 104, 131, NULL, 'OPERADOR COMPUTADOR CPD 75ª BRIM 3ª DIVISAO RM LESTE', '2022-12-01'),
(1276, 134, 266, 121, NULL, 'FINALISTA DE CURSO DE FORMACAO DE OFICIAIS DE TROPAS DE ARTILHARIA TERRESTRE NA ACADEMIA MILITAR DA REPUBLICA DA SERVIA', '2022-12-01'),
(1277, 337, 358, 136, NULL, 'FINALISTA 9º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1278, 338, 275, 121, NULL, 'OFICIAL SISTEMA INFORMACAO GEOGRAFICA DIR. INFORMATICA/EXE', '2022-12-01'),
(1279, 198, 316, 120, NULL, '1º PROFESSOR INGLES DEPARTAMENTO CIENCIAS SOCIAIS E HUMANAS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1280, 747, 131, 115, NULL, 'OFICIAL DE SEGURANCA E AUDITORIA DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1281, 198, 315, 121, NULL, 'PROFESSOR PROGRAMACAO BASE DADOS DEPARTAMENTO CIENCIAS EXACTAS E NATURAIS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1282, 338, 76, 120, NULL, 'TECNICO HARDWARE SECCAO INFORMATICA DIRECCAO INTRUCAO E ENSINO/EXE', '2022-12-01'),
(1283, 267, 37, 117, NULL, 'OFICIAL CPD DO DISTRTO DE RECRUTAMENTO E MOBILIZACAO/HUILA', '2022-12-01'),
(1284, 340, 220, 129, NULL, 'OPERADOR DE COMPUTADOR DA REPARTIÇÃO DE REGISTO E IDENTIFICAÇÃO DA DIRECÇÃO DE PESSOAL E QUADROS DO EXÉRCITO', '2022-12-01'),
(1285, 751, 109, 121, NULL, 'TESOUREIRO DA SECCAO DE FINANCAS DO DEPARTAMENTO DE ADMINISTRACAO E FINANCAS DO CENTRO MILITAR DE HIGIENE EPIDEMIOLOGIA/EMGFAA', '2022-12-01'),
(1286, 221, 284, 121, NULL, 'FINALISTA DO CURSO DE ENGENHARIA INFORMATICA NO INSTITUTO TECNICO MILITAR ´´JOSE MARTI´´/CUBA', '2022-12-01'),
(1287, 221, 285, 121, NULL, 'FINALISTA DO CURSO DE ENGENHARIA INFORMATICA NO INSTITUTO TECNICO MILITAR ´´JOSE MARTI´´/CUBA', '2022-12-01'),
(1288, 62, 268, 120, NULL, 'CHEFE DO CPD 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(1289, 378, 142, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA OGR/EXE', '2022-12-01'),
(1290, 378, 208, 120, NULL, 'OFICIAL PROGRAMADOR DA REPARTICAO DE DESENVOLVIMENTO E SISTEMAS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1291, 135, 303, 133, NULL, 'CHEFE DE TELENUTRISTA DA SECCAO ARTILHARIA DO GRUPO DE ARTILHARIA DA 74ª BRIGADAINFª RM CENTRO', '2022-12-01'),
(1292, 135, 111, 133, NULL, 'APONTADOR 1ª DOT PTAO FOGO BTAO MORTEITO 82ª MM 1º BTAO 12ª BRIGADA 1ª DIV. RM CABINDA', '2022-12-01'),
(1293, 62, 248, 120, NULL, 'COMANDANTE  DE PTAO 1ª CIA 3ª BTAO 31ª BRI 3ª DIV INFª RM LESTE', '2022-12-01'),
(1294, 356, 368, 133, NULL, 'AMANUENSE DESENHADOR SEC. PRECOM 22ª Brl 2ª DIV. RM NORTE', '2022-12-01'),
(1295, 356, 126, 133, NULL, 'AMANUENSE SEC. SAUDE RGTO DAA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1296, 557, 52, 128, NULL, 'AUXILIAR REDES E HARDWARE CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1297, 356, 127, 133, NULL, 'AMANUENSE SEC. PESOAL E QUADROS RGTO DAA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1298, 753, 102, 121, NULL, 'CURSO DE ENGENHARIA DE INFORMATICA ISTM', '2022-12-01'),
(1299, 549, 390, 136, NULL, 'CPD 70ª BrIM RM NORTE', '2022-12-01'),
(1300, 549, 309, 136, NULL, 'CPD UNIDADE APOIO RM LESTE', '2022-12-01'),
(1301, 356, 193, 133, NULL, 'OP. COMPUTADOR SEC. INFORMATICA 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1302, 549, 290, 136, NULL, 'CPD 62ª BrI RM LESTE', '2022-12-01'),
(1303, 549, 297, 136, NULL, 'CDP 51ª BrIM 5ª DIV. INFª RM SUL', '2022-12-01'),
(1304, 549, 310, 136, NULL, 'CPD 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1305, 549, 306, 136, NULL, 'CPD HMR RM CABINDA', '2022-12-01'),
(1306, 549, 298, 136, NULL, 'CDP DMG RM SUL', '2022-12-01'),
(1307, 563, 272, 129, NULL, 'OPERADOR DO CENTRO PROCESSAMENTO DE DADDOS DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(1308, 727, 76, 120, NULL, 'OFICIAL DISPONIVEL/EXE', '2022-12-01'),
(1309, 753, 210, 121, NULL, 'CURSO DE ENGENHARIA DE INFORMATICA ISTM', '2022-12-01'),
(1311, 151, 291, 121, NULL, 'FINALISTA CURSO MANDO DE TROPAS DE INFANTARIA (NIVEL MEDIO) ESCOLA INTER-ARMAS ANTONIO MACEO/CUBA', '2022-12-01'),
(1312, 36, 76, 120, NULL, 'OFICIAL DE CAMPO DO CHEFE DE DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1313, 36, 58, 117, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS DO EXERCITO', '2022-12-01'),
(1314, 728, 87, 128, NULL, 'OPERADOR COMPUTADOR GABINETE TEC. ATENDIMENTO GESTAO ASSUNTOS EX-MILITARES DPPQ/EMGFAA', '2022-12-01'),
(1315, 301, 338, 136, NULL, 'FINALISTA 11º CURSO INSTRUTOR BASICA MILITAR SANTA EULALIA/EXE', '2022-12-01'),
(1316, 80, 47, 117, NULL, 'CHEFE SECCAO DE INFORMATICA 5ª DIVISAO INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(1317, 292, 243, 136, NULL, 'FINALISTA 11º CURSO INSTRUCAO BASICA MILITA CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1318, 301, 331, 136, NULL, 'FINALISTA 11º CURSO INSTRUTOR BASICA MILITAR SANTA EULALIA/EXE', '2022-12-01'),
(1319, 301, 319, 136, NULL, 'FINALISTA 11º CURSO INSTRUTOR BASICA MILITAR SANTA EULALIA/EXE', '2022-12-01'),
(1320, 313, 374, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1321, 276, 322, 136, NULL, 'FINALISTA 1º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO TOLA/EXE', '2022-12-01'),
(1323, 170, 336, 136, NULL, 'ALUNO DO 8º CURSO FORMACAO DE ESPECIALISTAS PROTECCAO NUCLEAR B. E QUIMICA', '2022-12-01'),
(1324, 397, 330, 133, NULL, 'FINALISTA 2º CURSO DE ESPECIALIZACAO INFANTARIA/EXE', '2022-12-01'),
(1325, 313, 320, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1326, 58, 163, 127, NULL, 'AJUDANTE P/MANUSEAMENTO DE MATERIAIS CLASSIFICADOS DA SECCAO DE EXPEDIENTE E ARQUIVO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1327, 313, 327, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1328, 574, 146, 117, NULL, 'OFICIAL DISPONIVEL/EXE', '2022-12-01'),
(1329, 276, 337, 136, NULL, 'FINALISTA 1º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO TOLA/EXE', '2022-12-01'),
(1330, 730, 137, 115, NULL, 'OFICIAL DE SISTEMAS E SERVIDORES DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1331, 292, 331, 136, NULL, 'FINALISTA 11º CURSO INSTRUCAO BASICA MILITA CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1332, 301, 335, 136, NULL, 'FINALISTA 11º CURSO INSTRUTOR BASICA MILITAR SANTA EULALIA/EXE', '2022-12-01'),
(1333, 313, 325, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1334, 276, 332, 136, NULL, 'FINALISTA 1º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO TOLA/EXE', '2022-12-01'),
(1335, 391, 269, 123, NULL, 'CADETE INSTITUTO TECNICO MILITAR \"JOSE MARTI\" REPUBLICA DE CUBA', '2022-12-01'),
(1336, 566, 291, 121, NULL, 'COMANDANTE 2º PELOTAO 1ª COMPANHIA 2º BATALHAO INFANTARIA 71ª BRIGADA INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1337, 292, 334, 136, NULL, 'FINALISTA 11º CURSO INSTRUCAO BASICA MILITA CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1338, 570, 268, 121, NULL, 'CHEFE CPD 101ª BrI TANQUES/EXE', '2022-12-01'),
(1339, 570, 241, 121, NULL, 'CHEFE CPD 21ª BrIL RM NORTE', '2022-12-01'),
(1340, 130, 288, 133, NULL, 'OPERADOR COMPUTADOR CPD SEC. INFORMATICA 3ª DIV. RM LESTE', '2022-12-01'),
(1341, 110, 290, 133, NULL, 'OPERADOR COMPUTADOR CPD 62ª BrIM RM LESTE', '2022-12-01'),
(1342, 276, 323, 136, NULL, 'FINALISTA 1º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO TOLA/EXE', '2022-12-01'),
(1343, 574, 27, 117, NULL, 'CHEFE SECCAO PSICO PEDAGOGIA E ORIENTACAO EDUCACIONAL REP. ENSINO ESCOLA INTER ARMAS  SARGENTOS/EXE', '2022-12-01'),
(1344, 110, 366, 133, NULL, 'ARQUIVISTA SECCAO EXPEDIENTE E ARQUIVO DIR. INFORMATICA/EXE', '2022-12-01'),
(1345, 732, 174, 113, NULL, 'CHEFE DE SECCAO DE INFORMATICA DAS OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(1346, 292, 330, 136, NULL, 'FINALISTA 11º CURSO INSTRUCAO BASICA MILITA CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1347, 574, 246, 121, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS DIRECAO PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(1348, 574, 26, 117, NULL, 'OFICIAL DISPONIVEL/EXE', '2022-12-01'),
(1349, 313, 321, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1350, 292, 328, 136, NULL, 'FINALISTA 11º CURSO INSTRUCAO BASICA MILITA CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1351, 276, 336, 136, NULL, 'FINALISTA 1º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO TOLA/EXE', '2022-12-01'),
(1352, 576, 115, 129, NULL, 'OPERADOR COMPUTADOR SECCAO INFORMATICA DIRECAO INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(1353, 574, 77, 120, NULL, 'OFICIAL TECNICO REDES SECCAO INFORMATICA DIRECCAO PRECOM/EXE', '2022-12-01'),
(1354, 130, 303, 136, NULL, 'CONDUTOR-AUTO SEC. MANUT. PTAO MANUT. CIA MANUT. 74ª BrI RM CENTRO', '2022-12-01'),
(1355, 732, 165, 115, NULL, 'OFICIAL DE PLANEAMENTO E ORGANIZACAO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1356, 391, 270, 123, NULL, 'CADETE INSTITUTO TECNICO MILITAR \"JOSE MARTI\" REPUBLICA DE CUBA', '2022-12-01'),
(1357, 391, 265, 123, NULL, 'CADETE INSTITUTO TECNICO MILITAR \"JOSE MARTI\" REPUBLICA DE CUBA', '2022-12-01'),
(1358, 391, 236, 123, NULL, 'CADETE ESCOLA MILITAR REPUBLICA POPULAR DA CHINA', '2022-12-01'),
(1359, 110, 294, 133, NULL, 'OPERADOR COMPUTADOR CPD 71ª BrIM RM NORTE', '2022-12-01'),
(1360, 110, 292, 133, NULL, 'OPERADOR COMPUTADOR CPD 101ª BRIGADA TANQUES/EXE', '2022-12-01'),
(1361, 59, 243, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1362, 130, 363, 133, NULL, 'ARQUIVISTA SECRETARIA GERAL 73ª BrIM RM CENTRO', '2022-12-01'),
(1363, 574, 168, 117, NULL, 'ADMINISTRADOR BASE DADOS CPDP DIRECCAO INFORMATICA/EXE', '2022-12-01'),
(1364, 292, 329, 136, NULL, 'FINALISTA 11º CURSO INSTRUCAO BASICA MILITA CENTRO INSTRUCAO LUENA/EXE', '2022-12-01'),
(1366, 59, 332, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1367, 576, 179, 128, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMENTO DADOS DIRECCAO PESSOAL E QUADRSO/EXE', '2022-12-01'),
(1368, 110, 307, 133, NULL, 'OPERADOR COMPUTADOR CPD 31ª BrIM RM LESTE', '2022-12-01'),
(1369, 110, 247, 133, NULL, 'OPERADOR COMPUTADOR CPD 41ª BrIM. RM CENTRO', '2022-12-01'),
(1370, 59, 319, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1371, 293, 79, 117, NULL, 'OFICIAL DISPONIVEL/EXE', '2022-12-01'),
(1373, 59, 327, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1374, 110, 308, 133, NULL, 'OPERADOR COMPUTADOR CPD 62ª BrIM RM LESTE', '2022-12-01'),
(1375, 110, 302, 133, NULL, 'OPERADOR COMPUTADOR CPD 101ª BRIGADA TANQUES/EXE', '2022-12-01'),
(1376, 110, 304, 133, NULL, 'OPERADOR COMPUTADOR CPD HMR RM CABINDA', '2022-12-01'),
(1377, 293, 59, 120, NULL, 'OFICIAL PESSOAL E QUADROS BTAO TANQUES 73ª BRIGADA DE INFANTARIA MOTORIZADA RM CENTRO', '2022-12-01'),
(1378, 249, 375, 120, NULL, 'CHEFE CPD CEM 31ª BrI. 3ª DIV. INFª RM LESTE', '2022-12-01'),
(1379, 357, 322, 136, NULL, 'OP. COMPUTADOR CPD  DPMG RM CENTRO', '2022-12-01'),
(1380, 37, 325, 133, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1381, 37, 321, 133, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1382, 81, 207, 120, NULL, 'OFICIAL DE PESQUISA E SISTEMAS EMBUTIDOS DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1383, 59, 338, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1384, 59, 334, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1385, 59, 323, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1386, 59, 322, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1387, 152, 331, 136, NULL, 'ALUNO DO 10º CURSO FORMACAO DE SANITARIOS', '2022-12-01'),
(1388, 293, 23, 117, NULL, 'OFICIAL SISTEMAS DE INFORMACAO GEOGRAFICA CENTRO PROCESSAMENTO DADOS DIRECCAO INFORMATICA DO EXERCITO', '2022-12-01'),
(1389, 59, 325, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1390, 59, 320, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1391, 59, 321, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1392, 59, 324, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1393, 59, 326, 136, NULL, 'ALUNO DO 5º CURSO FORMACAO DE OPERADORES DE COMPUTADOR', '2022-12-01'),
(1394, 264, 272, 129, NULL, 'OPERADOR COMPUTADOR CPD DIR. OPERACOES/EXE', '2022-12-01'),
(1395, 217, 328, 136, NULL, 'ALUNO DO 13º CURSO FORMACAO DE CONDUTORES MECANICOSDE CARROS BLINDADOS', '2022-12-01'),
(1396, 217, 329, 136, NULL, 'ALUNO DO 13º CURSO FORMACAO DE CONDUTORES MECANICOSDE CARROS BLINDADOS', '2022-12-01'),
(1397, 413, 373, 45, NULL, 'OPERADOR COMPUTADOR SECCAO PESSOAL E QUADROS CI-MATALA/EXE', '2022-12-01'),
(1398, 81, 225, 120, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1399, 81, 230, 120, NULL, 'TECNICO DE SUPORTE DE UTILIZADOR (HELP-DESK) DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1400, 432, 102, 121, NULL, 'OFICIAL PROCESSAMENTO DE DADOS CENTRO PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1401, 277, 330, 133, NULL, 'AMANUENSE GAB. CMDTE 2º BTAO 30ª BrIM RM LESTE', '2022-12-01'),
(1402, 427, 44, 117, NULL, 'OFICIAL DE DESENVOLVIMENTO DE SISTEMAS DA SECCAO DE INFORMATICA DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(1403, 413, 281, 45, NULL, 'CMDTE 3ª SECCAO 3º PELOTAO CIA CMDO E SVC CCS-HUILA REGIAO MILITAR SUL', '2022-12-01'),
(1404, 314, 321, 136, NULL, 'OP. COMPUTADOR 21ª BRIGADA INFª RM SUL', '2022-12-01'),
(1405, 314, 334, 136, NULL, 'OP. COMPUTADOR 62ª BRIGADA INFª RM NORTE', '2022-12-01'),
(1406, 314, 338, 136, NULL, 'OP. COMPUTADOR 31ª BRIGADA INFª RM NORTE', '2022-12-01'),
(1407, 314, 323, 136, NULL, 'OP. COMPUTADOR 21ª BRIGADA INFª RM SUL', '2022-12-01'),
(1408, 314, 322, 136, NULL, 'OP. COMPUTADOR 32ª BRIGADA INFª RM LESTE', '2022-12-01'),
(1409, 314, 327, 136, NULL, 'OP. COMPUTADOR 31ª BRIGADA INFª RM LESTE', '2022-12-01'),
(1410, 314, 320, 136, NULL, 'OP. COMPUTADOR CPD 101ª BRIGADA TANQUES/EXE', '2022-12-01'),
(1412, 314, 337, 136, NULL, 'OP. COMPUTADOR 61ª BRIGADA INFª RM SUL', '2022-12-01'),
(1413, 314, 332, 136, NULL, 'OP. COMPUTADOR 75ª BRIGADA INFª RM NORTE', '2022-12-01'),
(1414, 171, 236, 121, NULL, 'CADETE ESCOLA MILITAR REPUBLICA POPULAR DA CHINA', '2022-12-01'),
(1415, 314, 324, 136, NULL, 'OP. COMPUTADOR CPD 101ª BRIGADA TANQUES/EXE', '2022-12-01'),
(1416, 314, 326, 136, NULL, 'OP. COMPUTADOR CPD HOSPITAL REGIONAL RM CENTRO', '2022-12-01'),
(1417, 314, 319, 136, NULL, 'OP. COMPUTADOR  32ª BRIGADA INFª RM LESTE', '2022-12-01'),
(1418, 432, 222, 121, NULL, 'OFICIAL GESTOR DE MAPAS DIGITAIS CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1419, 432, 223, 121, NULL, 'OFICIAL DE HARDWER DIRECCAO DE ARMTO E TECNICA/EXE', '2022-12-01'),
(1420, 314, 243, 136, NULL, 'OP. COMPUTADOR 4ª BRIGADA DIV. RM CENTRO', '2022-12-01'),
(1421, 314, 325, 136, NULL, 'OP. COMPUTADOR CPD DIR. PESSOAL QUADROS/EXE', '2022-12-01'),
(1422, 357, 374, 136, NULL, 'AT. MET. LIGEIRO 1ª SECCAO 1º PTAO 1ª CIA 2º BTAO 32ª BrI. 3ª DIV. INFª RM LESTE', '2022-12-01'),
(1423, 81, 210, 120, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1424, 302, 342, 136, NULL, 'FINALISTA 12º CURSO INSTRUCAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1425, 404, 73, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 20ª BrI DA REGIAO MILITAR NORTE', '2022-12-01'),
(1426, 489, 55, 111, NULL, 'CHEFE DE REPARTICAO DE GESTAO DE TECNOLOGIAS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1427, 234, 258, 136, NULL, 'OPERADOR COMPUTADOR CPD HOSPITAL REGIONAL MILITAR CENTRO', '2022-12-01'),
(1428, 410, 286, 123, NULL, 'TECNICO REDES E HARDWARE CPD DIRECCAO ADMINISTRACAO FINANCAS/EXE', '2022-12-01'),
(1429, 410, 117, 121, NULL, 'OF. PROCESSAMENTO DADOS DRM CUANZA-NORTE RM NORTE', '2022-12-01'),
(1430, 432, 210, 121, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1431, 315, 343, 136, NULL, 'FINALISTA 8º CURSO INSTRUCAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1432, 740, 54, 113, NULL, 'INACTIVIDADE TEMPORARIA POR RAZOES DE SAUDE/EXE', '2022-12-01'),
(1434, 432, 230, 121, NULL, 'TECNICO DE SUPORTE DE UTILIZADOR (HELP-DESK) DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1437, 494, 128, 120, NULL, 'CHEFE SECRETARIA ESCOLA PRATICA CONSTRUCAO/EXE', '2022-12-01'),
(1438, 475, 240, 45, NULL, 'OPERADOR COMPUTADOR SEC. ADMINISTRACAO DISTRITO RECRUTAMENTO MOBILIZACAO MALANGE EXE1', '2022-12-01'),
(1439, 81, 208, 120, NULL, 'OFICIAL GESTAO DE MAPAS DIGITAIS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1440, 432, 225, 121, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1441, 437, 209, 129, NULL, 'SARGENTO DISPONIVEL/EXE', '2022-12-01'),
(1442, 278, 88, 136, NULL, 'ATIRADOR AKM 3ª SEC. 1º PTAO 1ª CIA 2º BTAO INFª 73ª BrIM RM CENTRO', '2022-12-01'),
(1443, 81, 291, 120, NULL, 'FINALISTA CURSO MANDO DE TROPAS DE INFANTARIA (NIVEL MEDIO) ESCOLA INTER-ARMAS ANTONIO MACEO/CUBA', '2022-12-01'),
(1444, 234, 274, 136, NULL, 'CONDUTOR-AUTO COMPANHIA ASSEGURAMENTO TANQUES ESCOLA FORMACAO CONDUTOR-AUTO/EXE', '2022-12-01'),
(1445, 198, 317, 120, NULL, 'PROFESSOR INFORMATICA DEPARTAMENTO CIENCIAS EXACTAS E NATURAIS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1446, 484, 143, 117, NULL, 'OFICIAL PLANEAMENTO E SISTEMAS DE INFORMACAO REPARTICAO DE INFORMATICA REGIAO MILITAR CENTRO', '2022-12-01'),
(1447, 515, 254, 129, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DE LUANDA', '2022-12-01'),
(1448, 315, 345, 136, NULL, 'FINALISTA 8º CURSO INSTRUCAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1449, 739, 275, 121, NULL, 'OFICIAL DISPONIVEL/EXE', '2022-12-01'),
(1450, 481, 302, 133, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMENTO DADOS 101ª BRIGADA TANQUES/EXE', '2022-12-01'),
(1452, 486, 253, 129, NULL, 'OPERADOR DE COMPUTADOR REPARTICAO DE ESTUDOS E PLANEAMENTOS DPQ/EXE', '2022-12-01'),
(1453, 265, 21, 129, NULL, 'OPERADOR DO CENTRO DE PROCESSAMENTO DE DADOS DO DMG DA RM CABINDA', '2022-12-01'),
(1454, 265, 85, 129, NULL, 'OPERADOR COMPUTADOR DRM LUANDA', '2022-12-01'),
(1455, 250, 29, 120, NULL, 'CHEFE PROCESSAMENTO DADOS DEPOSITO MATERIAL GUERRA RM SUL', '2022-12-01'),
(1456, 469, 59, 120, NULL, 'OFICIAL PESSOAL  QUADROS 1º BTAO INFANTARIA 72ª BRIM RM LESTE', '2022-12-01'),
(1457, 481, 293, 136, NULL, 'AT. AKM 2ª SEC. 2º PTAO POLIGNO INTER - ARMA RM CENTRO', '2022-12-01'),
(1458, 475, 115, 129, NULL, 'OPERADOR COMPUTADOR SEC. INFª DIRECCAO INSTRUCAO ENSINO/EXE', '2022-12-01'),
(1459, 315, 344, 136, NULL, 'FINALISTA 8º CURSO INSTRUCAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1460, 216, 311, 121, NULL, 'FINALISTA DO CURSO DE FORMACAO DE OFICIAIS DE INFANTARIA NA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1461, 475, 239, 129, NULL, 'AUXILIAR TURNO OPERATIVO POSTO CMDO DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1462, 235, 98, 128, NULL, 'AMANUENSE REPARTICAO DE PLANEAMENTO E ORGANIZACAO DA RM CENTRO', '2022-12-01'),
(1463, 198, 318, 120, NULL, 'PROFESSOR INFORMATICA DEPARTAMENTO CIENCIAS EXACTAS E NATURAIS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1464, 265, 169, 128, NULL, 'OPERADOR CENTRO PROCESSAMENTO DADOS DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1465, 469, 204, 121, NULL, 'OFICAIL EXPLORACAO TECNICA 6ª DIRECCAO/EXE', '2022-12-01'),
(1466, 198, 312, 121, NULL, 'PROFESSOR INFORMATICA DEPARTAMENTO CIENCIAS EXACTAS E NATURAIS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1468, 511, 236, 121, NULL, 'OFICIAL DE PROGRAMACAO DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(1469, 265, 11, 129, NULL, 'OPERADOR DE CONTROLO E REVISAO DEPOSITO MATERIAL GUERRA RM CABINDA', '2022-12-01'),
(1470, 338, 79, 117, NULL, 'OFICIAL DE CAMPO DO CHEFE DE DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1471, 350, 353, 136, NULL, 'FINALISTA 17º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1472, 350, 354, 136, NULL, 'FINALISTA 17º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1473, 198, 314, 120, NULL, 'FINALISTA DO CURSO DE FORMACAO DE OFICIAIS DE INFARIA NA ACADEMAI MILITAR/EXE', '2022-12-01'),
(1474, 337, 357, 136, NULL, 'FINALISTA 9º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1475, 280, 288, 129, NULL, 'FINALISTA DE CURSO DE FORMACAO DE SARGENTOS NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(1476, 328, 209, 129, NULL, 'OPERADOR COMPUTADOR CPD 41ª BRIGADA INFANTARIA 4ª DIVISAO INFANTARIA/RM CENTRO', '2022-12-01'),
(1477, 316, 352, 136, NULL, 'FINALISTA 13º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1478, 350, 355, 136, NULL, 'FINALISTA 17º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1479, 350, 356, 136, NULL, 'FINALISTA 17º CURSO INST. BASICA MILITAR/EXE', '2022-12-01'),
(1480, 236, 190, 128, NULL, 'OPERADOR DE COMPUTADOR DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO NAMIBE', '2022-12-01'),
(1481, 382, 374, 136, NULL, 'ATIRADOR AKM 2ª SECCAO 2º PTAO 6ª DIV. INFª RM SUL', '2022-12-01'),
(1482, 199, 376, 120, NULL, 'FINALISTA 3º CURSO FORMACAO OFICIAIS SMO/AME', '2022-12-01'),
(1483, 294, 153, 127, NULL, 'OPERADOR COMPUTADOR CPD UNIDADE APOIO/EXE', '2022-12-01'),
(1484, 132, 294, 129, NULL, 'FINALISTA 20º CURSO FORMACAO SGTO EIAS/EXE', '2022-12-01'),
(1485, 518, 383, 136, NULL, 'AGENTE PM 3ª SECCAO 2º PTAO BTAO PROCTECAO INDIVIDUALIDADES PROTOCOLARES RGTO PM/EXE', '2022-12-01'),
(1486, 489, 150, 115, NULL, 'PROFESSOR DE INFORMATICA DO CENTRO DE LINGUAIS DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(1487, 220, 72, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA UNIDADE DE APOIO/EXE', '2022-12-01'),
(1488, 477, 60, 115, NULL, 'OFICIAL DE SISTEMAS E SERVIDORES DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(1489, 477, 133, 115, NULL, 'OFICIAL DE PROCESSAMENTO DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS DO EXERCITO', '2022-12-01');
INSERT INTO `tbl_historico_progressao` (`id`, `idOrdem`, `idPessoa`, `CodPatente`, `Cargo_id`, `Cargo_por_normalizar`, `Data_Registo`) VALUES
(1490, 489, 58, 115, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1491, 406, 276, 123, NULL, 'CURSO DE CARTOGRAFIA E GEOINFORMATICA NA ACADEMIA MILITAR DE DEFESA COSMICA MOJAISKI (SAO PETERSBURGO) FEDERACAO RUSSA', '2022-12-01'),
(1492, 406, 277, 123, NULL, 'CURSO DE ASTRONOMOGEODEGIA NA ACADEMIA MILITAR DE DEFESA COSMICA MOJAISKI (SAO PETERSBURGO) FEDERACAO RUSSA', '2022-12-01'),
(1493, 489, 139, 111, NULL, 'CHEFE DE REPARTICAO DE INFORMATICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(1494, 512, 226, 121, NULL, 'OFICIAL BME UNIDADE APOIO/CEXE', '2022-12-01'),
(1495, 458, 67, 113, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(1496, 406, 391, 123, NULL, 'CURSO DE FORMACAO DE OFICIAIS NA REPUBLICA POPULARA DA CHINA', '2022-12-01'),
(1497, 281, 5, 127, NULL, 'OPERADOR CENTRO PROCESSAMENTO DADOS DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1498, 281, 212, 128, NULL, 'OPERADORA COMPUTADOR CPD DIR. INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(1499, 281, 214, 128, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMENTO DADOS DIRECCAO INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(1500, 281, 11, 128, NULL, 'OPERADOR DE CONTROLO  REVISAO DEPOSITO MATERIAL GUERRA RM CABINDA', '2022-12-01'),
(1501, 220, 227, 120, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1502, 220, 228, 120, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1503, 251, 8, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DO DEPOSITO MATERIAL GUERRA RM CABINDA', '2022-12-01'),
(1504, 498, 131, 115, NULL, 'OFICIAL DE PREPARACAO ESPECIAL DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EMGFAA', '2022-12-01'),
(1505, 477, 154, 115, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 3ª DIVISAO DE INFANTARIA  DA REGIAO MILITAR LESTE', '2022-12-01'),
(1506, 406, 263, 123, NULL, 'CURSO DE FORMACAO DE OFICIAIS NA REPUBLICA POPULARA DA CHINA', '2022-12-01'),
(1507, 445, 141, 111, NULL, 'CHEFE DA REPARTICAO DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(1509, 251, 36, 117, NULL, 'OFICIAL SIST. SERVIDOR REP DE INFORMATICA 4ª DIV. INF/RM CENTRO', '2022-12-01'),
(1510, 281, 70, 128, NULL, 'SGTO DA SECRETARIA DA 72ª BRIM DA RM LESTE', '2022-12-01'),
(1511, 445, 143, 115, NULL, 'OFICIAL DE PLANEAMENTO E SISTEMA DE INFORMATICO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(1512, 251, 164, 117, NULL, 'CHEFE SECCAO INFORMATICA ESCOLA FORMACAO CONDUTORES AUTO E BLINDADO/EXE', '2022-12-01'),
(1513, 220, 236, 120, NULL, 'OFICIAL DE PROGRAMACAO DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(1514, 220, 238, 120, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1515, 281, 121, 128, NULL, 'OPERADOR DE COMPUTADOR REPARTICAO ESTUDOS E PLANEAMENTO DIR. DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1516, 220, 224, 120, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1517, 266, 32, 127, NULL, 'OPERADOR COMPUTADOR CPD/ DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1518, 266, 33, 127, NULL, 'ADJUNTO CMDO 1º BTAO 51ª BrI/RM NORTE', '2022-12-01'),
(1519, 237, 312, 120, NULL, 'PROF. INFORMATICA DEP. C. S. HUMANAS E LIGUAS DA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1520, 237, 313, 120, NULL, 'OF. INFORMATICA REP. GESTAO TECNOLOGIAS DA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1521, 281, 169, 127, NULL, 'OPERADOR CENTRO PROCESSAMENTO DADOS DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1522, 251, 29, 117, NULL, 'CHEFE PROCESSAMENTO DADOS DEPOSITO MATERIAL GUERRA RM SUL', '2022-12-01'),
(1523, 281, 38, 128, NULL, 'OPERADOR CONTROLO REVISAO CPD DIR. INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(1526, 303, 253, 128, NULL, 'OPERADOR DE COMPUTADOR REPARTICAO DE ESTUDOS E PLANEAMENTOS DPQ/EXE', '2022-12-01'),
(1527, 237, 315, 120, NULL, 'PROF. PROGRAMACAO DEP. C. S. HUMANAS E LINGUAS DA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1528, 220, 237, 120, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1529, 220, 73, 117, NULL, 'OFICIAL DE EDUCACAO PATRIOTICA DO 2º BATALHAO DA 20ª BrIM RM NORTE', '2022-12-01'),
(1530, 220, 86, 120, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1531, 377, 93, 133, NULL, 'AMAN. SEC. AUD. E DISC. 12ª BrI. 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1532, 281, 181, 128, NULL, 'OPERADOR COMP SUB SEC INFORMATICA SEC ESTATISTCA HOSPITAL MILITAR REGIONAL/RM SUL', '2022-12-01'),
(1533, 281, 21, 128, NULL, 'OPERADOR DO CENTRO DE PROCESSAMENTO DADOS DO DMG RM CABINDA', '2022-12-01'),
(1534, 281, 161, 128, NULL, 'OPERADOR COMPUTADOR CPD REP PESSOAL E QUADROS/RM LESTE', '2022-12-01'),
(1535, 281, 158, 127, NULL, 'OPERADOR CONTROLO E REVISAO DA ACADEMIA MILITAR/EXE', '2022-12-01'),
(1536, 281, 15, 127, NULL, 'AUXILIAR DA SECCAO DE INFORMATICA DA 3ªDIV INFª/RM LESTE', '2022-12-01'),
(1537, 369, 123, 117, NULL, 'OFICIAL REGISTO REP. PLANEAMENTO DIRECCAO INFORMATICA/EXE', '2022-12-01'),
(1538, 303, 122, 128, NULL, 'SGTO PLANEAMENTO REPARTICAO PLANEAMENTO OPERATIVO DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(1539, 281, 198, 128, NULL, 'OPERADOR DE COMPUTADOR DO CPD DA RM LESTE', '2022-12-01'),
(1540, 329, 368, 131, NULL, 'AMANUENSE SECCAO PRECOM 22ª BRI. RM NORTE', '2022-12-01'),
(1541, 281, 221, 128, NULL, 'OPERADOR COMPUTADOR CPD OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(1542, 339, 373, 129, NULL, 'CMDTE 4ª SECCAO 4º PTAO 2ª CIA 3º BTAO CI-MATALA/EXE', '2022-12-01'),
(1543, 303, 118, 127, NULL, 'TECNICO DE SISTEMA DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(1544, 281, 179, 127, NULL, 'AJUDANTE DO CENTRO PROCESSAMENTO DADOS DIRECCAO PESSOAL E QUADRSO/EXE', '2022-12-01'),
(1545, 359, 218, 128, NULL, 'AMANUENSE OPERADOR COMPUTADOR REPARTICAO PESSOAL E QUADROS RM CENTRO', '2022-12-01'),
(1546, 359, 219, 128, NULL, 'AUXILIAR REGISTO CRM KUANDO KUBANGO RM SUL', '2022-12-01'),
(1547, 303, 52, 127, NULL, 'AUXILIAR REDES E HARDWARE CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1548, 281, 85, 128, NULL, 'OPERADOR COMPUTADOR DRM LUANDA', '2022-12-01'),
(1549, 377, 99, 133, NULL, 'AMAN. CMDO RGTO ARTª CAMPANHA 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1550, 220, 76, 117, NULL, 'OFICIAL TECNICO DE HARDWARE DA SECCAO INFORMATICA DIRECCAO INTRUCAO E ENSINO/EXE', '2022-12-01'),
(1551, 199, 77, 117, NULL, 'OFICIAL TECNICO REDES SECCAO INFORMATICA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(1552, 251, 78, 120, NULL, 'OFICIAL CATALOGADOR SECCAO DE INFORMATICA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(1553, 317, 101, 45, NULL, 'OPERADOR COMPUTADOR RAAS DIRECCAO PESSOAL QUADORS/EXE', '2022-12-01'),
(1554, 184, 204, 120, NULL, 'CHEFE SERVICOS GERAIS 6ª DIRECCAO/EXE', '2022-12-01'),
(1555, 281, 74, 128, NULL, 'OPERADOR COMPUTADOR CPD CMDO 72ª BrIM/RM LESTE', '2022-12-01'),
(1556, 184, 226, 120, NULL, 'OFICIAL TECNICO SISTEMA CPD AME', '2022-12-01'),
(1557, 369, 30, 117, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS 42ª BrI RM NORTE', '2022-12-01'),
(1558, 317, 22, 45, NULL, 'AMANUENSE REP. GEST. EFECTIVOS DIR. PESSOAL QUADROS/EXE', '2022-12-01'),
(1559, 184, 259, 120, NULL, 'CHEFE CPD SPQ 73ª BRIM RM CENTRO', '2022-12-01'),
(1560, 339, 281, 129, NULL, 'CMDTE 3ª SECCAO 3º PELOTAO CIA CMDO E SVC CCS-HUILA REGIAO MILITAR SUL', '2022-12-01'),
(1561, 369, 211, 117, NULL, 'PROGRAMADOR CPD/AME', '2022-12-01'),
(1562, 369, 59, 117, NULL, 'OF. PROCESSAMENTO DADOS 75ª BRIM 3ª DIV. INFª RM LESTE', '2022-12-01'),
(1563, 369, 56, 117, NULL, 'OFICIAL SISTEMA SVC SECCAO INFORMATICA CMDO ESTADO MAIOR 5ª DIV. RM SUL', '2022-12-01'),
(1564, 329, 189, 131, NULL, 'OP. COMP. CPD 61ª BrIM 6ª DIV. INFª RM SUL', '2022-12-01'),
(1565, 184, 376, 120, NULL, 'OFICIAL HARDWE REP. INFORMATICA 2ª DIV. INFª RM NORTE', '2022-12-01'),
(1566, 317, 197, 45, NULL, 'SGTO SISTEMA CPD DAA 32ª BRI DA 3ª DIV. INFª RM LESTE', '2022-12-01'),
(1567, 184, 267, 120, NULL, 'CHEFE CPD DMG RM CENTRO', '2022-12-01'),
(1568, 339, 388, 129, NULL, 'CMDTE SEC. MANUT. PTAO MANUT. CIA MANUT. BTAO MANUT. ARMTEC RM SUL', '2022-12-01'),
(1569, 184, 382, 120, NULL, 'CHEFE CPD RPQ 4ª DI RM CENTRO', '2022-12-01'),
(1570, 184, 244, 120, NULL, 'CHEFE CPD 72ª BRIM RM LESTE', '2022-12-01'),
(1571, 184, 245, 120, NULL, 'CHEFE CPD REP. OPERACOES RM CABINDA', '2022-12-01'),
(1572, 184, 246, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS DIRECAO PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(1573, 377, 293, 133, NULL, 'OP. TURNO POSTO CMDO RM CENTRO', '2022-12-01'),
(1574, 377, 274, 133, NULL, 'OPERADOR COMPUTADOR SECCAO PESSOAL QUADROS ECAB/EXE', '2022-12-01'),
(1575, 377, 257, 133, NULL, 'OPERADOR COMPUTADOR CPD 21ª BrI 2ª DIV. INFª RM NORTE', '2022-12-01'),
(1576, 377, 366, 133, NULL, 'ARQUIVISTA EXP. E ARQUIVOS DIR. INFORMATICA/EXE', '2022-12-01'),
(1577, 377, 106, 133, NULL, 'AUXILIAR SECCAO EXPEDIENTE E ARQUIVOS SERVICOS GERAIS AME', '2022-12-01'),
(1578, 339, 278, 129, NULL, 'SGTO REG. PESSOAL E QUADROS BOAP/EXE', '2022-12-01'),
(1579, 339, 289, 129, NULL, 'CMDTE 1ª SEC. 3ª PTAO 3ª CIA 3º BTAO 10ª BRIM RM CABINDA', '2022-12-01'),
(1580, 351, 286, 121, NULL, 'TECNICO REDES E HARDWARE CDP DIR. ADMINISTRACAO FINANCAS/EXE', '2022-12-01'),
(1581, 339, 287, 129, NULL, 'CMDTE 3ª SECCAO 2º PTAO 3ª CIA POLIGNO INTER-ARMA RM CENTRO', '2022-12-01'),
(1582, 369, 37, 117, NULL, 'OF. PROCESSAMENTO DADOS CRM - NAMIBE', '2022-12-01'),
(1583, 39, 232, 121, NULL, 'DIRECÇÄO INTELIG. MILITAR OPERATIVA/EXE', '2022-12-01'),
(1584, 369, 80, 117, NULL, 'PROFESSOR DE INFORMATICA DA SECCAO ESTATISTICA  MAT GERAIS EIAS/EXE', '2022-12-01'),
(1585, 61, 213, 129, NULL, 'DIRECÇÄO INTELIG. MILITAR OPERATIVA/EXE', '2022-12-01'),
(1586, 414, 115, 121, NULL, 'FINALISTAS  DO IIº CURSO MEDIO DE FORMACAO DE OFICIAIS NA ESCOLA INTER ARMAS  DE OFICIAIS DO EXERCITO', '2022-12-01'),
(1587, 377, 258, 133, NULL, 'OPERADOR COMPUTADOR CPD 21ª BrI 2ª DIV. INFª RM NORTE', '2022-12-01'),
(1588, 536, 386, 120, NULL, 'OFICIAL DISPONIVEL/EXE', '2022-12-01'),
(1589, 377, 305, 133, NULL, 'OPERADOR COMPUTADOR CPD DRM RM CABINDA', '2022-12-01'),
(1590, 377, 309, 133, NULL, 'AMANUENSE UNIDADE APOIO RM LESTE', '2022-12-01'),
(1591, 40, 91, 128, NULL, 'AMANUENSE DA REPARTICAO DE PESSOAL E QUADROS DA RM CABINDA', '2022-12-01'),
(1592, 39, 375, 120, NULL, 'CMDO E/MAIOR/32ª BRI -DUNDO RM LESTE', '2022-12-01'),
(1593, 541, 182, 129, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS DA 12ª BrI 1ª DIVISAO INFª DA RM CABINDA', '2022-12-01'),
(1594, 536, 318, 120, NULL, 'PROFESSOR DE DEFESA TECNICA CATEDRA DA DIRECCAO OCULTA DAS TROPAS ACADEMIA MILITAR/EXE', '2022-12-01'),
(1595, 40, 57, 128, NULL, 'AMANUENSE DO GABINETE DO 2º COMANDANTE DA 1ª DIVISAO DE INFANTARIA DA RM CABINDA', '2022-12-01'),
(1596, 536, 72, 117, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA UNIDADE DE APOIO/EXE', '2022-12-01'),
(1597, 40, 10, 128, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE OPERACOES DA RM CABINDA', '2022-12-01'),
(1598, 86, 66, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(1599, 86, 28, 127, NULL, 'OPERADOR COMPUTADOR REPARTICAO PESSOAL E QUADROS RM CABINDA', '2022-12-01'),
(1600, 86, 183, 127, NULL, 'SARGENTO DA SECRETARIA HOSPITAL MILITAR DA RM SUL', '2022-12-01'),
(1601, 86, 35, 127, NULL, 'ADJUNTO DE COMANDO DO 2º BATALHAO DE INFANTARIA MOTORIZADA DA 61ª BrIM DA 6ª DIVISAO DE INFANTARIA MOTORIZADA DA RM SUL', '2022-12-01'),
(1602, 86, 185, 127, NULL, 'AMANUENSE DA REPARTICAO DE PESSOAL E QUADROS DA RM CENTRO', '2022-12-01'),
(1603, 40, 196, 129, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE INFORMATICA DA RM LESTE', '2022-12-01'),
(1604, 86, 51, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(1605, 86, 31, 127, NULL, 'ADJUNTO DE COMANDO 1º BATALHAO 52ª BRIGADA DE INFANTARIA 2ª DIV. INFª RM NORTE', '2022-12-01'),
(1606, 86, 196, 128, NULL, 'OPERADOR DE COMPUTADOR DA REPARTICAO DE INFORMATICA DA RM LESTE', '2022-12-01'),
(1607, 86, 90, 127, NULL, 'SGTO OPERACOES 1ª DIVISAO INFANTARIA RM CABINDA', '2022-12-01'),
(1608, 86, 370, 127, NULL, 'OPERADOR DE FILMAGEM DA BIBLIOTECA DA RM CABINDA', '2022-12-01'),
(1609, 86, 16, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(1610, 545, 44, 115, NULL, 'OFICIAL DE DESENVOLVIMENTO DE SISTEMAS DA SECCAO DE INFORMATICA DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(1611, 545, 162, 113, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR SUL', '2022-12-01'),
(1612, 86, 43, 128, NULL, 'OPERADOR COMPUTADOR CPD 71ª BrIM RM NORTE', '2022-12-01'),
(1613, 86, 134, 127, NULL, 'AMANUENSE DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO BENGO', '2022-12-01'),
(1614, 135, 336, 133, NULL, 'OPERADOR COMPUTADOR REPARTICAO DE PESSOAL E QUADROS RM CABINDA', '2022-12-01'),
(1615, 135, 323, 133, NULL, 'OPERADOR DE COMPUTADOR DA SEC. DE INFORMATICA DO COMANDO E ESTADO MAIOR DA 5ª DIVISAO RM SUL', '2022-12-01'),
(1616, 62, 271, 120, NULL, 'CHEFE CPD DA 10ª BRIGADA 1ª DIVISAO RM CABINDA', '2022-12-01'),
(1617, 135, 337, 133, NULL, 'OP. COMPUTADOR 61ª BRIGADA 6 ª DIV.INFª RM SUL', '2022-12-01'),
(1618, 750, 137, 115, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1619, 112, 92, 45, NULL, 'OPERADOR COMPUTADOR CPD/REP PESS QUADROS RM CABINDA', '2022-12-01'),
(1620, 87, 18, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUANZA NORTE', '2022-12-01'),
(1621, 545, 6, 115, NULL, 'OFICIAL DE REDES DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(1622, 135, 188, 131, NULL, 'CONDUTOR AUTO DO CENTRO DE CLASSIFICACAO E SELECCAO DA RM SUL', '2022-12-01'),
(1623, 378, 269, 121, NULL, 'OFICIAL DE SOFWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARTILHARIA TERRESTRE/EXE', '2022-12-01'),
(1624, 378, 270, 121, NULL, 'OFICIAL DE SOFWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE DEFESA ANTI-AEREA/EXE', '2022-12-01'),
(1625, 378, 265, 121, NULL, 'OFICIAL DE SOFWARE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(1626, 378, 249, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 31ª BrI 3ª DIVISAO INFª DA RM LESTE', '2022-12-01'),
(1627, 378, 393, 117, NULL, 'OFICIAL DE SISTEMAS E SERVIDORES DA SECCAO DE INFORMATICA DA 2ª DIVISAO INFª RM NORTE', '2022-12-01'),
(1628, 378, 275, 121, NULL, 'OFICIAL PROGRAMADOR DA REPARTICAO DE DESENVOLVIMENTO E SISTEMAS DA DIRECCAO DE INFORMATICA DO EXERCITO', '2022-12-01'),
(1629, 135, 297, 133, NULL, 'OP. COMP. CDP 51ª BrIM 2ª DIV. INFª RM NORTE', '2022-12-01'),
(1630, 295, 244, 121, NULL, 'OFICIAL DE HARDWARE REPARTICAO DE INFORMÁTICA REGIÃO MILITA SUL', '2022-12-01'),
(1631, 62, 114, 120, NULL, 'CHEFE CPD 70ª BrIM RM NORTE', '2022-12-01'),
(1632, 62, 260, 120, NULL, 'OFICIAL DE TURNO INFORMATICO E ESTATISTICA DO HOSPTAL MILITAR  DA RM SUL', '2022-12-01'),
(1633, 221, 282, 121, NULL, 'FINALISTA DO CURSO DE ENGENHARIA INFORMATICA NO INSTITUTO TECNICO MILITAR ´´JOSE MARTI´´/CUBA', '2022-12-01'),
(1634, 221, 279, 121, NULL, 'FINALISTA DO CURSO DE ENGENHARIA INFORMATICA NA UNIVERSIDADE DE INFORMATICA/CUBA', '2022-12-01'),
(1635, 238, 115, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1636, 378, 237, 120, NULL, 'OFICIAL TECNICO DE SISTEMAS SECCAO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE CONTRA INTELIGENCIA MILITAR/EXE', '2022-12-01'),
(1637, 221, 391, 121, NULL, 'FINALISTA DO CURSO DE ENGENHARIA DE CONSTRUCAO CIVIL NA UNIVERSIDADE MILITAR DE CIENCIAS E TECNOLOGIA DE NANJIG/CHINA', '2022-12-01'),
(1638, 221, 263, 121, NULL, 'FINALISTA DO CURSO DE ENGENHARIA DE TELECOMUNICACOES NA UNIVERSIDADE MILITAR DE CIENCIAS E TECNOLOGIA DE NANJIG/CHINA', '2022-12-01'),
(1639, 239, 191, 128, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUANDO CUBANGO', '2022-12-01'),
(1640, 340, 352, 136, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTOS DE DADOS DA 70ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIÃO MILITAR NORTE', '2022-12-01'),
(1641, 304, 62, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS/MUSEU DO EXERCITO', '2022-12-01'),
(1642, 554, 379, 123, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(1643, 554, 392, 123, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(1644, 295, 278, 129, NULL, 'OPERADOR COMPUTADOR REPARTIÇÃO  GESTÃO DE EFECTIVOS DIRECÇÃO DE PESSOAL E QUADROS DO EXÉRCITO', '2022-12-01'),
(1645, 295, 259, 120, NULL, 'CHEFE CENTRO DE PROCESSAMENTO DE DADOS SECCAO DE PESSOAL E QUADROS DA 41ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIÃO MILITAR  CENTRO', '2022-12-01'),
(1646, 378, 284, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 42ª BrI 2ª DIVISAO INFª DA RM NORTE', '2022-12-01'),
(1647, 378, 285, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 50ª BrI 5ª DIVISAO INFª DA RM SUL', '2022-12-01'),
(1648, 378, 282, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 12ª BrI 1ª DIVISAO INFª DA RM CABINDA', '2022-12-01'),
(1649, 378, 279, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 21ª BrI 5ª DIVISAO INFª RM SUL', '2022-12-01'),
(1650, 89, 380, 121, NULL, 'FINALISTA DO 2º CURSO ESPECIAL DE OFICIAIS NA ESCOLA INTER-ARMAS DE SARGENTOS/EXE', '2022-12-01'),
(1651, 340, 303, 133, NULL, 'ARQUIVISTA DA REPARTIÇÃO REGISTO E IDENTIFICAÇÃO DA DIRECÇÃO DE PESSOAL E QUADROS DO EXÉRCITO', '2022-12-01'),
(1652, 318, 239, 129, NULL, 'LICENCIADO A RESERVA POR TERMINO DO CUMPRIMENTO DO SVÇ MILITAR', '2022-12-01'),
(1653, 378, 146, 117, NULL, 'OFICIAL DE PREPARACAO ESPECIAL DA REPARTICAO DE PLANEAMENTO E SISTEMA DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1654, 378, 224, 120, NULL, 'OFICIAL PROGRAMACAO SECCAO DE PROCESSAMENTO DE DADOS DA DIRECCAO CONTRA INTELIGENCIA MILITAR/EXE', '2022-12-01'),
(1655, 378, 251, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DE INFORMATICA DA 30ª BrI 3ª DIVISAO INFª DA RM LESTE', '2022-12-01'),
(1656, 378, 252, 121, NULL, 'OFICIAL TECNICO DE SISTEMAS E REDES SECCAO DE INFORMATICA HOSPITAL MILITAR RM CENTRO', '2022-12-01'),
(1657, 378, 250, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA 72ª BrIM DA RM LESTE', '2022-12-01'),
(1658, 378, 227, 120, NULL, 'OFICIAL TECNICO DE SISTEMAS E REDES DA SECCAO DE INFORMATICA DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1659, 378, 73, 117, NULL, 'CHEFE DO CPD DA SERVIDAO MILITAR DO EXERCITO/MARIA TERESA', '2022-12-01'),
(1660, 16, 360, 136, NULL, 'CONDUTOR MECANICO 3ª SECCAO 3º PELOTAO 1ª COMPANHIA DE INFANTARIA EM CARRO DE COMBATE COMANDO 2º BATALHAO 10ª BRIM 1ª DIVISAO RM CABINDA', '2022-12-01'),
(1661, 14, 395, 128, NULL, 'CATALOGADOR (OPERADOR DE COMPUTADOR) DO MONUMENTO A BATALHA DE KIFANGONDO/EXE', '2022-12-01'),
(1662, 283, 10, 128, NULL, 'COMANDANTE DA 2ª SECCAO DO 2º PELOTAO DA 2ª COMPANHIA DO 2º BATALHAO DA 40ª BRIGADA DE INFANTARIA DA 4ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CENTRO', '2022-12-01'),
(1663, 241, 366, 129, NULL, 'CHEFE SECCAO TELEFONICA PTAO TELEFONICA BATALHAO DE INFANTARIA EM BMP 42ª BrI 2ª DIVISAO INFª REGIAO MILITAR NORTE', '2022-12-01'),
(1664, 241, 302, 129, NULL, '1º OPERADOR TELEFONICO SECCAO TELEFONICA PTAO TELEFONICA CIA TELECOM 52ª BrI 2ª DIVISAO INFª REGIAO MILITAR NORTE', '2022-12-01'),
(1665, 243, 206, 128, NULL, 'OPERADOR DE TURNO DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA REGIAO MILITAR SUL', '2022-12-01'),
(1666, 243, 381, 127, NULL, 'SARGENTO DE COMANDO DA COMPANHIA DE FORTIFICACOES DO BATALHAO DE ENGENHARIA E SAPADORES DA REGIAO MILITAR SUL', '2022-12-01'),
(1667, 243, 85, 127, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE SERVICOS GERAIS CENTRO DE CLASSIFICACAO E SELECCAO DE LUANDA', '2022-12-01'),
(1668, 271, 368, 129, NULL, 'TRANSICAO PARA O QUADROS PERMANENTE', '2022-12-01'),
(1669, 271, 94, 129, NULL, 'TRANSICAO PARA O QUADROS PERMANENTE', '2022-12-01'),
(1671, 271, 130, 129, NULL, 'TRANSICAO PARA O QUADROS PERMANENTE', '2022-12-01'),
(1672, 271, 309, 129, NULL, 'TRANSICAO PARA O QUADROS PERMANENTE', '2022-12-01'),
(1673, 271, 96, 129, NULL, 'TRANSICAO PARA O QUADROS PERMANENTE', '2022-12-01'),
(1674, 271, 126, 129, NULL, 'TRANSICAO PARA O QUADROS PERMANENTE', '2022-12-01'),
(1675, 270, 368, 129, NULL, 'CMDO EM 22ª BRI RM NORTE', '2022-12-01'),
(1677, 270, 94, 129, NULL, 'DEPOSITO MATERIAL GUERRA/RM SUL', '2022-12-01'),
(1678, 270, 130, 129, NULL, 'CMDO 73ª BRIM RM CENTRO', '2022-12-01'),
(1679, 345, 104, 130, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 75ª BRIM 3ª DIVISAO RM LESTE', '2022-12-01'),
(1680, 270, 309, 129, NULL, 'CRM - LUANDA', '2022-12-01'),
(1681, 270, 96, 129, NULL, 'CMDO ESTADO MAIOR DA RM CENTRO', '2022-12-01'),
(1682, 270, 126, 129, NULL, 'CMDO ESTADO MAIOR DA RM CENTRO', '2022-12-01'),
(1683, 345, 293, 130, NULL, 'AMANUENSE DA SECCAO DE DOCENCIA E GESTAO DE CARREIRAS DA REPARTICAO DE ADMINISTRACAO E FINANCAS DA DIRECCAO DE SERVICOS DE SAUDE/EXE', '2022-12-01'),
(1684, 345, 324, 130, NULL, 'OPERADORA DE COMPUTADOR CPD DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(1685, 345, 336, 130, NULL, 'OPERADOR DE COMPUTADOR REPARTICAO DE PESSOAL E QUADROS/RM CABINDA', '2022-12-01'),
(1686, 345, 127, 130, NULL, 'SARGENTO DE PESSOAL E QUADROS DO 1º GRUPO DAA TOR-M1 REGIMENTO DAA DA 4ª DIV. RM CENTRO', '2022-12-01'),
(1687, 380, 300, 133, NULL, 'CONDUTOR-AUTO SECCAO DE ADMINISTRACAO DO DISTRITO DE RECUTAMENTO E MOBILIZACAO/EXE-HUILA', '2022-12-01'),
(1688, 345, 188, 130, NULL, 'OPERADOR COMPUTADOR SERVICOS GERAIS DO CENTRO DE CLASSIFICACAO E SELECCAO/EXE-HUILA', '2022-12-01'),
(1689, 345, 189, 130, NULL, 'OPERADOR DE TURNO DA REPARTIÇAO DE OPERAÇOES DA RM SUL', '2022-12-01'),
(1690, 345, 184, 130, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUNENE REGIAO MILITAR SUL', '2022-12-01'),
(1691, 97, 282, 120, NULL, 'OFICIAL DE GESTAO DE CARREIRAS DA REPARTICAO DE GESTAO DE CARREIRAS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1692, 380, 298, 133, NULL, 'OPERADOR COMPUTADOR SECCAO INFORMATICA CAMPO MILITAR GRAFANIL/EXE', '2022-12-01'),
(1693, 97, 86, 120, NULL, 'OFICIAL PARA PROCESSAMENTO DE DADOS DA SECCAO DE ADMINISTRACAO DO DRM HUILA REGIAO MILITAR SUL', '2022-12-01'),
(1694, 97, 37, 117, NULL, 'CHEFE DE SECCAO DE RECENSEAMENTO E RECRUTAMENTO DO DRM NAMIBE REGIAO MILITAR SUL', '2022-12-01'),
(1695, 158, 77, 117, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA DISPONIVEL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1696, 44, 90, 127, NULL, 'LICENCIADO DO SERVICO MILITAR ACTIVO A REFORMA POR RAZOES DE SAUDE ORDEM Nº 0002/CMDTE.EXE/2022 DE 28 DE FEVEREIRO', '2022-12-01'),
(1697, 44, 39, 128, NULL, 'LICENCIADO DO SERVICO MILITAR ACTIVO A REFORMA POR RAZOES DE SAUDE ORDEM Nº 0002/CMDTE.EXE/2022 DE 28 DE FEVEREIRO', '2022-12-01'),
(1698, 158, 369, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA REPARTICAO DE OPERACOES DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1699, 158, 220, 121, NULL, 'OFICIAL PARA IDENTIFICACAO DA REPARTICAO DE REGISTO E IDENTIFICACAO DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1700, 141, 11, 128, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(1701, 158, 268, 120, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(1702, 158, 241, 120, NULL, 'OFICIAL DE PREPARACAO ESPECIAL DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1703, 285, 99, 131, NULL, NULL, '2022-12-01'),
(1704, 285, 308, 131, NULL, NULL, '2022-12-01'),
(1705, 285, 327, 131, NULL, NULL, '2022-12-01'),
(1706, 285, 325, 131, NULL, NULL, '2022-12-01'),
(1707, 285, 320, 131, NULL, NULL, '2022-12-01'),
(1708, 285, 243, 131, NULL, NULL, '2022-12-01'),
(1709, 285, 357, 131, NULL, NULL, '2022-12-01'),
(1710, 285, 383, 131, NULL, NULL, '2022-12-01'),
(1711, 285, 354, 131, NULL, NULL, '2022-12-01'),
(1712, 285, 273, 131, NULL, NULL, '2022-12-01'),
(1714, 285, 307, 131, NULL, NULL, '2022-12-01'),
(1715, 285, 100, 131, NULL, NULL, '2022-12-01'),
(1716, 285, 88, 131, NULL, NULL, '2022-12-01'),
(1717, 285, 199, 131, NULL, NULL, '2022-12-01'),
(1718, 285, 93, 131, NULL, NULL, '2022-12-01'),
(1719, 285, 304, 131, NULL, NULL, '2022-12-01'),
(1720, 285, 321, 131, NULL, NULL, '2022-12-01'),
(1721, 285, 200, 131, NULL, NULL, '2022-12-01'),
(1722, 285, 353, 131, NULL, NULL, '2022-12-01'),
(1723, 285, 258, 131, NULL, NULL, '2022-12-01'),
(1724, 285, 356, 131, NULL, NULL, '2022-12-01'),
(1725, 285, 319, 131, NULL, NULL, '2022-12-01'),
(1726, 285, 305, 131, NULL, NULL, '2022-12-01'),
(1727, 285, 257, 131, NULL, NULL, '2022-12-01'),
(1728, 285, 201, 131, NULL, NULL, '2022-12-01'),
(1729, 285, 297, 131, NULL, NULL, '2022-12-01'),
(1730, 285, 274, 131, NULL, NULL, '2022-12-01'),
(1731, 285, 111, 131, NULL, NULL, '2022-12-01'),
(1732, 285, 310, 131, NULL, NULL, '2022-12-01'),
(1733, 285, 290, 131, NULL, NULL, '2022-12-01'),
(1734, 285, 358, 131, NULL, NULL, '2022-12-01'),
(1735, 417, 32, 121, NULL, 'COMISSAO NORMAL DE SERVICO/MINDENVP', '2022-12-01'),
(1736, 320, 358, 131, NULL, 'P/ OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(1737, 308, 108, 121, NULL, 'OFICIAL PARA ORCAMENTO DA REPARTICAO DE ORCAMENTO DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1738, 308, 30, 117, NULL, 'OFICIAL DE PREPARACAO COMBATIVA DA SECCAO DE PREPARACAO COMBATIVA DA 71ª BRIGADA DE INFANTARIA MOTORIZADA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1739, 320, 352, 136, NULL, 'P/ OPERADOR DE COMPUTADOR DO CPD DA SECCAO DE INFORMATICA DA 3ª DIVISAO INF RM LESTE', '2022-12-01'),
(1740, 320, 353, 131, NULL, 'P/AMANUENSE DOS SERVICOS GERAIS DO GABINETE DO COMANDANTE DO EXERCITO', '2022-12-01'),
(1741, 320, 304, 131, NULL, 'P/ OPERADOR DE CONTROLO E REVISAO DO CENTRO DE PROCESSAMENTO DE DADOS DO MUSEU DO EXERCITO', '2022-12-01'),
(1742, 320, 305, 131, NULL, 'P/ OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA 70ª BRIM RM NORTE', '2022-12-01'),
(1743, 320, 306, 133, NULL, 'P/ OPERADOR DE COMPUTADOR DO CPD DO MUSEU DO EXERCITO', '2022-12-01'),
(1744, 538, 87, 127, NULL, 'SGTO EM INACTIVIDADE TEMPORARIA/EXE', '2022-12-01'),
(1745, 531, 123, 117, NULL, 'CHEFE DA SECREARIA GERAL DA DIRECCAO DOS SERVICOS AGROPECUARIOS/EMGFAA', '2022-12-01'),
(1746, 297, 336, 131, NULL, 'AUXILIAR DA 2ª CIA DO BATALHAO DE COMANDO E SERVICO DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(1747, 297, 127, 131, NULL, 'OPERADOR DE COMPUTADOR DO GRUPO DA DAA DA RM CENTRO', '2022-12-01'),
(1748, 416, 102, 120, NULL, 'OFICIAL DE SOFTWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR LESTE', '2022-12-01'),
(1749, 416, 223, 120, NULL, 'OFICIAL DE MAPAS DIGITAIS DO CENTRO DE PROCESSAMENTO PRINCIPAL DE DADOS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1750, 297, 342, 133, NULL, 'OPERADOR DE COMPUTADOR DO GRUPO DA DAA DA RM CENTRO', '2022-12-01'),
(1751, 379, 381, 128, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(1752, 67, 400, 121, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(1753, 67, 398, 121, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(1754, 387, 371, 129, NULL, 'AMANUENSE DA REPARTICAO DE INFORMATICA DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(1755, 416, 251, 121, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1756, 530, 230, 120, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1757, 422, 39, 128, NULL, 'SARGENTO EM INACTIVIDADE TEMPORARIA (RAZOES DE SAUDE) DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1758, 490, 76, 117, NULL, 'OFICIAL DE DESENVOLVIMENTO DE SISTEMAS DA SECCAO DE INFORMATICA DA DIRECCAO DE ENSINO/EXE', '2022-12-01'),
(1759, 422, 69, 127, NULL, 'SGTO GESTAO DE PESSOAL CIVIL SECCAO DE PESSOAL E QUADROS DA BRIGADA DE ENGENHARIA DE CONSTRUCAO/EXE', '2022-12-01'),
(1760, 223, 333, 129, NULL, 'COMANDANTE SECCAO INFANTARIA COMPANHIA CMDO E SERVICO DO CENTRO DE CLASSIFICACAO E SELECCAO DE BENGUELA REGIAO MILITAR CENTRO', '2022-12-01'),
(1761, 435, 125, 128, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE ADMINISTRACAO DO DRM BENGUELA REGIAO MILITAR CENTRO', '2022-12-01'),
(1762, 374, 54, 111, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(1763, 374, 174, 111, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA E TECNOLOGIA DE INFORMACAO DO INSTITUTO SUPERIOR DO EXERCITO', '2022-12-01'),
(1764, 25, 80, 117, NULL, 'ALUNOS DO 1º CURSO DE APERFEICOAMENTO DE COMANDANTES E ESTADO-MAIORES DE BATALHAO/GRUPOS ARMAS E SERVIÇOS NO INSTITUTO SUPERIOR DO EXERCITO', '2022-12-01'),
(1765, 25, 73, 117, NULL, 'ALUNOS DO 1º CURSO DE APERFEICOAMENTO DE COMANDANTES E ESTADO-MAIORES DE BATALHAO/GRUPOS ARMAS E SERVIÇOS NO INSTITUTO SUPERIOR DO EXERCITO', '2022-12-01'),
(1766, 374, 3, 113, NULL, '1º OFICIAL PARA CATALOGACAO E PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(1767, 374, 61, 113, NULL, 'OFICIAL DE PLANEAMENTO E SISTEMA DE INFORMACAO DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR SUL', '2022-12-01'),
(1768, 255, 121, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1769, 255, 198, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1770, 255, 254, 121, NULL, 'FINALISTA DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1771, 529, 135, 115, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA 1ª DIVISAO DE INFANTARIA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1772, 471, 388, 129, NULL, 'AMANUENSE DE MATERIAL CLASSIFICADA DA OFICINA SECRETA DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1773, 416, 72, 117, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1774, 530, 124, 120, NULL, 'OFICIAL DE SISTEMA E SERVIDORES DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1775, 157, 356, 133, NULL, 'OPERADOR COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS 72ª BRIM RM LESTE', '2022-12-01'),
(1776, 18, 254, 128, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1777, 18, 303, 133, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1778, 18, 121, 128, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1779, 18, 198, 128, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1780, 18, 116, 127, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1781, 18, 179, 127, NULL, 'ORDEM DE MATRICULA ALUNOS DO 3º CURSO DE FORMACAO DE OFICIAIS DE EDUCACAO PATRIOTICA DAS FAA', '2022-12-01'),
(1782, 371, 379, 121, NULL, 'FINALISTA CURSO DE FORMACAO ENGENHARIA INFORMATICA OFICIAIS DO QP INSTITUTO SUPERIOR MILITAR/EMGFAA', '2022-12-01'),
(1783, 156, 201, 136, NULL, 'OPERADOR COMPUTADOR REPARTICAO INFORMATICA RM CENTRO', '2022-12-01'),
(1784, 156, 308, 133, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMENTO DE DADOS ESCOLA PRATICA DE CONSTRUCAO/EXE', '2022-12-01'),
(1785, 23, 286, 121, NULL, 'PASSAGEM PARA O QUADRO PERMANENTE CMDTE EXE Nº 0001/2021 DE 24-02-2021', '2022-12-01'),
(1786, 23, 373, 129, NULL, 'PASSAGEM PARA O QUADRO PERMANENTE CMDTE EXE Nº 0001/2021 DE 24-02-2021', '2022-12-01'),
(1787, 175, 319, 133, NULL, 'TECNICO DE PROCESSAMENTO DE DADOS DO GABINETE DE ORGANIZACAO E INFORMATICA DA CAIXA DE SEGURANCA SOCIAL/FAA', '2022-12-01'),
(1788, 175, 243, 133, NULL, 'TECNICO DE PROCESSAMENTO DE DADOS DO GABINETE DE ORGANIZACAO E INFORMATICA DA CAIXA DE SEGURANCA SOCIAL/FAA', '2022-12-01'),
(1789, 307, 368, 45, NULL, 'COMANDANTE DA 2ª SECCAO 1º PTAO 1ª CIA 1º BTAO 51ª BRIM RM NORTE', '2022-12-01'),
(1790, 222, 22, 129, NULL, 'AMANUENSE REP. GEST. EFECTIVOS DIR. PESSOAL QUADROS/EXE', '2022-12-01'),
(1791, 63, 278, 128, NULL, 'OPERADOR COMPUTADOR REPARTIÇÃO  GESTÃO DE EFECTIVOS DIRECÇÃO DE PESSOAL E QUADROS DO EXÉRCITO', '2022-12-01'),
(1792, 115, 349, 120, NULL, 'PROFESSORA DE INFORMATICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1793, 115, 350, 120, NULL, 'PROFESSOR DO SISTEMA DE INFORMACAO DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1794, 115, 339, 120, NULL, 'OFICIAL DE ADMINISTRACAO DE SISTEMAS DA REPARTICAO DE GESTAO TECNOLOGICA DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1795, 115, 340, 120, NULL, 'PROFESSOR DE PROGRAMACAO DE COMPUTADORES DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1796, 115, 341, 120, NULL, 'PROFESSOR DE BASE DE DADOS DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1797, 63, 163, 126, NULL, 'AJUDANTE PARA MANUSEAMENTO DE MATERIAS CLASSIFICADAS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1798, 115, 346, 120, NULL, 'PROFESSOR DE REDES DE DADOS DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1799, 115, 347, 120, NULL, 'OFICIAL DE TECNICA WEB DA REPARTICAO DE GESTAO TECNOLOGICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1800, 115, 348, 120, NULL, 'OFICIAL DE TECNICA DA WEB DA REPARTICAO DE GESTAO TECNOLOGICA DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1801, 91, 380, 120, NULL, 'COMANDANTE DO 1º PELOTAO DA 3ª COMPANHIA DO 2º BATALHAO DA 22ª BRIGADA DE INFANTARIA DA 2ª DIVISAO DE INFANTARIA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1802, 63, 136, 127, NULL, 'ADJUNTO DO COMANDO ESTADO MAIOR DA 50ª BRIGADA DE INFANTARIA DA 5ª DIVISAO DE INFANTARIA DA REGIAO MILITAR SUL', '2022-12-01'),
(1803, 63, 147, 126, NULL, 'AMANUENSE DA REPARTICAO DE PESSOAL E QUADROS DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1804, 63, 157, 127, NULL, 'OPERADOR DE SISTEMA DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE OPERACOES/EXE', '2022-12-01'),
(1805, 63, 172, 126, NULL, 'AUXILIAR TECNICO DE HARDWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1806, 63, 18, 127, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DO CUANZA NORTE', '2022-12-01'),
(1807, 63, 13, 126, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1808, 394, 125, 128, NULL, 'SGTO INACTIVIDADE TEMPORARIA REGIAO MILITAR CENTRO', '2022-12-01'),
(1809, 394, 134, 127, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO ARQUIVO E EXPEDIENTE DO CRM LUNDA-NORTE REGIAO MILITAR LESTE', '2022-12-01'),
(1810, 394, 136, 128, NULL, 'ADJUNTO DE COMANDO DA 50ª BrIM DA 5ª DIVISAO INFª REGIAO MILITAR SUL', '2022-12-01'),
(1811, 394, 28, 127, NULL, 'SARGENTO DE PESSOAL E QUADROS DO CENTRO MEDICO DO CAMPO MILITAR DO GRAFANIL/EXE', '2022-12-01'),
(1812, 415, 292, 133, NULL, 'LICENCIADO A RESERVA POR TERMINO DO CUMPRIMENTO DO SVC MILITAR (MILITARES INCORPORADOS NO ANO 2014)', '2022-12-01'),
(1813, 92, 40, 127, NULL, 'SARGENTO DA SECRETARIA DO HOSPITAL MILITAR DA REGIAO MILITAR CENTRO', '2022-12-01'),
(1814, 88, 245, 120, NULL, 'CHEFE DO CPD DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(1815, 114, 294, 129, NULL, 'OPERADOR DA SECRETARIA DO COMANDO DA REGIÃO MILITAR NORTE', '2022-12-01'),
(1816, 746, 131, 115, NULL, 'OFICIAL DE SEGURANCA E AUDITORIA DA REPARTICAO DE PLANEAMENTO E SISTEMAS DE INFORMACAO DA DIRECCAO DE INFORMATICA/EMGFAA', '2022-12-01'),
(1817, 201, 360, 136, NULL, 'FINALISTA DO 14º CURSO INSTRUCAO BASICA CI LUENA', '2022-12-01'),
(1818, 154, 262, 121, NULL, 'OFICIAL DE IDENTIFICAÇÃO E INFORMATICA DA RPQ/RM LESTE', '2022-12-01'),
(1819, 754, 224, 121, NULL, 'ENGENHARIA INFORMATICA ISTM/EMGFAA', '2022-12-01'),
(1820, 114, 200, 136, NULL, 'CONDUTOR MECÂNICO 4ª PEÇA 2º PTÃO 2ª BATERIA GAC 72ª BRIM RM LESTE', '2022-12-01'),
(1821, 84, 330, 133, NULL, 'OPERADOR COMUPUTADOR CPD 70ª BrIM RM NORTE', '2022-12-01'),
(1822, 85, 119, 128, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DAS OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(1823, 60, 265, 121, NULL, 'FINALISTA DE CURSO DE ENGENHARIA DE INFORMATICA NO INSTITUTO TÉCNICO MILITAR “JOSÉ MARTI”  – REPUBLICA DE CUBA', '2022-12-01'),
(1824, 358, 349, 121, NULL, 'PROFESSORA DE INFORMATICA DO DEPARTAMENTO DE CIENCIAS EXACTAS E NATURAIS DA ACADEMIA MILITAR DO EXERCITO', '2022-12-01'),
(1825, 419, 121, 129, NULL, 'OP. DE COMPUTADOR REPARTICAO ESTUDOS E PLANEAMENTO DIR. DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1826, 449, 269, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 51ª BrI DA RM NORTE', '2022-12-01'),
(1827, 449, 270, 121, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS DA SECCAO DE INFORMATICA DA 40ª BrI DA 4ª DIVISAO DE INFANTARIA DA RM CENTRO', '2022-12-01'),
(1828, 742, 54, 113, NULL, 'CHEFE DE SECCAO DE INFORMATICA DA DIRECCAO DE INSTRUCAO E ENSINO/EXE', '2022-12-01'),
(1829, 554, 378, 123, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2022-12-01'),
(1831, 476, 390, 136, NULL, 'OPERADOR COMPUTADOR CPD DIR. PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(1833, 419, 83, 129, NULL, 'OPERADOR DE COMPUTADOR SECCAO ADMINISTRACAO DRM HUILA RM SUL', '2022-12-01'),
(1834, 634, 30, 120, NULL, 'CH. SECRETARIA GERAL  42ª BrI 4ª DIV. INFª RM CENTRO', '2022-12-01'),
(1835, 224, 379, 120, NULL, 'OFICIAL DE TURNO INFORMATICO DA SECCAO DE INFORMATICA DO HOSPITAL MILITAR REGIONAL DA REGIAO MILITAR SUL', '2022-12-01'),
(1836, 224, 392, 120, NULL, 'OFICIAL DE TURNO INFORMATICO DA SECCAO DE INFORMATICA DO HOSPITAL MILITAR REGIONAL DA REGIAO MILITAR CABINDA', '2022-12-01'),
(1838, 550, 51, 128, NULL, 'OPERADOR CONTROLO REVISAO CPD DIRECCAO  ARMAMENTO E TECNICA/EXE.', '2022-12-01'),
(1839, 196, 198, 129, NULL, 'SGTO SECRETARIA 72ª BrIM INFª RM LESTE', '2022-12-01'),
(1840, 196, 101, 136, NULL, 'OPERADOR COMPUTADOR REPARTICAO ADMINISTRACAO E FINANCAS RM NORTE', '2022-12-01'),
(1841, 117, 281, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(1842, 117, 287, 129, NULL, 'TRANSITA PARA O QUADRO PERMANENTE, ORDEM Nº 0005/CMDTE EXE/2021 DE 08-11-2021', '2022-12-01'),
(1843, 196, 218, 129, NULL, 'AMANUENSE OPERADOR COMPUTADOR BTAO ENGENHARIA SAPADORES RM CENTRO', '2022-12-01'),
(1844, 224, 234, 117, NULL, 'OFICIAL DE HARDWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR SUL', '2022-12-01'),
(1845, 389, 77, 121, NULL, 'INSTRUTOR TECNICA INDIVIDUAL COMBATE CI TROPAS BLINDADAS EME', '2022-12-01'),
(1846, 147, 233, 121, NULL, 'CMDTE 3º PTAO 1ª CIA BTAO TANQUES 60ª BrIM 6ª DIV. INFª RM SUL', '2022-12-01'),
(1847, 623, 67, 115, NULL, 'CHEFE REPART. INFORMATICA RM LESTE', '2022-12-01'),
(1848, 103, 175, 117, NULL, 'OFICIAL MANUTENCAO SISTEMA SEC. INFORMATICA RM SUL', '2022-12-01'),
(1849, 300, 115, 129, NULL, 'CMDTE SECCAO RECTO INFORMACAO RM SUL', '2022-12-01'),
(1850, 210, 81, 136, NULL, 'ESCRITURARIO 1º BTÃO INFANTª 21ª BRIGADA DE INFª MOTORIZADA/5ª RM', '2022-12-01'),
(1852, 147, 9, 117, NULL, 'OF. HARDWARE REP. INFORMATICA RM CABINDA', '2022-12-01'),
(1853, 147, 26, 117, NULL, 'CH. SEC. INFORMATICA ACAD. MILITAR EXE', '2022-12-01'),
(1854, 166, 153, 128, NULL, 'OPERADOR COMPUTADOR CPD UNIDADE APOIO/EXE', '2022-12-01'),
(1856, 690, 133, 120, NULL, 'CHEFE SECÇÃO EXPEDIENTE ARQUIVO/DQ/DPPQ/EMG', '2022-12-01'),
(1857, 103, 170, 117, NULL, 'OF. ANALISE DESENVOLVIMENTO SEC. INFORMATICA 2ª DIVISAO DE INFª ì\nRM NORTE', '2022-12-01'),
(1858, 178, 110, 129, NULL, NULL, '2022-12-01'),
(1860, 53, 78, 123, NULL, NULL, '2022-12-01'),
(1861, 367, 110, 129, NULL, 'MECANICO DE ARMAMENTO EPAT/EME', '2022-12-01'),
(1864, 100, 27, 120, NULL, 'OFICIAL REGISTO REPART. PESSOAL E QUADROS 5ª RM ', '2022-12-01'),
(1865, 310, 116, 129, NULL, 'CMDTE SEC. INFANTARIA RM NORTE', '2022-12-01'),
(1866, 300, 108, 129, NULL, 'CMDTE SECCAO INFANTARIA ENTREGUE A DTE EMG', '2022-12-01'),
(1867, 74, 104, 136, NULL, 'AT. AKM', '2022-12-01'),
(1868, 74, 108, 136, NULL, 'AT. AKM', '2022-12-01'),
(1869, 667, 170, 121, NULL, 'CH. SECRETARIA GERAL COP MALANGE', '2022-12-01'),
(1870, 560, 170, 120, NULL, 'CHEFE SECRETARIA GERAL DESTACAMENTO APOIO 9ª RM', '2022-12-01'),
(1871, 142, 169, 128, NULL, 'SARGENTO REGIME ESPECIAL SEGURANCA CENTRO INSTRUCAO LUBANGO', '2022-12-01'),
(1877, 467, 2, 131, NULL, 'GUARDA FIO 3º PTAO INSTRUCAO CAZERNA REGTO TRANSMISSOES/EME \r\n', '2022-12-01'),
(1878, 496, 2, 129, NULL, 'STO SECRETARIA REGTO TRANSMISSOES/EME', '2022-12-01'),
(1879, 608, 2, 128, NULL, 'STO SECRETARIA REGTO TRANSMISSOES/EME', '2022-12-01'),
(1880, 209, 52, 129, NULL, 'AMANUENSE ROA DIREC. FINANÇAS/EME', '2022-12-01'),
(1881, 125, 115, 129, NULL, NULL, '2022-12-01'),
(1882, 104, 183, 128, NULL, 'AUXILIAR PROTOCOLO GA CMDTE/RMS', '2022-12-01'),
(1883, 77, 79, 120, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS UNIDADE APOIO EME', '2022-12-01'),
(1884, 195, 216, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1885, 425, 6, 120, NULL, 'OF. ANALISE SISTEMAS SEC. ANALISE DESENVOL. SISTEMAS REPART. INFORMATICA/EME', '2022-12-01'),
(1887, 77, 123, 121, NULL, 'OF. SISTEMA SERVIDOR INFORMAT. 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1888, 431, 13, 128, NULL, 'OPERADOR COMPUTADOR CENTRO PROCESSAMNETO DADOS DIRECCAO INFORMATICA/EME', '2022-12-01'),
(1889, 418, 167, 115, NULL, '1º OFICIAL ANALISE SISTEMAS E INFORMACAO REP. ANALISE E DESENVOLVIMENTO SOFTWARE DIRECCAO INFORMATICA/EME', '2022-12-01'),
(1890, 425, 177, 117, NULL, '1º OF. SISTEMAS E SERVIDORES REP. ASSEGURAMENTO TECNICO DIRECCAO INFORMATICA/EME', '2022-12-01'),
(1891, 104, 90, 128, NULL, 'STO OP. 1ª DIVISAO/RMK', '2022-12-01'),
(1892, 696, 23, 117, NULL, 'CHEFE DA SECCAO DE ADMINISTRACAO E SERVICOS DA REPARTICAO DE PESSOAL E QUADROS DA GML/EMGFAA', '2022-12-01'),
(1893, 195, 221, 129, NULL, 'FINALISTA 14º CURSO SARGENTO NA EIAS', '2022-12-01'),
(1894, 324, 38, 129, NULL, 'OPERADOR CIFRAS SEC. INFORMAÇOES ESPECIAIS DIR. IMO EME', '2022-12-01'),
(1895, 108, 206, 129, NULL, 'FINALISTA 17º CURSO FORMACAO SARGENTOS/ESCOLA INTER ARMAS SARGENTOS/EXE', '2022-12-01'),
(1896, 326, 2, 126, NULL, 'OPERADOR DE COMPUTADOR CPD DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1898, 126, 32, 128, NULL, 'OPERADOR COMPUTADOR CPD/ DPQ/EME', '2022-12-01'),
(1899, 456, 214, 129, NULL, 'OPERADORA CENTRO PROCESSAMENTO DADOS DIRECCAO INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(1901, 614, 216, 129, NULL, 'CMDTE SECCAO DESTACAMENTO APOIO RM SUL', '2022-12-01'),
(1902, 614, 217, 129, NULL, 'CHEFE CARRO 3ª SEC 1º PTAO 3ª CIA 1º BTAO 50ª BrIM 5ª DIVISAO RM SUL', '2022-12-01'),
(1903, 274, 226, 123, NULL, 'FINALISTA 2º CURSO  FORMACAO OFICIAIS ACADEMIA MILITAR EXERCITO', '2022-12-01'),
(1904, 516, 58, 117, NULL, 'OFICIAL ANALISE SISTEMAS CENTRO PROCESSAMENTO DE DADOS DIRECCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(1905, 562, 69, 128, NULL, 'SARGENTO PESSOAL SECCAO PESSOAL E QUADROS CLINICA EXERCITO', '2022-12-01'),
(1906, 614, 219, 129, NULL, 'AUXILIAR REGISTO CRM KUANDO KUBANGO RM SUL', '2022-12-01'),
(1907, 9, 273, 136, NULL, 'AT. AKM 1ª SEC. 2º PTAO CDI 72ª BRIM/RM LESTE', '2022-12-01'),
(1908, 349, 295, 136, NULL, 'OPERADOR COMP. C.P.D. 2ª DIV/RM NORTE', '2022-12-01'),
(1909, 109, 261, 136, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1910, 79, 299, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1911, 79, 302, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1912, 109, 363, 136, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1913, 109, 247, 136, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1914, 79, 290, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1916, 79, 297, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1917, 79, 390, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1918, 463, 207, 121, NULL, 'OFICIAL DE PESQUISA E SISTEMAS EMBUTIDOS DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1919, 79, 306, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1920, 79, 298, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1921, 463, 208, 121, NULL, 'OFICIAL GESTAO DE MAPAS DIGITAIS CENTRO DE PROCESSAMENTO DE DADOS DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1922, 79, 305, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1923, 79, 310, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1924, 109, 304, 136, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1925, 109, 308, 136, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1926, 79, 307, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1927, 109, 303, 136, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1928, 79, 309, 136, NULL, 'FINALISTA 6º CURSO FORMACAO BASICA MILITAR CI SANTA EULALIA/EXE', '2022-12-01'),
(1929, 169, 35, 128, NULL, 'OPERADOR COMPUTADOR REPART. PESSOAL E QUADROS RM SUL', '2022-12-01'),
(1930, 169, 16, 128, NULL, 'OPERADOR COMPUTADOR CPD DIRECCAO ARMTO E TECNICA/EXE', '2022-12-01'),
(1931, 721, 159, 111, NULL, 'CHEFE DE RFEPARTICAO DE PLANEAMENTO E ORGANIZACAO DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1932, 575, 169, 128, NULL, 'OPERADOR CENTRO PROCESSAMENTO DADOS DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1933, 712, 367, 128, NULL, 'SARGENTO DISPONIVEL/EXE', '2022-12-01'),
(1934, 150, 171, 117, NULL, 'OF. AMBIENTALISTA SEC. LUTA CONTRA INCENDIO DIRECCAO LOGISTICA/EXE', '2022-12-01'),
(1935, 721, 178, 111, NULL, 'CHEFE DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1936, 57, 220, 136, NULL, 'CMDO EM DA 21ª BRI RM NORTE', '2022-12-01'),
(1937, 583, 114, 121, NULL, 'CMDTE 1º PTAO 2ª CIA 3º BTAO 52ª BRIM RM NORTE', '2022-12-01'),
(1938, 150, 135, 117, NULL, 'CHEFE CPD 74ª BrI RM CENTRO', '2022-12-01'),
(1939, 149, 226, 121, NULL, 'INSTR. EDUC. FISICA MILITAR SEC. TREINO ACAD. MILITAR/EXE', '2022-12-01'),
(1940, 683, 245, 136, NULL, 'ATIRADOR AKM PTAO DEFESA IMEDIATA BTAO CMDO E SERVICOS DA ESCOLA DE FORMACAO DE FORCAS ESPECIAIS/EMGFAA', '2022-12-01'),
(1941, 182, 381, 128, NULL, 'SGTO PESSOAL E QUADROS SEC. PESS. QUADROS 12ª BrI 1ª DIV. INFª RM CABINDA', '2022-12-01'),
(1942, 182, 69, 127, NULL, 'SGTO PESSOAL E QUADROS SECCAO PESSOAL E QUADROS CLINICA/EXE', '2022-12-01'),
(1943, 711, 109, 128, NULL, 'AMANUENSE DA REPARTICAO DE ADMINISTRACAO E FINANCAS DA DIRECCAO DOS SERVICOS DE SAUDE/EMGFAA', '2022-12-01'),
(1944, 710, 76, 120, NULL, 'OFICIAL TECNICO DE HARDWARE DA SECCAO DE INFORMATICA DA DIRECCAO PRINCIPAL DE PREPARACAO DE TROPAS E ENSINO/EMGFAA', '2022-12-01'),
(1945, 589, 134, 128, NULL, 'OPERADOR COMPUTADOR DRM BENGO RM NORTE', '2022-12-01'),
(1946, 248, 272, 129, NULL, 'CMDTE SEC. DESEMBARQUE CCS 1º BTAO 71ª BrI RM NORTE', '2022-12-01'),
(1948, 150, 79, 117, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS DIR. ENGENHARIA INFRA-ESTRUTURAS/EXE', '2022-12-01'),
(1949, 575, 5, 128, NULL, 'OPERADOR CENTRO PROCESSAMENTO DADOS DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1950, 577, 166, 117, NULL, 'CHEFE CENTRO PROCESSAMENTO DADOS DIRECCAO OPERACOES/EXE', '2022-12-01'),
(1951, 248, 239, 129, NULL, 'CMDTE SEC. DESEMBARQUE PTAO BMP CCS BTAO BMP 71ª BrI RM NORTE', '2022-12-01'),
(1952, 263, 101, 131, NULL, 'OP. COMPUTADOR REPARTICAO ACCAO SOCIAL DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1953, 356, 372, 133, NULL, 'AT. LG 2ª SEC. PTAO G. GUARNICAO CCS 52ª BrI  RM NORTE', '2022-12-01'),
(1954, 356, 189, 133, NULL, 'OP. COMPUTADOR SEC. PSS/QUADROS 61ª BrIM 6ª DIV. INFº  RM SUL', '2022-12-01'),
(1955, 182, 81, 128, NULL, 'OP. COMPUTADOR REPART. PESS. QUADROS RM SUL', '2022-12-01'),
(1956, 214, 123, 120, NULL, 'OF. SISTEMA INFORMATICA SEC. INFORMATICA AME/EXE', '2022-12-01'),
(1957, 557, 108, 128, NULL, 'OPERADOR DE CONTROLO E REVISAO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE ADMINISTRACAO E FINANCAS/EXE', '2022-12-01'),
(1958, 549, 300, 136, NULL, 'CDP CRM RM SUL', '2022-12-01'),
(1959, 356, 194, 133, NULL, 'OP. COMPUTADOR SECCAO INFORMATICA 4ª DIV. INF. RM CENTRO', '2022-12-01'),
(1960, 549, 305, 136, NULL, 'CPD DRM RM CABINDA', '2022-12-01'),
(1961, 549, 302, 136, NULL, 'CPD 70ª BrIM RM NORTE', '2022-12-01'),
(1962, 197, 363, 133, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1963, 197, 247, 133, NULL, 'FINALISTA 10º CURSO FORMACAO BASICA MILITAR CI LUENA/EXE', '2022-12-01'),
(1964, 753, 225, 121, NULL, 'CURSO DE ENGENHARIA DE INFORMATICA ISTM', '2022-12-01'),
(1965, 753, 230, 121, NULL, 'CURSO DE ENGENHARIA DE INFORMATICA ISTM', '2022-12-01'),
(1966, 753, 223, 121, NULL, 'CURSO DE ENGENHARIA DE INFORMATICA ISTM', '2022-12-01'),
(1967, 517, 124, 121, NULL, 'OFICIAL PLANEAMENTO SEC. ADM FINANCAS BRIG. ENGª CONSTRUCAO/EXE', '2022-12-01'),
(1968, 549, 307, 136, NULL, 'CPD 31ª BrI RM LESTE', '2022-12-01'),
(1969, 549, 261, 136, NULL, 'CPD HMR RM CENTRO', '2022-12-01'),
(1970, 549, 308, 136, NULL, 'CPD 62ª BrI RM LESTE', '2022-12-01'),
(1971, 549, 304, 136, NULL, 'CPD HMR RM CABINDA', '2022-12-01'),
(1972, 549, 247, 136, NULL, 'CPD 74ª BrI RM CENTRO', '2022-12-01'),
(1973, 549, 299, 136, NULL, 'CPD 41ª BrIM RM CENTRO', '2022-12-01'),
(1975, 129, 287, 45, NULL, 'FINALISTA 19º CURSO FORMACAO SGTO ESCOLA INTER-ARMAS SGTO/EXE', '2022-12-01');
INSERT INTO `tbl_historico_progressao` (`id`, `idOrdem`, `idPessoa`, `CodPatente`, `Cargo_id`, `Cargo_por_normalizar`, `Data_Registo`) VALUES
(1976, 55, 46, 127, NULL, 'AMANUENSE GAB. CMDTE CM GRAFANIL EXE', '2022-12-01'),
(1977, 34, 46, 126, NULL, 'AMANUENSE GAB. CMDTE CM GRAFANIL EXE', '2022-12-01'),
(1978, 129, 289, 45, NULL, 'FINALISTA 19º CURSO FORMACAO SGTO ESCOLA INTER-ARMAS SGTO/EXE', '2022-12-01'),
(1979, 753, 222, 121, NULL, 'CURSO DE ENGENHARIA DE INFORMATICA ISTM', '2022-12-01'),
(1980, 129, 240, 45, NULL, 'FINALISTA 19º CURSO FORMACAO SGTO ESCOLA INTER-ARMAS SGTO/EXE', '2022-12-01'),
(1981, 80, 79, 117, NULL, 'OFICIAL SISTEMAS DE REDES CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(1982, 313, 324, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1983, 313, 326, 136, NULL, 'FINALISTA 13º CURSO INSTRUCAO BASICA MILITAR CENTRO INSTRUCAO CABO LEDO/EMG', '2022-12-01'),
(1984, 153, 284, 123, NULL, 'CADETE  INFORMATICA INSTITUTO TECNICO MILITAR (JOSE MARTI) CUBA', '2022-12-01'),
(1985, 153, 285, 123, NULL, 'CADETE INFORMATICA INSTITUTO TECNICO MILITAR (JOSE MARTI) CUBA', '2022-12-01'),
(1986, 81, 102, 120, NULL, 'OFICIAL PROCESSAMENTO DE DADOS CENTRO PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1987, 404, 135, 117, NULL, 'PROFESSOR DE INFORMATICA DA ESCOLA INTER-ARMAS DE SARGENTO/EXE', '2022-12-01'),
(1988, 404, 23, 117, NULL, 'OFICIAL DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(1989, 427, 34, 117, NULL, 'OFICIAL DE ANALISE E DESENVOLVIMENTO DE SISTEMAS DA SECCAO DE INFORMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(1990, 153, 282, 123, NULL, 'CADETE INFORMATICA INSTITUTO TECNICO MILITAR (JOSE MARTI) CUBA', '2022-12-01'),
(1991, 153, 279, 123, NULL, 'CADETE MILITAR NA UNIVERSIDADE DE INFORMATICA CUBA', '2022-12-01'),
(1992, 81, 223, 120, NULL, 'OFICIAL DE SOFTWARE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR NORTE', '2022-12-01'),
(1994, 81, 222, 120, NULL, 'OFICIAL GESTOR DE MAPAS DIGITAIS CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(1995, 377, 324, 133, NULL, 'OPERADORA DE COMPUTADOR SEC. CPD DO CMDO E/MAIOR DA 101ª BRIGADA DE TANQUES/EXE', '2022-12-01'),
(1996, 303, 254, 128, NULL, 'OPERADOR DE COMPUTADOR SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO DE LUANDA', '2022-12-01'),
(1997, 303, 4, 127, NULL, 'OPERADOR COMPUTADOR CPD DIRECCAO INTELIGENCIA MILITAR OPERATIVA/EXE', '2022-12-01'),
(1998, 281, 83, 128, NULL, 'OPERADOR COMPUTADOR  DRM - HUILA', '2022-12-01'),
(1999, 303, 82, 128, NULL, 'MONITOR CONDUCAO VIATURAS RODAS SECCAO ESTUDO TECNICA BLINDADA ESCOLA INTER-ARMAS SARGENTOS/EXE', '2022-12-01'),
(2000, 359, 103, 128, NULL, 'OPERADOR COMPUTADOR CPD 52ª BrI RM NORTE', '2022-12-01'),
(2001, 184, 124, 120, NULL, 'OFICIAL FINANCAS SECCAO FINANCAS BRIGADA ENGª CONSTRUCAO/EXE', '2022-12-01'),
(2002, 184, 117, 120, NULL, 'OF. PROCESSAMENTO DADOS DRM CUANZA-NORTE RM NORTE', '2022-12-01'),
(2003, 303, 19, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PLANEAMENTO E ORGANIZACAO/EXE', '2022-12-01'),
(2004, 184, 264, 120, NULL, 'CHEFE CPD SPQ 41ª BRIM 4ª DI RM CENTRO', '2022-12-01'),
(2006, 359, 213, 128, NULL, 'OPERADOR COMPUTADOR CPD DIR. IMO/EXE', '2022-12-01'),
(2007, 184, 234, 120, NULL, 'OF. SISTEMAS E REDES REP. INFORMATICA RM SUL', '2022-12-01'),
(2008, 359, 110, 128, NULL, 'ADJ. CIA TANQUES EIAS/EXE', '2022-12-01'),
(2009, 339, 280, 129, NULL, 'CMDTE 2ª SECCAO PDI 70ª BrIM RM NORTE', '2022-12-01'),
(2010, 184, 233, 120, NULL, 'OF. SOFTWARE REP. INFORMATICA RM SUL', '2022-12-01'),
(2011, 303, 119, 127, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DAS OFICINAS GERAIS DE REPARACAO/EXE', '2022-12-01'),
(2012, 351, 262, 121, NULL, 'CMDTE PTAO INFª 1º BTAO 62ª BrI RM LESTE', '2022-12-01'),
(2013, 184, 232, 120, NULL, 'OFICIAL TECNICO SISTEMA DIR. IMO/EXE', '2022-12-01'),
(2014, 184, 235, 120, NULL, 'CMDTE 1º PELOTAO DA 1ª CIA 1º BATALHÃO DE TANQUES DA  101ª BRIGADA DE TANQUE/EXE', '2022-12-01'),
(2015, 377, 184, 133, NULL, 'CONDUTOR-AUTO CRM CUNENE  RM SUL', '2022-12-01'),
(2016, 339, 240, 129, NULL, 'OPERADOR COMPUTADOR SEC. ADMINISTRACAO DISTRITO RECRUTAMENTO MOBILIZACAO MALANGE EXE1', '2022-12-01'),
(2017, 380, 385, 133, NULL, 'OPERADOR DE CRIPTO 6ª SECÇAO DA 52ª BrI 3ª DIV RM LESTE', '2022-12-01'),
(2018, 141, 395, 128, NULL, 'AUXILIAR DE INFORMATICA DA SECCAO DE INFORMATICA DA DIRECCAO DE PREPARACAO COMBATIVA/EXE', '2022-12-01'),
(2019, 158, 246, 117, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA DISPONIVEL DA DIRECCAO DE INFORMATICA/EXE', '2022-12-01'),
(2020, 158, 393, 117, NULL, 'OFICIAL DE SISTEMAS DE CATALOGACAO DA SECCAO DE TECNOLOGIAS DE INFORMACAO DA DIRECCAO DE LOGISTICA/EXE', '2022-12-01'),
(2021, 118, 144, 126, NULL, 'OPERADOR DE COMPUTADOR DA SECCAO DE ADMINISTRACAO EXPEDIENTE E ARQUIVO DO DRM CUNENE REGIAO MILITAR SUL', '2022-12-01'),
(2022, 365, 210, 117, NULL, 'COMISSAO NORMAL DE SERVICO/MINDENVP', '2022-12-01'),
(2023, 365, 252, 120, NULL, 'OFICIAL DE REGISTO DE EFECTIVOS E IDENTIFICACAO DA REPARTICAO DE REGISTO DE EFECTIVOS E IDENTIFICACAO DA UNIDADE CENTRAL DE REGISTO E INFORMACAO DO PESSOAL DA DIRECCAO PRINCIPAL DE PESSOAL E QUADROS/EMGFAA', '2022-12-01'),
(2024, 97, 179, 121, NULL, 'OFICIAL DE PROCESSAMENTO DE DADOS DO CENTRO DE PROCESSAMENTO DE DADOS DA DIRECCAO DE PESSOAL E QUADROS/EXE', '2022-12-01'),
(2025, 380, 261, 133, NULL, 'OPERADORA DE COMPUTADOR DA SECCAO DE ADMINISTRACAO DO DISTRITO DE RECRUTAMENTO E MOBILIZACAO/EXE-HUAMBO', '2022-12-01'),
(2026, 380, 360, 133, NULL, 'OPERADOR DE COMPUTADOR DO CENTRO DE PROCESSAMENTO DE DADOS DO REGIMENTO DE MANUTENCAO DE ARMAMENTO E TECNICA/EXE', '2022-12-01'),
(2027, 380, 329, 133, NULL, 'BOMBO SECCAO DE FANFARRA CCS BCS DA ESCOLA INTER-ARMAS SARGENTOS/EXE', '2022-12-01'),
(2028, 380, 334, 133, NULL, 'ATIRADOR DE LANCA GRANADA DO PTAO DE DEFESA IMEDIATA DO CENTRO DE CLASSIFICACAO E SELECCAO/EXE', '2022-12-01'),
(2029, 380, 322, 133, NULL, 'OPERADOR DE COMPUTADOR CENTRO DE PROCESSAAMENTO DE DADOS DA 32ª BRIGADA/RM LESTE', '2022-12-01'),
(2030, 380, 332, 133, NULL, 'OPERADOR COMPUTADOR SECCAO PESSOAL E QUADROS 75ª BRIM 3ª DIVISAO DE INFANTARIA RM NORTE', '2022-12-01'),
(2031, 380, 328, 133, NULL, 'OPERADOR DE COMPUTADOR DA SECRETARIA GERAL DA ESCOLA INTER-ARMAS SARGENTOS/EXE', '2022-12-01'),
(2032, 380, 306, 133, NULL, 'OPERADOR DE COMPUTADOR DO HOSPITAL MILITAR DA RM CABINDA', '2022-12-01'),
(2033, 285, 342, 131, NULL, NULL, '2022-12-01'),
(2034, 755, 241, 117, 14, NULL, '2024-07-22'),
(2035, 755, 273, 130, 28, NULL, '2024-07-29'),
(2036, 755, 366, 128, 30, NULL, '2024-07-29'),
(2037, 755, 200, 130, 10, NULL, '2024-07-29'),
(2038, 755, 492, 120, 2, NULL, '2024-07-29'),
(2039, 267, 516, 131, 11, NULL, '2024-08-07'),
(2040, 733, 524, 133, 11, NULL, '2024-08-07'),
(2042, 755, 115, 117, 2, NULL, '2024-08-14'),
(2044, 285, 536, 131, 28, NULL, '2024-08-14'),
(2045, 243, 535, 127, 28, NULL, '2024-08-14'),
(2046, 254, 301, 129, 28, NULL, '2024-08-14'),
(2047, 120, 301, 136, 28, NULL, '2024-08-14'),
(2048, 192, 301, 130, 28, NULL, '2024-08-14'),
(2049, 66, 301, 129, 28, NULL, '2024-08-14'),
(2052, 17, 551, 114, 19, NULL, '2025-05-15'),
(2053, 16, 552, 113, 20, NULL, '2025-05-15'),
(2054, 15, 553, 113, 18, NULL, '2025-05-15'),
(2055, 39, 553, 115, 18, NULL, '2025-05-15'),
(2056, 254, 64, 130, NULL, NULL, '2025-07-02'),
(2057, 672, 64, 131, NULL, NULL, '2025-07-02'),
(2058, 671, 64, 136, NULL, NULL, '2025-07-02'),
(2059, 270, 64, 129, NULL, NULL, '2025-07-02'),
(2060, 196, 64, 131, NULL, NULL, '2025-07-02'),
(2073, 43, 229, 117, NULL, NULL, '2025-07-10'),
(2074, 753, 229, 121, NULL, NULL, '2025-07-10'),
(2075, 81, 229, 120, NULL, NULL, '2025-07-10'),
(2076, 737, 229, 123, NULL, NULL, '2025-07-10'),
(2124, 529, 20, 115, NULL, NULL, '2025-09-24'),
(2125, 260, 20, 120, NULL, NULL, '2025-09-24'),
(2126, 150, 20, 117, NULL, NULL, '2025-09-24'),
(2127, 758, 20, 113, 4, NULL, '2025-09-24'),
(2163, NULL, 192, NULL, NULL, NULL, '2025-10-01'),
(2164, 276, 192, 136, NULL, NULL, '2025-10-01'),
(2240, NULL, 554, NULL, NULL, NULL, '2025-10-02'),
(2241, NULL, 554, NULL, NULL, NULL, '2025-10-02'),
(2596, NULL, 555, NULL, NULL, NULL, '2025-10-03'),
(2620, 384, 75, 117, NULL, NULL, '2025-10-04'),
(2621, 529, 75, 115, NULL, NULL, '2025-10-04'),
(2622, 71, 75, 123, NULL, NULL, '2025-10-04'),
(2623, 50, 75, 123, NULL, NULL, '2025-10-04'),
(2624, 100, 75, 121, NULL, NULL, '2025-10-04'),
(2625, 33, 75, 117, NULL, NULL, '2025-10-04'),
(2626, 311, 75, 120, NULL, NULL, '2025-10-04'),
(2627, 660, 75, 117, NULL, NULL, '2025-10-04'),
(2628, 251, 75, 117, NULL, NULL, '2025-10-04'),
(2629, 193, 75, 120, NULL, NULL, '2025-10-04'),
(2631, 487, 387, 120, NULL, NULL, '2025-10-06'),
(2632, 261, 387, 123, NULL, NULL, '2025-10-06'),
(2633, 107, 387, 121, NULL, NULL, '2025-10-06'),
(2634, 184, 387, 120, NULL, NULL, '2025-10-06'),
(2635, 44, 387, 117, 12, NULL, '2025-10-06'),
(2693, 755, 557, 120, NULL, NULL, '2025-10-07'),
(2744, 765, 556, 121, NULL, NULL, '2025-10-08'),
(2750, NULL, 483, NULL, NULL, NULL, '2025-10-08'),
(2829, 67, 399, 121, NULL, 'CADETE DO 4º ANO DO CURSO DE ENGENHARIA INFORMATICA NO ISTM/EMGFAA', '2025-10-09'),
(2872, 371, 365, 121, NULL, NULL, '2025-10-13'),
(2873, 554, 365, 123, NULL, NULL, '2025-10-13'),
(2874, 224, 365, 120, NULL, 'OFICIAL PROGRAMADOR  DA REPARTIÇÃO DE ANÁLISE E DESENVOLVIMENTO DE SISTEMAS', '2025-10-13'),
(2875, 755, 365, 117, NULL, 'OFICIAL PROGRAMADOR DA REPARTIÇÃO DE ANÁLISE E DESENVOLVIMENTO DE SISTEMAS', '2025-10-13'),
(2876, 764, 365, 117, NULL, 'OFICIAL DE PESQUISA E SISTEMAS EMBUTIDOS DA REPARTIÇÃO DE ANÁLISE E DESENVOLVIMENTO DE SISTEMAS', '2025-10-13'),
(2889, NULL, 558, NULL, NULL, NULL, '2025-11-03'),
(2903, 212, 132, 109, NULL, 'CHEFE DA DIRECÇÃO DE INFORMÁTICA/EXE', '2025-11-05'),
(2904, 686, 132, 113, NULL, 'CHEFE DA REPARTIÇÃO DE SERVIÇOS DE INFORMÁTICA DO ESTADO-MAIOR COODENADOR/EXE', '2025-11-05'),
(2905, 699, 132, 111, NULL, 'CHEFE DA REPARTIÇÃO DE SERVIÇOS DE INFORMÁTICA/EXE', '2025-11-05'),
(2906, 1, 132, 115, NULL, 'CHEFE DO GABINETE DE TRATAMENTO DE DADOS DA REPARTIÇÃO DE TECOMUNICAÇÕES E INFORMÁTICA DO CLI', '2025-11-05'),
(2907, 658, 132, 109, NULL, 'CHEFE DA DIRECÇÃO DE INFORMÁTICA/EXE', '2025-11-05'),
(2908, 695, 132, 111, NULL, 'CHEFE ADJUNTO DA DIRECÇÃO DE INFORMÁTICA/EXE', '2025-11-05'),
(2909, 348, 132, 111, NULL, 'CHEFE DA REPARTIÇÃO DE INFORMÁTICA/EXE', '2025-11-05'),
(2910, 638, 132, 115, NULL, 'CHEFE DO SERVIÇO DE INFORMÁTICA ESTADO-MAIOR/EXE', '2025-11-05'),
(2911, 119, 132, 115, NULL, 'CHEFE DA REPARTIÇÃO DE SERVIÇOS DE INFORMÁTICA DO ESTADO-MAIOR COODENADOR/EXE', '2025-11-05'),
(2912, 618, 132, 115, NULL, 'OFICIAL DISPONÍVEL AO COPIE', '2025-11-05'),
(2913, 26, 132, 115, NULL, 'CHEFE DO SERVIÇO DE INFORMÁTICA ESTADO-MAIOR/EXE', '2025-11-05'),
(2914, 452, 132, 115, NULL, 'OFICIAL DE SEGURANÇA DE SISTEMAS DA SECÇÃO DE ESTUDO E PLANEAMENTO E SERVIÇOS DE INFORMÁTICA DO ESTADO-MAIOR COORDENADOR/EXE', '2025-11-05'),
(2974, 659, 25, 111, NULL, 'OFICIAL EM INACTIVIDADE TEMPORARIA/EXE', '2025-11-07'),
(2975, 99, 25, 117, NULL, 'CHEFE SECCAO INFORMATICA 1ª RM', '2025-11-07'),
(2976, 687, 25, 117, NULL, 'CH. SEC. INFORMATICA 1ª RM', '2025-11-07'),
(2977, 708, 25, 115, NULL, 'CH. SEC. INFORMATICA 1ª RM', '2025-11-07'),
(2978, 160, 25, 117, NULL, 'CMDTE CIA RADIO GONIOMETRIA BTAO RADIO ELECTRONICO REGTO RADIO ìELECTRONICO EME', '2025-11-07'),
(2979, 668, 25, 117, NULL, 'CMDTE CIA RADIO GONIOMETRIA BTAO RECTO REGº RADIO ELECTRONICO EMG', '2025-11-07'),
(2980, 527, 25, 115, NULL, 'CHEFE REPARTICAO INFORMATICA RM CABINDA', '2025-11-07'),
(2981, 445, 25, 111, NULL, 'CHEFE DA REPARTICAO DE INFORMATICA DA REGIAO MILITAR CABINDA', '2025-11-07'),
(2982, 418, 25, 115, NULL, '1º OF. P/PLANEAM.  E SISTEMAS DE INFORMACAO REP. DE INFORMATICA RM CABINDA', '2025-11-07'),
(2983, 723, 25, 113, NULL, 'CH. REP. INFORMATICA RM CABINDA', '2025-11-07'),
(2998, 529, 45, 113, NULL, '1º OFICIAL DE ANÁLISE E DESENVILVIMENTO DA REPARTIÇÃO DE ANÁLISE  E DESENVOLVIMENTO DE SISTEMAS', '2025-11-07'),
(2999, 586, 45, 121, NULL, 'PROGRAMADOR DA SECÇÃO DE ADMINISTRAÇÃO E SERVIÇOS DA REPARTIÇÃO DE PESSOAL E QUADROS DA REGIÃO MILITAR BENGO', '2025-11-07'),
(3000, 473, 45, 120, NULL, 'PROGRAMADOR DA SECÇÃO DE ADMINISTRAÇÃO E SERVIÇOS DA REPARTIÇÃO DE PESSOAL E QUADROS DA REGIÃO MILITAR BENGO', '2025-11-07'),
(3001, 103, 45, 117, NULL, 'CHEFE DE SECÇÃO DE PROCESSAMENTO DE DADOS DA REPARTIÇÃO DE INFORMÁTICA DA DQP/EXE', '2025-11-07'),
(3002, 762, 45, 111, NULL, 'CHEFE DA REPARTIÇÃO DE ANÁLISE E DESENVOLVIMENTO DE SISTEMAS', '2025-11-07'),
(3003, 733, 45, 115, NULL, 'OFICIAL DE DESENVOLVIMENTO DE SISTEMAS DA SECÇÃO DE INFORMÁTICA DA DIRECÇÃO DE INSTRUÇÃO E ENSINO', '2025-11-07'),
(3004, 722, 45, 115, NULL, 'OFICIAL DISPONÍVEL DO EXÉRCITO', '2025-11-07'),
(3005, 706, 45, 115, NULL, 'CHEFE DA SECÇÃO DE IDENTIFICAÇÃO DA DPPQ/EMG', '2025-11-07'),
(3006, 725, 45, 115, NULL, 'OFICIAL DE GESTÃO DE CARREIRAS DA REPARTICÇÃO DE GESTÃO DE CARREIRAS DA DIRECÇÃO DE QUADROS DA DPPQ/EMG', '2025-11-07'),
(3007, 425, 45, 117, NULL, 'OFICIAL DE PESQUISA E SISTEMAS EMBUTIDOS DA REPARTIÇÃO DE ANÁLISE E DESENVOLVIMENTO DE SISTEMAS', '2025-11-07'),
(3008, 738, 45, 115, NULL, '1º OFICIAL DE ANÁLISE E DESENVILVIMENTO DA REPARTIÇÃO DE ANÁLISE  E DESENVOLVIMENTO DE SISTEMAS', '2025-11-07'),
(3009, 447, 45, 120, NULL, 'OFICIAL DE INFORMÁTICA DO CPD DA DIREACÇÃO DE PESSOAL/EXE', '2025-11-07'),
(3010, 767, 45, 123, NULL, 'OFICIAL DE PESSOAL DO 1º BATALHÃO DO 49º REGIMENTO DA REGIÃO MILITAR BENGO', '2025-11-07'),
(3011, 348, 45, 120, NULL, 'OPERADOR CHEFE DA SECÇÃO DE PROCESSAMENTO DO CPD DA DIRECÇÃO DE PESSOAL E QUADROS/EXE', '2025-11-07'),
(3012, 202, 107, 133, NULL, 'AMANUENSE DO CMDO DO 1 BTAO DA 12 BRIG. 1 DIV. INF. DA RM CABINDA', '2025-11-07'),
(3013, 102, 107, 136, NULL, 'AT. AKM 1ª SEC. 1º PTAO 3ª CIA 2º BOAP 1ª BRIM 8ª RM', '2025-11-07'),
(3014, 285, 107, 131, NULL, NULL, '2025-11-07'),
(3015, 74, 107, 136, NULL, 'AT. AKM', '2025-11-07'),
(3057, NULL, 7, 121, NULL, 'OFICIAL GESTOR DE MAPAS DIGITAIS DO CENTRO DE PROCESSAMENTO DE DADOS PRINCIPAL DA DIRECCAO DE INFORMATICA/EXE', '2025-11-09'),
(3058, NULL, 7, 129, NULL, 'CMDTE 1º SEC. 4º PTAO CIA CMDO BCS ACADEMIA MILITAR/EXE', '2025-11-09'),
(3059, NULL, 7, 128, NULL, 'STO 2º PTAO 3ª CIA DESTº PROTENCAO OBJECTIVOS ECONOMICOS RM-BENGO', '2025-11-09'),
(3060, NULL, 7, 128, NULL, 'STO OPERACOES SECCAO DE OPERACOES REGIMENTO SVC MATERIAL', '2025-11-09'),
(3061, NULL, 7, 128, NULL, 'SGTO PARA SEGURANCA INFORMATICA DIGITALIZADOR DIRECCAO INFORMATICA/EXE', '2025-11-09'),
(3062, NULL, 7, 127, NULL, 'AUXILIAR HARDWARE DIRECÇÃO INFORMATICA/EXE', '2025-11-09'),
(3063, NULL, 7, 128, NULL, 'AMANUENSE SECCAO EXPEDIENTE E ARQUIVO DIR. INFORMATICA/EXE', '2025-11-09'),
(3064, NULL, 53, 131, NULL, 'AUXILAIR REDE REPARTICAO ASSEGURAMENTO TECNICO DIR INFORMATICA EXEE', '2025-11-09'),
(3065, NULL, 53, 136, NULL, 'OPERADOR SECCAO EXPLORACAO URATOP BATOP/EMG', '2025-11-09'),
(3066, NULL, 53, 136, NULL, 'AUX. SEC. ASSEGURAMENTO REPART. INFORMATICA/EME', '2025-11-09'),
(3067, NULL, 53, 136, NULL, 'RADIO TELEGRAFISTA GRUPO RADIO INTERCEPCAO BTAO RECTO RADIO ìELECT.RRRE/EMG', '2025-11-09'),
(3068, NULL, 53, 133, NULL, 'AUX. SEC.REDES REPARTICAO  ASSEGURAMENTO REPART. INFORMATICA DIR INFAORMATICA/EME', '2025-11-09'),
(3069, NULL, 53, 129, NULL, 'FINALISTA 17º CURSO FORMACAO SARGENTOS/ESCOLA INTER ARMAS SARGENTOS/EXE', '2025-11-09'),
(3070, NULL, 53, 129, NULL, 'SARGENTO EM INACTIVIDADE TEMPORARIA/EXE (RAZOES DE ESTUDOS) LICENCA Nº 0046/CMDTE EXE/2017 DE 30 DE MAIO (4 ANOS)', '2025-11-09'),
(3071, NULL, 53, 129, NULL, 'AUXILAIR DE REDES DA REPARTICAO DE ASSEGURAMENTO TECNICO DA DIRECCAO DE INFORMATICA/EXE', '2025-11-09'),
(3072, NULL, 559, NULL, NULL, NULL, '2025-11-09'),
(3074, NULL, 140, NULL, NULL, NULL, '2025-11-09'),
(3076, NULL, 377, NULL, NULL, NULL, '2025-11-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_linguasfaladas`
--

DROP TABLE IF EXISTS `tbl_linguasfaladas`;
CREATE TABLE IF NOT EXISTS `tbl_linguasfaladas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPessoa` int DEFAULT NULL,
  `idLingua` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=254 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_linguasfaladas`
--

INSERT INTO `tbl_linguasfaladas` (`id`, `idPessoa`, `idLingua`) VALUES
(1, 9, 3),
(3, 21, 1),
(4, 39, 3),
(5, 73, 2),
(7, 92, 1),
(8, 105, 4),
(9, 147, 4),
(10, 165, 2),
(11, 167, 2),
(12, 172, 10),
(13, 173, 9),
(14, 193, 9),
(15, 203, 9),
(16, 223, 14),
(17, 230, 9),
(18, 241, 9),
(19, 271, 5),
(21, 331, 5),
(22, 333, 1),
(23, 336, 1),
(24, 352, 2),
(25, 364, 12),
(27, 369, 9),
(28, 388, 3),
(29, 393, 1),
(31, 172, 4),
(32, 173, 3),
(33, 193, 3),
(34, 203, 7),
(35, 230, 13),
(36, 271, 1),
(37, 283, 7),
(38, 333, 10),
(39, 369, 7),
(40, 393, 3),
(42, 172, 1),
(43, 271, 4),
(45, 73, 7),
(46, 89, 7),
(47, 165, 8),
(48, 172, 13),
(49, 223, 7),
(50, 271, 7),
(51, 282, 8),
(52, 283, 8),
(53, 291, 8),
(54, 316, 8),
(55, 333, 6),
(56, 336, 15),
(57, 364, 7),
(59, 376, 8),
(61, 378, 7),
(62, 379, 7),
(63, 380, 7),
(64, 388, 7),
(65, 392, 7),
(66, 393, 7),
(67, 223, 8),
(68, 271, 6),
(69, 282, 7),
(70, 316, 7),
(71, 364, 13),
(73, 376, 7),
(74, 364, 8),
(80, 115, 2),
(81, 492, 9),
(82, 492, 7),
(83, 516, 9),
(84, 524, 9),
(85, 523, 9),
(86, 525, 9),
(87, 525, 9),
(88, 146, 2),
(91, 146, 9),
(92, 535, 1),
(93, 535, 9),
(94, 536, 1),
(95, 115, 9),
(127, 20, 3),
(128, 20, 2),
(129, 20, 1),
(130, 20, 7),
(171, 75, 3),
(172, 387, 7),
(173, 387, 9),
(189, 557, 7),
(220, 399, 2),
(221, 399, 7),
(231, 365, 4),
(232, 365, 7),
(233, 365, 13),
(239, 45, 1),
(240, 45, 7),
(241, 45, 9),
(251, 140, 2),
(253, 377, 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_ordens`
--

DROP TABLE IF EXISTS `tbl_ordens`;
CREATE TABLE IF NOT EXISTS `tbl_ordens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `N_ORDEM` double DEFAULT NULL,
  `DATA_ORDEM` date DEFAULT NULL,
  `idEntidade` int DEFAULT NULL,
  `idTipoOrdem` int DEFAULT NULL,
  `created` date DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `chave_composta_ordens` (`N_ORDEM`,`DATA_ORDEM`,`idEntidade`,`idTipoOrdem`)
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_ordens`
--

INSERT INTO `tbl_ordens` (`id`, `N_ORDEM`, `DATA_ORDEM`, `idEntidade`, `idTipoOrdem`, `created`, `create_by`) VALUES
(1, 0, '1992-07-22', 4, 13, NULL, NULL),
(2, 1, '1992-12-09', 2, 13, NULL, NULL),
(3, 1, '1999-02-15', 4, 6, NULL, NULL),
(4, 1, '2006-01-31', 4, 1, NULL, NULL),
(5, 1, '2008-02-26', 4, 2, NULL, NULL),
(6, 1, '2011-02-24', 3, 1, NULL, NULL),
(7, 1, '2011-04-29', 3, 2, NULL, NULL),
(8, 1, '2011-04-29', 3, 13, NULL, NULL),
(9, 1, '2015-01-23', 3, 13, NULL, NULL),
(10, 1, '2017-02-02', 3, 9, NULL, NULL),
(11, 1, '2018-06-05', 3, 13, NULL, NULL),
(12, 1, '2019-01-29', 3, 6, NULL, NULL),
(13, 1, '2019-02-19', 3, 15, NULL, NULL),
(14, 1, '2019-03-29', 3, 13, NULL, NULL),
(15, 1, '2019-09-23', 3, 2, NULL, NULL),
(16, 1, '2020-01-02', 3, 8, NULL, NULL),
(17, 1, '2020-01-31', 3, 12, NULL, NULL),
(18, 1, '2021-01-07', 3, 15, NULL, NULL),
(19, 1, '2021-01-11', 3, 8, NULL, NULL),
(20, 1, '2021-01-19', 3, 1, NULL, NULL),
(21, 1, '2021-02-17', 3, 3, NULL, NULL),
(22, 1, '2021-02-17', 3, 1, NULL, NULL),
(23, 1, '2021-02-24', 3, 14, NULL, NULL),
(24, 1, '2021-11-30', 3, 8, NULL, NULL),
(25, 1, '2022-01-31', 3, 15, NULL, NULL),
(26, 2, '1996-01-16', 4, 8, NULL, NULL),
(27, 2, '1996-02-15', 4, 3, NULL, NULL),
(28, 2, '1998-01-08', 4, 1, NULL, NULL),
(29, 2, '1999-02-15', 4, 8, NULL, NULL),
(30, 2, '2004-02-20', 4, 13, NULL, NULL),
(31, 2, '2005-03-04', 4, 8, NULL, NULL),
(32, 2, '2011-04-29', 3, 2, NULL, NULL),
(33, 2, '2012-12-12', 3, 1, NULL, NULL),
(34, 2, '2013-08-07', 3, 3, NULL, NULL),
(35, 2, '2015-01-06', 3, 2, NULL, NULL),
(36, 2, '2016-02-22', 3, 8, NULL, NULL),
(37, 2, '2016-04-25', 3, 2, NULL, NULL),
(38, 2, '2017-02-14', 3, 6, NULL, NULL),
(39, 2, '2017-11-23', 3, 14, NULL, NULL),
(40, 2, '2018-01-09', 3, 13, NULL, NULL),
(41, 2, '2019-02-19', 3, 15, NULL, NULL),
(42, 2, '2021-01-11', 3, 8, NULL, NULL),
(43, 2, '2021-02-17', 3, 1, NULL, NULL),
(44, 2, '2022-02-28', 3, 9, NULL, NULL),
(45, 3, '1993-01-14', 6, 1, NULL, NULL),
(46, 3, '1995-01-25', 4, 8, NULL, NULL),
(47, 3, '1997-01-20', 4, 13, NULL, NULL),
(48, 3, '2004-02-10', 4, 13, NULL, NULL),
(49, 3, '2005-03-03', 4, 1, NULL, NULL),
(50, 3, '2006-02-21', 4, 13, NULL, NULL),
(51, 3, '2007-02-21', 4, 8, NULL, NULL),
(52, 3, '2008-02-13', 4, 8, NULL, NULL),
(53, 3, '2008-05-29', 4, 2, NULL, NULL),
(54, 3, '2012-12-12', 3, 1, NULL, NULL),
(55, 3, '2013-08-07', 3, 1, NULL, NULL),
(56, 3, '2015-01-01', 3, 2, NULL, NULL),
(57, 3, '2015-03-25', 3, 10, NULL, NULL),
(58, 3, '2016-02-22', 3, 8, NULL, NULL),
(59, 3, '2016-03-23', 3, 15, NULL, NULL),
(60, 3, '2017-05-31', 3, 1, NULL, NULL),
(61, 3, '2017-11-23', 3, 14, NULL, NULL),
(62, 3, '2018-03-09', 3, 1, NULL, NULL),
(63, 3, '2020-08-11', 3, 1, NULL, NULL),
(64, 3, '2020-08-19', 3, 2, NULL, NULL),
(65, 3, '2020-09-04', 3, 3, NULL, NULL),
(66, 3, '2021-02-17', 3, 1, NULL, NULL),
(67, 3, '2021-05-19', 2, 1, NULL, NULL),
(68, 3, '2021-09-28', 3, 14, NULL, NULL),
(69, 4, '2000-04-05', 4, 6, NULL, NULL),
(70, 4, '2004-04-29', 4, 8, NULL, NULL),
(71, 4, '2006-02-21', 4, 13, NULL, NULL),
(72, 4, '2007-05-29', 4, 8, NULL, NULL),
(73, 4, '2007-09-10', 4, 8, NULL, NULL),
(74, 4, '2007-10-24', 4, 2, NULL, NULL),
(75, 4, '2008-02-26', 4, 6, NULL, NULL),
(76, 4, '2008-06-12', 4, 2, NULL, NULL),
(77, 4, '2009-12-16', 4, 1, NULL, NULL),
(79, 4, '2015-03-25', 3, 2, NULL, NULL),
(80, 4, '2015-06-30', 3, 8, NULL, NULL),
(81, 4, '2016-08-10', 3, 1, NULL, NULL),
(82, 4, '2017-02-10', 3, 2, NULL, NULL),
(83, 4, '2017-05-15', 3, 2, NULL, NULL),
(84, 4, '2017-05-31', 3, 6, NULL, NULL),
(85, 4, '2017-05-31', 3, 13, NULL, NULL),
(86, 4, '2018-03-09', 3, 1, NULL, NULL),
(87, 4, '2018-03-09', 3, 13, NULL, NULL),
(88, 4, '2018-04-06', 3, 8, NULL, NULL),
(89, 4, '2018-07-23', 3, 2, NULL, NULL),
(90, 4, '2019-02-11', 3, 6, NULL, NULL),
(91, 4, '2020-08-11', 3, 1, NULL, NULL),
(92, 4, '2020-09-28', 3, 3, NULL, NULL),
(93, 4, '2021-02-19', 3, 8, NULL, NULL),
(94, 4, '2021-03-09', 3, 3, NULL, NULL),
(95, 4, '2021-03-09', 3, 2, NULL, NULL),
(96, 4, '2021-11-08', 3, 14, NULL, NULL),
(97, 4, '2022-02-14', 3, 8, NULL, NULL),
(98, 5, '1997-04-28', 4, 8, NULL, NULL),
(99, 5, '2004-04-29', 4, 8, NULL, NULL),
(100, 5, '2006-12-29', 4, 1, NULL, NULL),
(101, 5, '2007-12-13', 4, 2, NULL, NULL),
(102, 5, '2008-02-26', 4, 8, NULL, NULL),
(103, 5, '2008-12-15', 4, 1, NULL, NULL),
(104, 5, '2009-12-16', 4, 1, NULL, NULL),
(106, 5, '2012-05-29', 3, 2, NULL, NULL),
(107, 5, '2012-12-12', 3, 1, NULL, NULL),
(108, 5, '2013-06-07', 3, 1, NULL, NULL),
(109, 5, '2015-03-25', 3, 2, NULL, NULL),
(110, 5, '2016-05-09', 3, 13, NULL, NULL),
(111, 5, '2017-02-09', 3, 8, NULL, NULL),
(112, 5, '2018-03-09', 3, 1, NULL, NULL),
(113, 5, '2018-04-06', 3, 8, NULL, NULL),
(114, 5, '2018-05-17', 3, 6, NULL, NULL),
(115, 5, '2020-08-11', 3, 1, NULL, NULL),
(116, 5, '2021-04-13', 3, 3, NULL, NULL),
(117, 5, '2021-11-08', 3, 14, NULL, NULL),
(118, 5, '2022-02-14', 3, 8, NULL, NULL),
(119, 6, '1997-04-28', 4, 8, NULL, NULL),
(120, 6, '1999-01-10', 4, 13, NULL, NULL),
(121, 6, '2005-03-03', 4, 13, NULL, NULL),
(122, 6, '2005-05-17', 4, 1, NULL, NULL),
(123, 6, '2006-04-25', 4, 13, NULL, NULL),
(124, 6, '2007-04-03', 4, 1, NULL, NULL),
(125, 6, '2008-06-12', 4, 2, NULL, NULL),
(126, 6, '2008-12-15', 4, 1, NULL, NULL),
(127, 6, '2012-08-07', 3, 13, NULL, NULL),
(128, 6, '2013-08-30', 3, 13, NULL, NULL),
(129, 6, '2015-07-27', 3, 2, NULL, NULL),
(130, 6, '2016-03-18', 3, 8, NULL, NULL),
(131, 6, '2017-02-09', 3, 8, NULL, NULL),
(132, 6, '2017-07-14', 3, 2, NULL, NULL),
(133, 6, '2017-07-19', 3, 6, NULL, NULL),
(134, 6, '2017-09-01', 3, 1, NULL, NULL),
(135, 6, '2018-03-09', 3, 1, NULL, NULL),
(136, 6, '2019-04-15', 3, 8, NULL, NULL),
(137, 6, '2019-04-18', 2, 8, NULL, NULL),
(138, 6, '2019-08-29', 3, 8, NULL, NULL),
(139, 6, '2020-08-11', 3, 1, NULL, NULL),
(140, 6, '2021-12-10', 3, 3, NULL, NULL),
(141, 6, '2022-04-05', 3, 8, NULL, NULL),
(142, 7, '1994-08-02', 4, 8, NULL, NULL),
(143, 7, '1995-03-01', 4, 8, NULL, NULL),
(144, 7, '1996-07-12', 4, 8, NULL, NULL),
(145, 7, '2002-01-30', 4, 8, NULL, NULL),
(146, 7, '2007-10-24', 4, 1, NULL, NULL),
(147, 7, '2011-12-12', 3, 1, NULL, NULL),
(148, 7, '2012-07-20', 3, 2, NULL, NULL),
(149, 7, '2013-08-30', 3, 8, NULL, NULL),
(150, 7, '2013-12-11', 3, 1, NULL, NULL),
(151, 7, '2015-08-12', 3, 2, NULL, NULL),
(152, 7, '2016-03-23', 3, 15, NULL, NULL),
(153, 7, '2016-08-15', 3, 13, NULL, NULL),
(154, 7, '2018-05-17', 3, 8, NULL, NULL),
(155, 7, '2019-09-10', 3, 8, NULL, NULL),
(156, 7, '2021-02-19', 3, 8, NULL, NULL),
(157, 7, '2021-04-13', 3, 2, NULL, NULL),
(158, 7, '2022-04-05', 3, 8, NULL, NULL),
(159, 8, '1996-03-23', 4, 13, NULL, NULL),
(160, 8, '1998-03-10', 4, 13, NULL, NULL),
(161, 8, '2005-03-04', 4, 13, NULL, NULL),
(162, 8, '2005-09-20', 4, 8, NULL, NULL),
(163, 8, '2005-11-21', 4, 1, NULL, NULL),
(164, 8, '2006-10-03', 4, 8, NULL, NULL),
(165, 8, '2011-05-27', 3, 8, NULL, NULL),
(166, 8, '2011-12-12', 3, 1, NULL, NULL),
(167, 8, '2012-06-20', 3, 1, NULL, NULL),
(168, 8, '2012-12-31', 3, 13, NULL, NULL),
(169, 8, '2015-04-03', 3, 13, NULL, NULL),
(170, 8, '2016-03-23', 3, 15, NULL, NULL),
(171, 8, '2016-09-07', 3, 1, NULL, NULL),
(172, 8, '2018-05-17', 3, 10, NULL, NULL),
(173, 8, '2018-06-05', 3, 8, NULL, NULL),
(174, 8, '2019-03-29', 3, 8, NULL, NULL),
(175, 8, '2020-09-28', 3, 2, NULL, NULL),
(176, 9, '1996-10-09', 5, 8, NULL, NULL),
(177, 9, '2000-02-08', 4, 13, NULL, NULL),
(178, 9, '2008-07-04', 4, 2, NULL, NULL),
(179, 9, '2010-05-17', 4, 8, NULL, NULL),
(180, 9, '2013-08-21', 3, 2, NULL, NULL),
(181, 9, '2013-09-23', 3, 13, NULL, NULL),
(182, 9, '2013-12-11', 3, 1, NULL, NULL),
(183, 9, '2014-03-06', 3, 2, NULL, NULL),
(184, 9, '2017-11-23', 3, 1, NULL, NULL),
(185, 9, '2018-05-17', 3, 10, NULL, NULL),
(186, 9, '2019-03-29', 3, 8, NULL, NULL),
(187, 9, '2021-04-13', 3, 1, NULL, NULL),
(188, 9, '2022-06-29', 3, 13, NULL, NULL),
(189, 10, '1996-01-27', 4, 8, NULL, NULL),
(190, 10, '2000-02-08', 4, 13, NULL, NULL),
(191, 10, '2002-01-30', 4, 8, NULL, NULL),
(192, 10, '2006-12-29', 4, 13, NULL, NULL),
(193, 10, '2007-12-06', 4, 1, NULL, NULL),
(194, 10, '2008-08-07', 4, 2, NULL, NULL),
(195, 10, '2010-03-26', 4, 2, NULL, NULL),
(196, 10, '2011-11-08', 3, 13, NULL, NULL),
(197, 10, '2015-08-24', 3, 2, NULL, NULL),
(198, 10, '2016-06-26', 3, 13, NULL, NULL),
(199, 10, '2017-11-24', 3, 1, NULL, NULL),
(200, 10, '2019-05-25', 3, 8, NULL, NULL),
(201, 10, '2019-10-03', 3, 2, NULL, NULL),
(202, 10, '2020-08-11', 3, 1, NULL, NULL),
(203, 10, '2020-11-05', 3, 2, NULL, NULL),
(204, 11, '1993-03-04', 2, 8, NULL, NULL),
(205, 11, '1995-03-01', 4, 13, NULL, NULL),
(206, 11, '1998-03-10', 4, 1, NULL, NULL),
(207, 11, '2003-06-04', 4, 8, NULL, NULL),
(208, 11, '2006-11-21', 4, 8, NULL, NULL),
(209, 11, '2006-12-29', 4, 1, NULL, NULL),
(210, 11, '2007-12-13', 4, 6, NULL, NULL),
(211, 11, '2010-08-05', 4, 13, NULL, NULL),
(212, 11, '2011-07-28', 1, 1, NULL, NULL),
(213, 11, '2012-08-28', 3, 13, NULL, NULL),
(214, 11, '2013-12-11', 3, 1, NULL, NULL),
(215, 11, '2014-04-09', 3, 2, NULL, NULL),
(216, 11, '2015-06-26', 3, 13, NULL, NULL),
(217, 11, '2016-03-23', 3, 15, NULL, NULL),
(218, 11, '2017-02-27', 3, 2, NULL, NULL),
(219, 11, '2017-07-25', 3, 6, NULL, NULL),
(220, 11, '2017-11-23', 3, 1, NULL, NULL),
(221, 11, '2018-06-20', 3, 1, NULL, NULL),
(222, 11, '2020-08-11', 3, 1, NULL, NULL),
(223, 11, '2021-03-10', 3, 8, NULL, NULL),
(224, 11, '2021-12-10', 3, 1, NULL, NULL),
(225, 12, '2000-05-16', 4, 8, NULL, NULL),
(226, 12, '2004-09-09', 4, 13, NULL, NULL),
(227, 12, '2004-09-23', 4, 8, NULL, NULL),
(228, 12, '2010-08-13', 4, 8, NULL, NULL),
(229, 12, '2011-06-07', 3, 8, NULL, NULL),
(230, 12, '2011-10-21', 3, 13, NULL, NULL),
(231, 12, '2012-01-30', 3, 8, NULL, NULL),
(232, 12, '2013-01-29', 3, 8, NULL, NULL),
(233, 12, '2014-02-06', 3, 8, NULL, NULL),
(234, 12, '2016-09-16', 3, 6, NULL, NULL),
(235, 12, '2016-11-10', 3, 13, NULL, NULL),
(236, 12, '2017-11-23', 3, 2, NULL, NULL),
(237, 12, '2017-11-23', 3, 1, NULL, NULL),
(238, 12, '2018-06-15', 3, 8, NULL, NULL),
(239, 12, '2018-09-05', 3, 13, NULL, NULL),
(240, 12, '2019-09-18', 3, 15, NULL, NULL),
(241, 12, '2020-04-24', 3, 8, NULL, NULL),
(242, 12, '2020-08-11', 3, 1, NULL, NULL),
(243, 12, '2021-12-10', 3, 1, NULL, NULL),
(244, 12, '2022-01-25', 2, 8, NULL, NULL),
(245, 12, '2022-06-08', 3, 8, NULL, NULL),
(246, 13, '1998-05-25', 4, 8, NULL, NULL),
(247, 13, '2011-12-12', 3, 13, NULL, NULL),
(248, 13, '2013-12-11', 3, 1, NULL, NULL),
(249, 13, '2016-04-18', 3, 8, NULL, NULL),
(250, 13, '2016-12-14', 3, 13, NULL, NULL),
(251, 13, '2017-11-23', 3, 1, NULL, NULL),
(252, 13, '2019-09-18', 3, 15, NULL, NULL),
(253, 13, '2019-10-03', 3, 2, NULL, NULL),
(254, 13, '2020-08-11', 3, 1, NULL, NULL),
(255, 13, '2021-11-17', 3, 2, NULL, NULL),
(256, 13, '2021-12-31', 2, 1, NULL, NULL),
(257, 13, '2022-01-25', 2, 8, NULL, NULL),
(258, 14, '1995-04-26', 4, 8, NULL, NULL),
(259, 14, '2004-10-07', 4, 8, NULL, NULL),
(260, 14, '2004-12-15', 4, 1, NULL, NULL),
(261, 14, '2010-10-06', 4, 2, NULL, NULL),
(262, 14, '2011-12-15', 3, 2, NULL, NULL),
(263, 14, '2013-12-11', 3, 1, NULL, NULL),
(264, 14, '2016-04-18', 3, 8, NULL, NULL),
(265, 14, '2016-12-14', 3, 13, NULL, NULL),
(266, 14, '2017-11-23', 3, 1, NULL, NULL),
(267, 14, '2018-07-02', 3, 8, NULL, NULL),
(268, 14, '2019-10-03', 3, 2, NULL, NULL),
(269, 14, '2020-06-24', 3, 10, NULL, NULL),
(270, 14, '2021-12-10', 3, 1, NULL, NULL),
(271, 14, '2021-12-10', 3, 14, NULL, NULL),
(272, 14, '2022-06-09', 3, 8, NULL, NULL),
(273, 15, '2004-11-10', 4, 13, NULL, NULL),
(274, 15, '2011-12-15', 3, 2, NULL, NULL),
(275, 15, '2012-12-12', 3, 13, NULL, NULL),
(276, 15, '2015-10-12', 3, 2, NULL, NULL),
(277, 15, '2016-04-18', 3, 8, NULL, NULL),
(278, 15, '2016-10-14', 3, 6, NULL, NULL),
(279, 15, '2017-02-14', 3, 8, NULL, NULL),
(280, 15, '2017-04-17', 3, 2, NULL, NULL),
(281, 15, '2017-11-23', 3, 1, NULL, NULL),
(282, 15, '2017-12-28', 3, 13, NULL, NULL),
(283, 15, '2020-04-27', 3, 8, NULL, NULL),
(284, 15, '2021-04-16', 3, 8, NULL, NULL),
(285, 15, '2021-12-10', 3, 1, NULL, NULL),
(286, 16, '1995-03-21', 4, 13, NULL, NULL),
(287, 16, '1996-10-15', 5, 13, NULL, NULL),
(288, 16, '2000-03-06', 4, 13, NULL, NULL),
(289, 16, '2004-11-10', 4, 8, NULL, NULL),
(290, 16, '2005-12-09', 4, 1, NULL, NULL),
(291, 16, '2010-10-13', 4, 13, NULL, NULL),
(292, 16, '2015-10-12', 3, 2, NULL, NULL),
(293, 16, '2016-04-18', 3, 8, NULL, NULL),
(294, 16, '2017-11-23', 3, 1, NULL, NULL),
(295, 16, '2018-06-10', 3, 8, NULL, NULL),
(296, 16, '2018-10-23', 3, 13, NULL, NULL),
(297, 16, '2021-04-16', 3, 8, NULL, NULL),
(298, 17, '2003-06-11', 4, 8, NULL, NULL),
(299, 17, '2005-12-09', 4, 13, NULL, NULL),
(300, 17, '2008-06-12', 4, 6, NULL, NULL),
(301, 17, '2015-10-12', 3, 2, NULL, NULL),
(302, 17, '2016-09-14', 3, 2, NULL, NULL),
(303, 17, '2017-11-23', 3, 1, NULL, NULL),
(304, 17, '2018-07-11', 3, 8, NULL, NULL),
(305, 17, '2019-09-23', 3, 14, NULL, NULL),
(306, 17, '2020-06-10', 3, 8, NULL, NULL),
(307, 17, '2020-09-07', 3, 1, NULL, NULL),
(308, 17, '2022-08-31', 3, 8, NULL, NULL),
(309, 18, '1993-04-05', 5, 1, NULL, NULL),
(310, 18, '2008-06-12', 4, 6, NULL, NULL),
(311, 18, '2010-12-14', 4, 1, NULL, NULL),
(312, 18, '2011-06-07', 3, 8, NULL, NULL),
(313, 18, '2015-10-12', 3, 2, NULL, NULL),
(314, 18, '2016-04-25', 3, 8, NULL, NULL),
(315, 18, '2016-09-14', 3, 2, NULL, NULL),
(316, 18, '2017-03-17', 3, 2, NULL, NULL),
(317, 18, '2017-11-23', 3, 1, NULL, NULL),
(318, 18, '2018-10-31', 3, 10, NULL, NULL),
(319, 18, '2018-12-28', 3, 13, NULL, NULL),
(320, 18, '2022-08-31', 3, 8, NULL, NULL),
(321, 19, '1995-06-27', 4, 8, NULL, NULL),
(322, 19, '1996-11-13', 4, 1, NULL, NULL),
(323, 19, '1997-11-05', 4, 8, NULL, NULL),
(324, 19, '2010-12-14', 4, 1, NULL, NULL),
(325, 19, '2011-06-07', 3, 8, NULL, NULL),
(326, 19, '2012-01-30', 4, 8, NULL, NULL),
(327, 19, '2013-08-16', 3, 13, NULL, NULL),
(328, 19, '2017-04-17', 3, 8, NULL, NULL),
(329, 19, '2017-11-23', 3, 1, NULL, NULL),
(330, 19, '2019-09-18', 3, 8, NULL, NULL),
(331, 19, '2020-06-03', 3, 8, NULL, NULL),
(332, 19, '2020-09-04', 3, 1, NULL, NULL),
(333, 19, '2021-10-12', 3, 13, NULL, NULL),
(334, 20, '1995-05-16', 4, 13, NULL, NULL),
(335, 20, '1995-10-09', 4, 8, NULL, NULL),
(336, 20, '2016-10-22', 3, 2, NULL, NULL),
(337, 20, '2017-03-17', 3, 2, NULL, NULL),
(338, 20, '2017-04-17', 3, 8, NULL, NULL),
(339, 20, '2017-11-23', 3, 1, NULL, NULL),
(340, 20, '2018-07-30', 3, 8, NULL, NULL),
(341, 20, '2019-05-25', 3, 9, NULL, NULL),
(342, 20, '2019-09-18', 3, 8, NULL, NULL),
(343, 20, '2020-06-03', 3, 8, NULL, NULL),
(344, 20, '2021-05-05', 3, 8, NULL, NULL),
(345, 20, '2021-12-10', 3, 2, NULL, NULL),
(346, 21, '1995-06-09', 4, 13, NULL, NULL),
(347, 21, '2000-04-24', 4, 8, NULL, NULL),
(348, 21, '2004-11-17', 4, 8, NULL, NULL),
(349, 21, '2015-02-13', 3, 8, NULL, NULL),
(350, 21, '2017-03-17', 3, 2, NULL, NULL),
(351, 21, '2017-11-23', 3, 1, NULL, NULL),
(352, 21, '2020-06-10', 3, 8, NULL, NULL),
(353, 21, '2020-09-28', 3, 1, NULL, NULL),
(354, 21, '2021-05-24', 3, 8, NULL, NULL),
(355, 21, '2021-12-10', 3, 13, NULL, NULL),
(356, 22, '2013-12-12', 3, 2, NULL, NULL),
(357, 22, '2016-05-30', 3, 8, NULL, NULL),
(358, 22, '2017-05-17', 3, 8, NULL, NULL),
(359, 22, '2017-11-23', 3, 1, NULL, NULL),
(360, 22, '2018-12-28', 3, 13, NULL, NULL),
(361, 22, '2019-04-17', 3, 15, NULL, NULL),
(362, 22, '2019-09-23', 3, 8, NULL, NULL),
(363, 22, '2020-09-28', 3, 1, NULL, NULL),
(364, 22, '2021-05-24', 3, 8, NULL, NULL),
(365, 22, '2022-03-30', 2, 8, NULL, NULL),
(366, 23, '2000-05-17', 4, 13, NULL, NULL),
(367, 23, '2008-07-04', 4, 6, NULL, NULL),
(368, 23, '2013-10-14', 3, 13, NULL, NULL),
(369, 23, '2017-11-23', 3, 1, NULL, NULL),
(370, 23, '2019-09-23', 3, 8, NULL, NULL),
(371, 23, '2020-04-27', 2, 1, NULL, NULL),
(372, 23, '2020-06-24', 3, 8, NULL, NULL),
(373, 23, '2021-06-04', 3, 8, NULL, NULL),
(374, 23, '2021-12-31', 2, 1, NULL, NULL),
(375, 24, '2002-04-19', 4, 13, NULL, NULL),
(376, 24, '2013-10-14', 3, 13, NULL, NULL),
(377, 24, '2017-11-23', 3, 1, NULL, NULL),
(378, 24, '2018-09-03', 3, 8, NULL, NULL),
(379, 24, '2021-06-04', 3, 8, NULL, NULL),
(380, 24, '2021-12-10', 3, 2, NULL, NULL),
(381, 25, '2017-05-31', 3, 8, NULL, NULL),
(382, 25, '2017-10-23', 3, 6, NULL, NULL),
(383, 25, '2019-10-30', 3, 8, NULL, NULL),
(384, 25, '2021-06-17', 3, 8, NULL, NULL),
(385, 26, '2011-06-07', 3, 8, NULL, NULL),
(386, 26, '2017-05-31', 3, 8, NULL, NULL),
(387, 26, '2021-06-17', 3, 8, NULL, NULL),
(388, 27, '1993-04-24', 6, 1, NULL, NULL),
(389, 27, '2008-10-24', 4, 8, NULL, NULL),
(390, 27, '2011-06-07', 3, 8, NULL, NULL),
(391, 27, '2015-12-21', 3, 2, NULL, NULL),
(392, 27, '2017-05-31', 3, 8, NULL, NULL),
(393, 27, '2018-10-02', 3, 8, NULL, NULL),
(394, 27, '2019-12-13', 3, 8, NULL, NULL),
(395, 28, '2003-08-24', 4, 8, NULL, NULL),
(396, 28, '2015-03-07', 3, 8, NULL, NULL),
(397, 28, '2015-12-29', 3, 2, NULL, NULL),
(398, 28, '2016-06-06', 3, 8, NULL, NULL),
(399, 28, '2017-09-01', 3, 2, NULL, NULL),
(400, 28, '2019-12-19', 3, 8, NULL, NULL),
(401, 28, '2021-06-22', 3, 8, NULL, NULL),
(402, 29, '1995-10-07', 4, 8, NULL, NULL),
(403, 29, '2010-05-17', 4, 8, NULL, NULL),
(404, 29, '2016-06-06', 3, 8, NULL, NULL),
(405, 29, '2017-05-31', 3, 8, NULL, NULL),
(406, 29, '2017-10-26', 3, 2, NULL, NULL),
(407, 29, '2018-09-28', 3, 8, NULL, NULL),
(408, 29, '2019-09-30', 2, 15, NULL, NULL),
(409, 30, '1993-04-29', 4, 1, NULL, NULL),
(410, 30, '2016-07-22', 3, 8, NULL, NULL),
(411, 30, '2019-12-19', 3, 8, NULL, NULL),
(412, 31, '2013-11-12', 3, 13, NULL, NULL),
(413, 31, '2016-07-22', 3, 8, NULL, NULL),
(414, 31, '2017-12-28', 3, 2, NULL, NULL),
(415, 31, '2019-12-13', 3, 9, NULL, NULL),
(416, 31, '2020-08-11', 3, 8, NULL, NULL),
(417, 31, '2022-04-26', 2, 8, NULL, NULL),
(418, 32, '2010-05-17', 4, 8, NULL, NULL),
(419, 32, '2014-04-12', 3, 8, NULL, NULL),
(420, 32, '2017-07-19', 3, 8, NULL, NULL),
(421, 32, '2019-12-02', 2, 8, NULL, NULL),
(422, 32, '2020-08-11', 3, 8, NULL, NULL),
(423, 33, '1993-05-05', 6, 1, NULL, NULL),
(424, 33, '1995-10-07', 4, 8, NULL, NULL),
(425, 33, '2010-05-17', 4, 8, NULL, NULL),
(426, 33, '2013-11-12', 3, 13, NULL, NULL),
(427, 33, '2016-08-10', 3, 8, NULL, NULL),
(428, 33, '2017-07-19', 3, 8, NULL, NULL),
(429, 33, '2019-12-31', 2, 15, NULL, NULL),
(430, 33, '2020-08-20', 3, 8, NULL, NULL),
(431, 34, '2010-05-17', 4, 8, NULL, NULL),
(432, 34, '2016-08-10', 3, 8, NULL, NULL),
(433, 34, '2016-12-20', 3, 15, NULL, NULL),
(434, 34, '2019-12-30', 3, 8, NULL, NULL),
(435, 34, '2020-08-20', 3, 8, NULL, NULL),
(436, 35, '1994-06-04', 4, 8, NULL, NULL),
(437, 35, '2016-08-10', 3, 2, NULL, NULL),
(438, 35, '2017-07-19', 3, 8, NULL, NULL),
(439, 35, '2019-12-31', 2, 9, NULL, NULL),
(440, 36, '2003-12-15', 4, 1, NULL, NULL),
(441, 36, '2017-07-19', 3, 8, NULL, NULL),
(442, 36, '2018-12-28', 3, 8, NULL, NULL),
(443, 37, '2014-04-12', 3, 8, NULL, NULL),
(444, 37, '2017-07-19', 3, 8, NULL, NULL),
(445, 37, '2017-10-19', 2, 1, NULL, NULL),
(446, 37, '2020-09-24', 3, 8, NULL, NULL),
(447, 38, '2002-06-21', 4, 8, NULL, NULL),
(448, 38, '2021-08-11', 3, 8, NULL, NULL),
(449, 39, '2017-08-10', 3, 8, NULL, NULL),
(450, 39, '2020-10-07', 3, 8, NULL, NULL),
(451, 39, '2021-08-11', 3, 8, NULL, NULL),
(452, 40, '1995-10-16', 4, 8, NULL, NULL),
(453, 40, '2020-10-07', 3, 8, NULL, NULL),
(454, 40, '2021-08-11', 3, 8, NULL, NULL),
(455, 41, '2002-06-21', 4, 13, NULL, NULL),
(456, 41, '2012-01-28', 3, 8, NULL, NULL),
(457, 41, '2012-02-28', 3, 8, NULL, NULL),
(458, 41, '2017-10-19', 2, 1, NULL, NULL),
(459, 41, '2020-10-07', 3, 8, NULL, NULL),
(460, 42, '2002-06-21', 4, 1, NULL, NULL),
(461, 43, '2002-06-21', 4, 1, NULL, NULL),
(462, 43, '2011-06-20', 3, 8, NULL, NULL),
(463, 43, '2015-05-05', 3, 6, NULL, NULL),
(464, 43, '2017-09-05', 3, 8, NULL, NULL),
(465, 43, '2021-08-30', 3, 8, NULL, NULL),
(466, 44, '1992-12-30', 2, 6, NULL, NULL),
(467, 44, '1993-06-09', 4, 1, NULL, NULL),
(468, 44, '1998-09-28', 4, 13, NULL, NULL),
(469, 44, '2016-10-14', 3, 8, NULL, NULL),
(470, 44, '2020-10-19', 3, 8, NULL, NULL),
(471, 44, '2021-08-30', 3, 8, NULL, NULL),
(472, 45, '2000-06-20', 4, 13, NULL, NULL),
(473, 45, '2002-06-21', 4, 1, NULL, NULL),
(474, 45, '2010-10-18', 4, 8, NULL, NULL),
(475, 45, '2016-10-14', 3, 8, NULL, NULL),
(476, 45, '2017-09-05', 3, 8, NULL, NULL),
(477, 45, '2017-10-19', 2, 1, NULL, NULL),
(478, 46, '1994-02-23', 4, 1, NULL, NULL),
(479, 46, '1998-10-10', 4, 8, NULL, NULL),
(480, 46, '2002-06-21', 4, 1, NULL, NULL),
(481, 46, '2016-10-14', 3, 8, NULL, NULL),
(482, 46, '2021-09-16', 3, 8, NULL, NULL),
(483, 47, '2002-06-21', 4, 1, NULL, NULL),
(484, 47, '2016-10-17', 3, 8, NULL, NULL),
(485, 48, '2002-06-21', 4, 1, NULL, NULL),
(486, 48, '2016-10-17', 3, 8, NULL, NULL),
(487, 48, '2021-09-27', 3, 8, NULL, NULL),
(488, 49, '2000-06-20', 4, 13, NULL, NULL),
(489, 49, '2017-10-19', 2, 1, NULL, NULL),
(490, 49, '2020-11-06', 3, 8, NULL, NULL),
(491, 49, '2021-09-27', 3, 8, NULL, NULL),
(492, 50, '2002-06-21', 4, 1, NULL, NULL),
(493, 50, '2014-05-12', 3, 8, NULL, NULL),
(494, 50, '2016-11-03', 3, 8, NULL, NULL),
(495, 50, '2017-10-23', 3, 8, NULL, NULL),
(496, 51, '1999-05-04', 4, 1, NULL, NULL),
(497, 51, '2016-11-03', 3, 8, NULL, NULL),
(498, 51, '2017-10-19', 2, 1, NULL, NULL),
(499, 51, '2020-11-06', 3, 8, NULL, NULL),
(500, 52, '1993-09-27', 6, 1, NULL, NULL),
(501, 52, '1993-09-30', 6, 1, NULL, NULL),
(502, 52, '1994-03-30', 4, 1, NULL, NULL),
(503, 52, '1994-08-02', 4, 8, NULL, NULL),
(504, 52, '1995-02-24', 6, 6, NULL, NULL),
(505, 52, '1995-03-21', 4, 13, NULL, NULL),
(506, 52, '1995-03-28', 4, 13, NULL, NULL),
(507, 52, '1995-10-07', 4, 8, NULL, NULL),
(508, 52, '1997-05-08', 2, 8, NULL, NULL),
(509, 52, '2000-07-12', 4, 13, NULL, NULL),
(510, 52, '2010-10-28', 4, 8, NULL, NULL),
(511, 52, '2016-11-22', 3, 8, NULL, NULL),
(512, 52, '2017-10-23', 3, 8, NULL, NULL),
(513, 52, '2020-11-06', 3, 8, NULL, NULL),
(514, 53, '2012-04-23', 3, 8, NULL, NULL),
(515, 53, '2016-11-28', 3, 8, NULL, NULL),
(516, 54, '2012-04-23', 3, 8, NULL, NULL),
(517, 54, '2015-07-08', 3, 8, NULL, NULL),
(518, 54, '2017-10-23', 3, 8, NULL, NULL),
(519, 56, '1999-05-04', 4, 8, NULL, NULL),
(520, 56, '2000-08-07', 4, 13, NULL, NULL),
(521, 56, '2014-05-27', 3, 8, NULL, NULL),
(522, 56, '2021-10-29', 3, 8, NULL, NULL),
(523, 57, '2000-08-07', 4, 1, NULL, NULL),
(524, 57, '2014-08-18', 3, 2, NULL, NULL),
(525, 57, '2020-11-18', 3, 8, NULL, NULL),
(526, 57, '2021-10-29', 3, 8, NULL, NULL),
(527, 58, '2010-12-02', 4, 8, NULL, NULL),
(528, 58, '2014-08-18', 3, 2, NULL, NULL),
(529, 58, '2020-05-27', 2, 1, NULL, NULL),
(530, 58, '2020-12-04', 3, 8, NULL, NULL),
(531, 58, '2022-08-30', 2, 8, NULL, NULL),
(532, 59, '1993-03-14', 5, 1, NULL, NULL),
(533, 59, '2010-12-02', 4, 8, NULL, NULL),
(534, 59, '2014-08-18', 3, 2, NULL, NULL),
(535, 59, '2020-12-04', 3, 8, NULL, NULL),
(536, 60, '2017-12-28', 3, 8, NULL, NULL),
(537, 60, '2021-10-29', 3, 8, NULL, NULL),
(538, 60, '2022-08-30', 2, 8, NULL, NULL),
(539, 61, '1993-01-10', 2, 13, NULL, NULL),
(540, 61, '2000-08-16', 4, 1, NULL, NULL),
(541, 61, '2017-12-28', 3, 8, NULL, NULL),
(542, 62, '2021-11-08', 3, 8, NULL, NULL),
(543, 63, '1993-10-05', 6, 1, NULL, NULL),
(544, 63, '1999-08-31', 4, 13, NULL, NULL),
(545, 63, '2018-02-04', 2, 1, NULL, NULL),
(546, 63, '2021-11-08', 3, 8, NULL, NULL),
(547, 64, '1999-05-10', 4, 8, NULL, NULL),
(548, 64, '2011-06-20', 3, 8, NULL, NULL),
(549, 65, '2015-06-06', 3, 16, NULL, NULL),
(550, 67, '2011-06-20', 3, 8, NULL, NULL),
(551, 67, '2021-11-08', 3, 8, NULL, NULL),
(552, 69, '2000-08-03', 4, 13, NULL, NULL),
(553, 69, '2002-07-26', 4, 3, NULL, NULL),
(554, 69, '2018-06-20', 2, 1, NULL, NULL),
(555, 70, '2014-10-29', 3, 13, NULL, NULL),
(556, 72, '1993-09-27', 6, 1, NULL, NULL),
(557, 72, '2015-09-05', 3, 8, NULL, NULL),
(558, 73, '1993-09-04', 4, 1, NULL, NULL),
(559, 73, '2014-11-05', 3, 13, NULL, NULL),
(560, 74, '2002-08-07', 4, 1, NULL, NULL),
(561, 75, '2014-10-22', 3, 13, NULL, NULL),
(562, 76, '2012-05-10', 3, 8, NULL, NULL),
(563, 79, '2015-09-23', 3, 8, NULL, NULL),
(564, 81, '2010-12-14', 3, 8, NULL, NULL),
(565, 81, '2011-06-24', 3, 8, NULL, NULL),
(566, 83, '2015-11-06', 3, 8, NULL, NULL),
(567, 85, '1995-01-06', 2, 7, NULL, NULL),
(568, 87, '2000-10-10', 4, 13, NULL, NULL),
(569, 87, '2002-08-07', 4, 1, NULL, NULL),
(570, 87, '2015-11-26', 3, 8, NULL, NULL),
(571, 88, '1994-04-06', 4, 1, NULL, NULL),
(572, 88, '1994-12-13', 4, 8, NULL, NULL),
(573, 90, '2000-10-10', 4, 8, NULL, NULL),
(574, 90, '2015-11-30', 3, 8, NULL, NULL),
(575, 91, '2014-06-27', 3, 8, NULL, NULL),
(576, 91, '2015-11-30', 3, 8, NULL, NULL),
(577, 92, '2014-06-27', 3, 8, NULL, NULL),
(578, 92, '2021-05-05', 2, 8, NULL, NULL),
(579, 93, '2020-09-24', 2, 1, NULL, NULL),
(580, 95, '1993-12-03', 4, 1, NULL, NULL),
(581, 97, '2012-06-20', 3, 8, NULL, NULL),
(582, 98, '2000-11-21', 4, 8, NULL, NULL),
(583, 98, '2013-11-12', 3, 8, NULL, NULL),
(584, 103, '1994-05-24', 4, 1, NULL, NULL),
(585, 104, '1994-05-24', 4, 1, NULL, NULL),
(586, 104, '2000-12-13', 4, 1, NULL, NULL),
(587, 104, '2011-10-03', 3, 8, NULL, NULL),
(588, 105, '2002-10-17', 4, 13, NULL, NULL),
(589, 105, '2014-06-27', 3, 8, NULL, NULL),
(590, 105, '2014-07-08', 3, 8, NULL, NULL),
(591, 106, '1994-06-02', 4, 13, NULL, NULL),
(592, 106, '2014-07-08', 3, 8, NULL, NULL),
(593, 107, '2000-12-20', 4, 13, NULL, NULL),
(594, 108, '2012-06-20', 3, 8, NULL, NULL),
(595, 110, '1993-10-12', 4, 1, NULL, NULL),
(596, 110, '1993-12-10', 4, 1, NULL, NULL),
(597, 110, '1994-06-04', 4, 1, NULL, NULL),
(598, 117, '2002-12-09', 4, 13, NULL, NULL),
(599, 119, '2002-12-09', 4, 3, NULL, NULL),
(600, 121, '2013-11-12', 3, 8, NULL, NULL),
(601, 122, '2002-12-09', 4, 8, NULL, NULL),
(602, 122, '2012-07-04', 3, 13, NULL, NULL),
(603, 123, '2001-03-21', 4, 1, NULL, NULL),
(604, 124, '1994-07-21', 4, 1, NULL, NULL),
(605, 124, '2020-12-17', 2, 1, NULL, NULL),
(606, 125, '2001-03-21', 4, 13, NULL, NULL),
(607, 126, '2011-11-07', 3, 8, NULL, NULL),
(608, 127, '2002-12-09', 4, 1, NULL, NULL),
(609, 127, '2011-11-07', 3, 8, NULL, NULL),
(610, 127, '2014-09-15', 3, 8, NULL, NULL),
(611, 128, '1993-12-01', 4, 1, NULL, NULL),
(612, 128, '1993-12-30', 4, 8, NULL, NULL),
(613, 128, '2002-12-19', 4, 13, NULL, NULL),
(614, 130, '2011-11-28', 3, 8, NULL, NULL),
(615, 131, '1994-07-25', 4, 1, NULL, NULL),
(616, 132, '2001-04-06', 4, 1, NULL, NULL),
(617, 132, '2002-08-07', 4, 13, NULL, NULL),
(618, 134, '1996-04-30', 2, 7, NULL, NULL),
(619, 134, '2001-04-12', 4, 13, NULL, NULL),
(620, 138, '1994-08-15', 4, 13, NULL, NULL),
(621, 138, '2001-04-12', 4, 13, NULL, NULL),
(622, 139, '2001-04-12', 4, 8, NULL, NULL),
(623, 140, '2011-10-21', 3, 8, NULL, NULL),
(624, 143, '2012-08-08', 3, 8, NULL, NULL),
(625, 143, '2014-09-23', 3, 8, NULL, NULL),
(626, 146, '2014-10-08', 3, 8, NULL, NULL),
(627, 147, '1999-07-31', 4, 8, NULL, NULL),
(628, 147, '2001-04-28', 4, 1, NULL, NULL),
(629, 147, '2001-05-12', 4, 13, NULL, NULL),
(630, 147, '2012-08-08', 3, 8, NULL, NULL),
(631, 149, '2014-10-08', 3, 8, NULL, NULL),
(632, 150, '2012-08-15', 3, 8, NULL, NULL),
(633, 150, '2014-10-08', 3, 8, NULL, NULL),
(634, 154, '2012-09-15', 3, 8, NULL, NULL),
(635, 158, '1999-08-27', 4, 13, NULL, NULL),
(636, 161, '2001-06-30', 4, 8, NULL, NULL),
(637, 168, '1994-09-20', 4, 1, NULL, NULL),
(638, 175, '1997-07-25', 2, 8, NULL, NULL),
(639, 175, '1999-10-18', 4, 13, NULL, NULL),
(640, 176, '1999-10-18', 4, 1, NULL, NULL),
(641, 176, '2001-07-12', 4, 8, NULL, NULL),
(642, 177, '1999-10-18', 4, 13, NULL, NULL),
(643, 179, '1999-10-18', 4, 8, NULL, NULL),
(644, 179, '1999-10-18', 4, 1, NULL, NULL),
(645, 184, '1994-12-02', 4, 2, NULL, NULL),
(646, 184, '2012-11-20', 3, 8, NULL, NULL),
(647, 185, '2014-10-29', 3, 8, NULL, NULL),
(648, 190, '2012-12-31', 3, 8, NULL, NULL),
(649, 199, '1998-09-01', 2, 8, NULL, NULL),
(650, 202, '2014-12-05', 3, 8, NULL, NULL),
(651, 203, '2014-12-05', 3, 8, NULL, NULL),
(652, 210, '1999-12-08', 4, 13, NULL, NULL),
(653, 214, '2001-08-27', 4, 13, NULL, NULL),
(654, 215, '1999-12-31', 4, 13, NULL, NULL),
(655, 217, '1999-12-31', 4, 13, NULL, NULL),
(656, 218, '1999-12-31', 4, 13, NULL, NULL),
(657, 221, '1999-12-31', 4, 8, NULL, NULL),
(658, 221, '2011-08-09', 1, 6, NULL, NULL),
(659, 221, '2021-09-20', 2, 8, NULL, NULL),
(660, 224, '2015-01-03', 3, 8, NULL, NULL),
(661, 226, '2001-08-13', 4, 8, NULL, NULL),
(662, 228, '2001-08-28', 4, 1, NULL, NULL),
(663, 231, '1999-01-18', 2, 8, NULL, NULL),
(664, 233, '1994-08-16', 2, 13, NULL, NULL),
(665, 239, '2001-09-12', 4, 8, NULL, NULL),
(666, 247, '2008-06-10', 2, 2, NULL, NULL),
(667, 270, '2001-10-23', 4, 13, NULL, NULL),
(668, 279, '1999-09-10', 2, 8, NULL, NULL),
(669, 285, '2001-11-27', 4, 8, NULL, NULL),
(670, 294, '2009-04-20', 3, 11, NULL, NULL),
(671, 296, '2001-12-12', 4, 13, NULL, NULL),
(672, 297, '2001-12-12', 4, 1, NULL, NULL),
(673, 312, '1997-05-08', 2, 8, NULL, NULL),
(674, 312, '2010-01-25', 2, 2, NULL, NULL),
(675, 325, '2001-12-26', 4, 1, NULL, NULL),
(676, 356, '1997-12-08', 6, 6, NULL, NULL),
(677, 360, '2001-05-11', 2, 7, NULL, NULL),
(678, 388, '1999-01-05', 2, 3, NULL, NULL),
(679, 394, '2001-08-28', 2, 8, NULL, NULL),
(680, 409, '2013-04-02', 2, 2, NULL, NULL),
(681, 441, '2003-01-17', 2, 8, NULL, NULL),
(682, 449, '1998-12-11', 6, 7, NULL, NULL),
(683, 467, '2015-04-10', 2, 6, NULL, NULL),
(684, 476, '1999-05-03', 6, 8, NULL, NULL),
(685, 479, '1999-05-29', 6, 1, NULL, NULL),
(686, 486, '2001-01-17', 2, 1, NULL, NULL),
(687, 501, '2004-12-16', 2, 8, NULL, NULL),
(688, 511, '2001-08-26', 2, 3, NULL, NULL),
(689, 529, '2007-01-15', 2, 13, NULL, NULL),
(690, 536, '2007-08-22', 2, 8, NULL, NULL),
(691, 539, '1999-12-29', 6, 13, NULL, NULL),
(692, 545, '2002-02-02', 2, 11, NULL, NULL),
(693, 548, '2008-05-14', 2, 6, NULL, NULL),
(694, 558, '2008-12-09', 2, 8, NULL, NULL),
(695, 565, '2009-06-29', 2, 8, NULL, NULL),
(696, 573, '2010-06-30', 2, 8, NULL, NULL),
(697, 574, '2002-08-02', 2, 1, NULL, NULL),
(698, 576, '2010-09-27', 2, 8, NULL, NULL),
(699, 586, '2002-12-20', 2, 3, NULL, NULL),
(700, 599, '2011-07-31', 2, 8, NULL, NULL),
(701, 612, '2003-03-12', 2, 13, NULL, NULL),
(702, 614, '2000-08-01', 6, 7, NULL, NULL),
(703, 677, '2013-05-13', 2, 8, NULL, NULL),
(704, 684, '2001-01-29', 6, 6, NULL, NULL),
(705, 690, '2003-12-12', 2, 8, NULL, NULL),
(706, 694, '2013-09-24', 2, 8, NULL, NULL),
(707, 695, '2013-09-24', 2, 8, NULL, NULL),
(708, 706, '2004-12-16', 2, 1, NULL, NULL),
(709, 717, '2001-03-21', 6, 8, NULL, NULL),
(710, 717, '2014-04-30', 2, 8, NULL, NULL),
(711, 720, '2014-05-15', 2, 8, NULL, NULL),
(712, 754, '2014-09-08', 2, 8, NULL, NULL),
(713, 760, '2007-12-14', 2, 1, NULL, NULL),
(714, 765, '2008-03-25', 2, 1, NULL, NULL),
(715, 771, '2008-08-07', 2, 2, NULL, NULL),
(716, 776, '2015-01-28', 2, 7, NULL, NULL),
(717, 778, '2008-12-09', 2, 1, NULL, NULL),
(718, 784, '2009-12-16', 2, 1, NULL, NULL),
(719, 785, '2009-12-17', 2, 1, NULL, NULL),
(720, 789, '2009-12-17', 2, 1, NULL, NULL),
(721, 797, '2015-05-20', 2, 8, NULL, NULL),
(722, 798, '2015-05-20', 2, 8, NULL, NULL),
(723, 799, '2010-12-16', 2, 1, NULL, NULL),
(724, 804, '2001-08-18', 6, 13, NULL, NULL),
(725, 822, '2011-12-17', 2, 1, NULL, NULL),
(726, 823, '2011-12-17', 2, 1, NULL, NULL),
(727, 827, '2015-09-09', 2, 8, NULL, NULL),
(728, 829, '2015-09-09', 2, 8, NULL, NULL),
(729, 830, '2011-12-17', 2, 1, NULL, NULL),
(730, 835, '2015-10-29', 2, 8, NULL, NULL),
(731, 839, '2012-09-13', 2, 2, NULL, NULL),
(732, 841, '2015-11-30', 2, 8, NULL, NULL),
(733, 846, '2015-12-24', 2, 8, NULL, NULL),
(734, 855, '2012-11-28', 2, 2, NULL, NULL),
(735, 857, '2012-12-12', 2, 1, NULL, NULL),
(736, 858, '2012-12-16', 2, 1, NULL, NULL),
(737, 878, '2013-04-03', 2, 2, NULL, NULL),
(738, 879, '2016-08-13', 2, 8, NULL, NULL),
(739, 891, '2016-10-18', 2, 8, NULL, NULL),
(740, 893, '2016-10-24', 2, 8, NULL, NULL),
(741, 910, '2013-12-17', 2, 1, NULL, NULL),
(742, 918, '2017-05-05', 2, 8, NULL, NULL),
(743, 920, '2017-05-09', 2, 1, NULL, NULL),
(744, 924, '2017-07-05', 2, 8, NULL, NULL),
(745, 948, '2014-04-08', 2, 2, NULL, NULL),
(746, 948, '2017-12-05', 2, 8, NULL, NULL),
(747, 955, '2018-01-24', 2, 8, NULL, NULL),
(748, 956, '2014-05-12', 2, 2, NULL, NULL),
(749, 957, '2014-05-12', 2, 1, NULL, NULL),
(750, 957, '2018-02-02', 2, 8, NULL, NULL),
(751, 971, '2018-06-25', 2, 8, NULL, NULL),
(752, 979, '2018-09-28', 2, 8, NULL, NULL),
(753, 995, '2015-05-20', 2, 1, NULL, NULL),
(754, 998, '2016-05-04', 2, 1, NULL, NULL),
(755, 3, '2024-04-04', 3, 1, '2024-07-22', NULL),
(756, 15, '2023-08-30', 2, 1, '2024-07-29', NULL),
(758, 8, '2024-06-18', 2, 3, '2024-08-14', NULL),
(759, 8, '2024-06-18', 2, 1, '2024-08-14', NULL),
(760, 5, '2024-03-04', 3, 3, '2024-08-14', NULL),
(761, 10, '2006-12-29', 4, 2, '2024-08-14', NULL),
(762, 1, '2024-04-04', 2, 1, '2025-02-19', NULL),
(763, 77, '2009-12-16', 4, 1, '2025-10-01', NULL),
(764, 10, '2025-02-28', 3, 8, '2025-10-03', NULL),
(765, 21, '2024-08-21', 2, 1, '2025-10-07', NULL),
(767, 217, '1999-12-31', 4, 2, '2025-10-08', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_regiaomilitar`
--

DROP TABLE IF EXISTS `tbl_regiaomilitar`;
CREATE TABLE IF NOT EXISTS `tbl_regiaomilitar` (
  `CodRM` tinyint NOT NULL,
  `RamoID` tinyint DEFAULT NULL,
  `Designacao_RM` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `abrev_RM` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estado_regiao` smallint DEFAULT '1',
  PRIMARY KEY (`CodRM`) USING BTREE,
  KEY `RamoID` (`RamoID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_regiaomilitar`
--

INSERT INTO `tbl_regiaomilitar` (`CodRM`, `RamoID`, `Designacao_RM`, `abrev_RM`, `estado_regiao`) VALUES
(1, 5, 'QUARTEL GENERAL/COMANDO DO EXERCITO', 'CMDO EXE', 1),
(2, 5, 'UNID. SUB. CENTRAL', 'UNID. SUB. CENTRAL', 1),
(3, 5, 'RM LUANDA', 'RM LUANDA', 1),
(5, 5, 'RM CABINDA', 'RM CABINDA', 1),
(6, 5, 'RM NORTE', 'RM NORTE', 1),
(7, 5, 'RM LESTE', 'RM LESTE', 1),
(8, 5, 'RM CENTRO', 'RM CENTRO', 1),
(9, 5, 'RM SUL', 'RM SUL', 1),
(10, 5, 'RM SUDESTE', 'RM SUDESTE', 1),
(11, 5, 'RM NORDESTE', 'RM NORDESTE', 1),
(12, 5, 'RM MÉDIO KWANZA', 'RM MÉDIO KWANZA', 1),
(13, 1, 'MINISTÉRIO DA DEFESA E VETERANOS DA PÁTRIA', 'MINDENVP', 1),
(14, 1, 'ESTADO MAIOR GENERAL', 'EMG', 1),
(15, 1, 'CASA DE SEGURANÇA DO PRESIDENTE DA REPÚBLICA', 'CSPR', 1),
(16, 1, 'SERVIÇO DE INTELIGÊNCIA E SEGURANÇA MILITAR', 'SISM', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_subdivisao_ueo`
--

DROP TABLE IF EXISTS `tbl_subdivisao_ueo`;
CREATE TABLE IF NOT EXISTS `tbl_subdivisao_ueo` (
  `id_divisao` int NOT NULL,
  `descricao_subdivisao_ueo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_divisao`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_subdivisao_ueo`
--

INSERT INTO `tbl_subdivisao_ueo` (`id_divisao`, `descricao_subdivisao_ueo`) VALUES
(0, 'Não Preenchido'),
(10, 'Gabinetes e Orgãos de Inspenção e Justiça'),
(20, 'Direcções da Area Administativa'),
(30, 'Direcções da Area Operativa'),
(40, 'Outras Sub-unidades do Comando do Exército'),
(50, '1ª Divisão de Infantaria'),
(60, '2ª Divisão de Infantaria'),
(70, '3ª Divisão de Infantaria'),
(80, '4ª Divisão de Infantaria'),
(90, '5ª Divisão de Infantaria'),
(95, '6ª Divisão de Infantaria');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipoordem`
--

DROP TABLE IF EXISTS `tbl_tipoordem`;
CREATE TABLE IF NOT EXISTS `tbl_tipoordem` (
  `CodTipoOrdem` int NOT NULL,
  `Descricao_tipo_ordem` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TipoAbrev` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Grupo_tipo_ordem` int DEFAULT NULL,
  PRIMARY KEY (`CodTipoOrdem`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_tipoordem`
--

INSERT INTO `tbl_tipoordem` (`CodTipoOrdem`, `Descricao_tipo_ordem`, `TipoAbrev`, `Grupo_tipo_ordem`) VALUES
(1, 'PROMOÇÃO', 'PRO', 1),
(2, 'PATENTEAMENTO', 'PAT', 1),
(3, 'GRADUAÇÃO', 'GRD', 1),
(4, 'DESPROMOÇÃO', 'DPRO', 1),
(5, 'DESGRADUAÇÃO', 'DGRD', 1),
(6, 'NOMEAÇÃO', 'NOM', 2),
(7, 'EXONERAÇÃO', 'EXO', 2),
(8, 'EXONERAÇÃO E NOMEAÇÃO', 'EXN', 2),
(9, 'LICENCIAMENTO A REFORMA', 'LRF', 4),
(10, 'LICENCIAMENTO A RESERVA', 'LRS', 4),
(11, 'LICENCIAMENTO DISPONIBILIDADE', 'LDP', 4),
(12, 'REVOGAÇÃO', 'RVG', 5),
(13, 'PATENTEAMENTO E NOMEAÇÃO', 'PTN', 1),
(14, 'TRANSIÇÃO DE FORMA DE PRESTAÇÃO DE SERVIÇO', 'TFPS', 5),
(15, 'MATRÍCULA', 'MAT', 5),
(16, 'DESPACHO', 'DESP', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipos_linguas`
--

DROP TABLE IF EXISTS `tbl_tipos_linguas`;
CREATE TABLE IF NOT EXISTS `tbl_tipos_linguas` (
  `idLingua` int NOT NULL,
  `descricaoLingua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grupoLingua` int DEFAULT NULL,
  PRIMARY KEY (`idLingua`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_tipos_linguas`
--

INSERT INTO `tbl_tipos_linguas` (`idLingua`, `descricaoLingua`, `grupoLingua`) VALUES
(1, 'Umbundu', 1),
(2, 'Kimbundo', 1),
(3, 'Kikongo', 1),
(4, 'Tchokwe', 1),
(5, 'Fiote', 1),
(6, 'Lingala', 1),
(7, 'Inglês', 2),
(8, 'Espanhol', 2),
(9, 'Português', 2),
(10, 'Nganguela', 1),
(11, 'Nhaneca-Humbi', 1),
(12, 'Kwanhama', 1),
(13, 'Francês', 2),
(14, 'Ngoia', 1),
(15, 'Alemão', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipo_contacto`
--

DROP TABLE IF EXISTS `tbl_tipo_contacto`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_contacto` (
  `idTipoContactos` int NOT NULL,
  `tipoContacto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idTipoContactos`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_tipo_contacto`
--

INSERT INTO `tbl_tipo_contacto` (`idTipoContactos`, `tipoContacto`) VALUES
(1, 'Telef Pessoal'),
(2, 'Telef Alternativo'),
(3, 'Telef Casa'),
(4, 'Telef Familiar Emergencias'),
(5, 'Telef Serviço'),
(6, 'Email');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipo_membro`
--

DROP TABLE IF EXISTS `tbl_tipo_membro`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_membro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_tipo_membro`
--

INSERT INTO `tbl_tipo_membro` (`id`, `descricao`) VALUES
(1, 'Presidente'),
(2, '1º Vice-Presidente'),
(3, '2º Vice-Presidente'),
(4, 'Membro'),
(5, 'Secretário'),
(7, 'Não Membro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipo_subunidade`
--

DROP TABLE IF EXISTS `tbl_tipo_subunidade`;
CREATE TABLE IF NOT EXISTS `tbl_tipo_subunidade` (
  `id_tipo_subunidade` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_grupo_tipo_subunidade` int DEFAULT NULL COMMENT 'Ligada ao tipo grupo subunidade',
  PRIMARY KEY (`id_tipo_subunidade`) USING BTREE,
  KEY `id_grupo_tipo_subunidade` (`id_grupo_tipo_subunidade`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbl_tipo_subunidade`
--

INSERT INTO `tbl_tipo_subunidade` (`id_tipo_subunidade`, `descricao`, `id_grupo_tipo_subunidade`) VALUES
(1, 'Batalhão', 2),
(2, 'Repartição', 1),
(3, 'Companhia', 2),
(4, 'Pelotão', 2),
(5, 'Secção', 2),
(6, 'Comando', 2),
(7, 'Chefia', 1),
(8, 'Comando Estado Maior', 2),
(9, 'Outros Orgãos e Serviços', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbsituacaosvcmilitar`
--

DROP TABLE IF EXISTS `tbsituacaosvcmilitar`;
CREATE TABLE IF NOT EXISTS `tbsituacaosvcmilitar` (
  `CodSitSvcMilitar` int NOT NULL,
  `DescSitSvcMilitar` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AbrevSitSvcMilitar` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`CodSitSvcMilitar`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tbsituacaosvcmilitar`
--

INSERT INTO `tbsituacaosvcmilitar` (`CodSitSvcMilitar`, `DescSitSvcMilitar`, `AbrevSitSvcMilitar`) VALUES
(1, 'Activo', 'ACT'),
(2, 'Desertor', 'DST'),
(3, 'Falecido', 'FAL'),
(4, 'Prisioneiro do IN', 'PRI'),
(5, 'Desaparecido', 'DSP'),
(6, 'Reforma', 'REF'),
(7, 'Reserva', 'RES'),
(8, 'Disponibilidade', 'DISP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_curso`
--

DROP TABLE IF EXISTS `tipo_curso`;
CREATE TABLE IF NOT EXISTS `tipo_curso` (
  `id_tipo_curso` int NOT NULL AUTO_INCREMENT,
  `tipo_curso` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo_curso`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tipo_curso`
--

INSERT INTO `tipo_curso` (`id_tipo_curso`, `tipo_curso`) VALUES
(1, 'Militar'),
(2, 'Cívil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `id_tipo_doc` int NOT NULL AUTO_INCREMENT,
  `nome_doc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo_doc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tipo_documento`
--

INSERT INTO `tipo_documento` (`id_tipo_doc`, `nome_doc`) VALUES
(1, 'BI'),
(2, 'Passaporte');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_incorporacao`
--

DROP TABLE IF EXISTS `tipo_incorporacao`;
CREATE TABLE IF NOT EXISTS `tipo_incorporacao` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `tipo_incorporacao`
--

INSERT INTO `tipo_incorporacao` (`id_tipo`, `nome`) VALUES
(1, 'Incorporação'),
(2, 'Ingresso FPS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_incorporacao_data`
--

DROP TABLE IF EXISTS `tipo_incorporacao_data`;
CREATE TABLE IF NOT EXISTS `tipo_incorporacao_data` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `pessoa_juridica` int NOT NULL DEFAULT '0',
  `id_tipo_incorporacao` int NOT NULL,
  `data_incorporacao` date DEFAULT NULL,
  `local` int DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `tipo_incorporacao` (`id_tipo_incorporacao`),
  KEY `id_pessoa_juridica` (`pessoa_juridica`),
  KEY `local_incorporacao` (`local`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tipo_incorporacao_data`
--

INSERT INTO `tipo_incorporacao_data` (`id_data`, `pessoa_juridica`, `id_tipo_incorporacao`, `data_incorporacao`, `local`, `created`, `modify`) VALUES
(1, 1, 1, '1991-03-04', NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, NULL, NULL),
(3, 3, 1, '1993-02-02', NULL, NULL, NULL),
(4, 4, 1, '1994-06-03', NULL, NULL, NULL),
(5, 5, 1, NULL, NULL, NULL, NULL),
(6, 6, 1, '1988-11-26', NULL, NULL, '2024-07-05 12:42:56'),
(8, 8, 1, '1988-06-20', NULL, NULL, NULL),
(9, 9, 1, '1985-04-22', NULL, NULL, '2024-07-10 11:09:16'),
(10, 10, 1, '1984-10-10', NULL, NULL, NULL),
(11, 11, 1, '1993-10-01', NULL, NULL, NULL),
(12, 12, 1, '1996-12-01', NULL, NULL, NULL),
(13, 13, 1, '1988-09-29', NULL, NULL, NULL),
(14, 14, 1, '1988-03-23', NULL, NULL, NULL),
(15, 15, 1, '1996-01-17', NULL, NULL, '2024-08-14 13:46:32'),
(16, 16, 1, '1994-06-06', NULL, NULL, NULL),
(17, 17, 1, '1984-01-01', NULL, NULL, NULL),
(18, 18, 1, '1994-04-18', NULL, NULL, NULL),
(19, 19, 1, '1995-04-26', NULL, NULL, NULL),
(20, 20, 1, '1994-05-20', NULL, NULL, '2025-09-24 16:11:22'),
(21, 21, 1, '1996-07-08', NULL, NULL, NULL),
(22, 22, 1, NULL, NULL, NULL, NULL),
(23, 23, 1, '1997-04-11', NULL, NULL, NULL),
(24, 24, 1, '1994-05-15', NULL, NULL, '2024-08-01 11:40:51'),
(26, 26, 1, '1987-03-12', NULL, NULL, '2024-08-12 14:35:20'),
(27, 27, 1, NULL, NULL, NULL, NULL),
(28, 28, 1, '1998-04-26', NULL, NULL, NULL),
(29, 29, 1, '1988-09-05', NULL, NULL, NULL),
(30, 30, 1, '1995-05-25', NULL, NULL, NULL),
(31, 31, 1, '1995-10-04', NULL, NULL, '2024-08-01 10:50:12'),
(32, 32, 1, NULL, NULL, NULL, NULL),
(33, 33, 1, NULL, NULL, NULL, NULL),
(34, 34, 1, NULL, NULL, NULL, NULL),
(35, 35, 1, '1994-07-11', NULL, NULL, NULL),
(36, 36, 1, '1998-04-16', NULL, NULL, '2024-08-12 11:51:24'),
(37, 37, 1, NULL, NULL, NULL, NULL),
(38, 38, 1, '1987-11-11', NULL, NULL, NULL),
(39, 39, 1, '1995-11-10', NULL, NULL, NULL),
(40, 40, 1, '1999-05-17', NULL, NULL, NULL),
(41, 41, 1, '1995-11-27', NULL, NULL, NULL),
(42, 42, 1, '1993-08-08', NULL, NULL, '2024-08-12 14:21:56'),
(43, 43, 1, '1999-02-15', NULL, NULL, NULL),
(44, 44, 1, '1998-05-25', NULL, NULL, '2024-07-10 10:59:09'),
(46, 46, 1, '1996-05-01', NULL, NULL, '2024-07-17 15:38:25'),
(47, 47, 1, '1992-12-27', NULL, NULL, '2024-07-10 11:05:34'),
(48, 48, 1, '1996-03-30', NULL, NULL, NULL),
(49, 49, 1, '1999-04-30', NULL, NULL, NULL),
(50, 50, 1, '1999-03-16', NULL, NULL, NULL),
(51, 51, 1, '1999-04-28', NULL, NULL, NULL),
(52, 52, 1, NULL, NULL, NULL, NULL),
(54, 54, 1, NULL, NULL, NULL, NULL),
(55, 55, 1, '1980-01-01', NULL, NULL, '2024-07-10 10:57:37'),
(56, 56, 1, '1980-04-17', NULL, NULL, NULL),
(57, 57, 1, '1995-04-03', NULL, NULL, NULL),
(58, 58, 1, '1997-01-10', NULL, NULL, '2024-07-10 11:11:11'),
(59, 59, 1, NULL, NULL, NULL, NULL),
(60, 60, 1, '1999-12-08', NULL, NULL, '2024-08-12 14:02:14'),
(61, 61, 1, '1995-04-12', NULL, NULL, '2024-08-12 14:26:32'),
(62, 62, 1, '1986-05-05', NULL, NULL, NULL),
(63, 63, 1, '2001-02-23', NULL, NULL, NULL),
(64, 64, 1, '2001-05-01', NULL, NULL, '2025-07-02 15:11:46'),
(65, 65, 1, '2011-11-10', NULL, NULL, NULL),
(66, 66, 1, '2001-12-03', NULL, NULL, NULL),
(67, 67, 1, '1993-10-10', NULL, NULL, '2024-08-12 13:56:08'),
(68, 68, 1, '2001-09-09', NULL, NULL, NULL),
(69, 69, 1, NULL, NULL, NULL, NULL),
(70, 70, 1, '1998-07-15', NULL, NULL, NULL),
(71, 71, 1, NULL, NULL, NULL, NULL),
(72, 72, 1, '1993-01-15', NULL, NULL, NULL),
(73, 73, 1, '2005-04-20', NULL, NULL, '2024-07-10 11:26:28'),
(74, 74, 1, '2005-04-19', NULL, NULL, NULL),
(75, 75, 1, '2005-04-20', NULL, NULL, '2025-10-04 16:38:33'),
(76, 76, 1, NULL, NULL, NULL, NULL),
(77, 77, 1, NULL, NULL, NULL, NULL),
(78, 78, 1, NULL, NULL, NULL, NULL),
(79, 79, 1, '2005-04-23', NULL, NULL, NULL),
(80, 80, 1, '2005-04-24', NULL, NULL, NULL),
(81, 81, 1, '2005-04-18', NULL, NULL, NULL),
(82, 82, 1, '2005-04-20', NULL, NULL, NULL),
(83, 83, 1, '2005-04-20', NULL, NULL, NULL),
(84, 84, 1, '2005-03-19', NULL, NULL, NULL),
(85, 85, 1, NULL, NULL, NULL, NULL),
(86, 86, 1, NULL, NULL, NULL, NULL),
(87, 87, 1, NULL, NULL, NULL, NULL),
(88, 88, 1, NULL, NULL, NULL, NULL),
(89, 89, 1, '2003-03-15', NULL, NULL, NULL),
(90, 90, 1, '1998-04-10', NULL, NULL, NULL),
(91, 91, 1, '1998-04-05', NULL, NULL, NULL),
(92, 92, 1, '2002-04-10', NULL, NULL, NULL),
(93, 93, 1, '1999-06-20', NULL, NULL, NULL),
(94, 94, 1, '1999-04-05', NULL, NULL, NULL),
(95, 95, 1, '1997-09-12', NULL, NULL, NULL),
(96, 96, 1, '2000-03-19', NULL, NULL, NULL),
(97, 97, 1, '1999-05-05', NULL, NULL, NULL),
(98, 98, 1, '2000-02-26', NULL, NULL, NULL),
(99, 99, 1, '1998-07-07', NULL, NULL, NULL),
(100, 100, 1, '1997-10-20', NULL, NULL, NULL),
(101, 101, 1, NULL, NULL, NULL, NULL),
(102, 102, 1, NULL, NULL, NULL, NULL),
(103, 103, 1, '1996-06-23', NULL, NULL, NULL),
(104, 104, 1, NULL, NULL, NULL, NULL),
(105, 105, 1, '2007-01-22', NULL, NULL, NULL),
(106, 106, 1, NULL, NULL, NULL, NULL),
(108, 108, 1, NULL, NULL, NULL, NULL),
(109, 109, 1, NULL, NULL, NULL, NULL),
(110, 110, 1, '2007-05-02', NULL, NULL, NULL),
(111, 111, 1, '2007-02-05', NULL, NULL, NULL),
(112, 112, 1, '1997-02-26', NULL, NULL, NULL),
(113, 113, 1, '2007-01-23', NULL, NULL, NULL),
(114, 114, 1, '2007-05-07', NULL, NULL, NULL),
(115, 115, 1, '2007-07-02', NULL, NULL, '2024-08-23 14:38:44'),
(116, 116, 1, NULL, NULL, NULL, NULL),
(117, 117, 1, '2003-02-16', NULL, NULL, '2024-08-15 15:07:24'),
(118, 118, 1, NULL, NULL, NULL, NULL),
(119, 119, 1, '1997-07-15', NULL, NULL, NULL),
(120, 120, 1, '1996-03-03', NULL, NULL, NULL),
(121, 121, 1, NULL, NULL, NULL, NULL),
(122, 122, 1, NULL, NULL, NULL, NULL),
(123, 123, 1, '2007-02-20', NULL, NULL, NULL),
(124, 124, 1, NULL, NULL, NULL, NULL),
(125, 125, 1, NULL, NULL, NULL, NULL),
(126, 126, 1, '1998-06-10', NULL, NULL, NULL),
(127, 127, 1, NULL, NULL, NULL, NULL),
(128, 128, 1, NULL, NULL, NULL, NULL),
(129, 129, 1, '1997-04-19', NULL, NULL, '2024-08-14 14:11:47'),
(130, 130, 1, '1997-07-28', NULL, NULL, NULL),
(131, 131, 1, '1999-06-06', NULL, NULL, '2024-07-10 11:18:54'),
(133, 133, 1, NULL, NULL, NULL, NULL),
(134, 134, 1, NULL, NULL, NULL, NULL),
(135, 135, 1, '1993-10-20', NULL, NULL, '2024-07-15 11:56:29'),
(136, 136, 1, '1993-01-08', NULL, NULL, NULL),
(137, 137, 1, NULL, NULL, NULL, NULL),
(138, 138, 1, NULL, NULL, NULL, NULL),
(139, 139, 1, '1988-08-20', NULL, NULL, NULL),
(141, 141, 1, '1988-03-14', NULL, NULL, NULL),
(142, 142, 1, '1993-06-23', NULL, NULL, '2024-08-12 12:00:19'),
(143, 143, 1, '1992-10-10', NULL, NULL, NULL),
(144, 144, 1, '1994-04-14', NULL, NULL, NULL),
(145, 145, 1, '1992-06-12', NULL, NULL, NULL),
(146, 146, 1, '1988-04-24', NULL, NULL, '2024-08-14 10:03:15'),
(147, 147, 1, '1993-06-06', NULL, NULL, NULL),
(148, 148, 1, '1993-02-14', NULL, NULL, NULL),
(149, 149, 1, NULL, NULL, NULL, NULL),
(150, 150, 1, '1992-10-03', NULL, NULL, '2024-08-12 11:45:45'),
(151, 151, 1, '1993-02-02', NULL, NULL, NULL),
(152, 152, 1, NULL, NULL, NULL, NULL),
(153, 153, 1, '1999-02-26', NULL, NULL, NULL),
(154, 154, 1, '1992-10-03', NULL, NULL, NULL),
(155, 155, 1, '1988-04-22', NULL, NULL, NULL),
(156, 156, 1, '1987-10-05', NULL, NULL, NULL),
(157, 157, 1, NULL, NULL, NULL, NULL),
(158, 158, 1, NULL, NULL, NULL, NULL),
(159, 159, 1, '1985-06-10', NULL, NULL, '2024-09-20 08:42:07'),
(160, 160, 1, '1987-09-25', NULL, NULL, NULL),
(161, 161, 1, '1998-12-28', NULL, NULL, NULL),
(162, 162, 1, '1992-11-01', NULL, NULL, '2024-08-12 11:38:39'),
(163, 163, 1, '1993-04-12', NULL, NULL, NULL),
(164, 164, 1, '1994-11-23', NULL, NULL, NULL),
(165, 165, 1, '1993-06-14', NULL, NULL, '2024-07-10 10:51:35'),
(166, 166, 1, NULL, NULL, NULL, NULL),
(167, 167, 1, '1987-09-09', NULL, NULL, NULL),
(168, 168, 1, '1994-06-09', NULL, NULL, '2024-07-08 15:18:16'),
(169, 169, 1, NULL, NULL, NULL, NULL),
(170, 170, 1, '1988-01-01', NULL, NULL, '2024-07-10 11:21:23'),
(171, 171, 1, '1993-06-01', NULL, NULL, NULL),
(172, 172, 1, '1993-10-18', NULL, NULL, NULL),
(173, 173, 1, '1987-03-23', NULL, NULL, '2024-05-28 12:33:39'),
(174, 174, 1, '1984-10-10', NULL, NULL, NULL),
(175, 175, 1, '1980-03-24', NULL, NULL, NULL),
(176, 176, 1, '1993-01-05', NULL, NULL, NULL),
(177, 177, 1, '1993-03-03', NULL, NULL, NULL),
(178, 178, 1, '1985-01-05', NULL, NULL, NULL),
(179, 179, 1, NULL, NULL, NULL, NULL),
(180, 180, 1, NULL, NULL, NULL, NULL),
(181, 181, 1, '2001-05-17', NULL, NULL, NULL),
(182, 182, 1, '1993-04-02', NULL, NULL, NULL),
(183, 183, 1, '1999-10-10', NULL, NULL, NULL),
(184, 184, 1, '1998-01-28', NULL, NULL, NULL),
(185, 185, 1, '2001-11-11', NULL, NULL, NULL),
(186, 186, 1, '1993-06-05', NULL, NULL, NULL),
(187, 187, 1, '1998-05-31', NULL, NULL, NULL),
(188, 188, 1, '1999-03-02', NULL, NULL, NULL),
(189, 189, 1, '2004-05-22', NULL, NULL, NULL),
(190, 190, 1, '1993-07-05', NULL, NULL, NULL),
(191, 191, 1, '1993-01-13', NULL, NULL, NULL),
(192, 192, 1, '2015-06-24', NULL, NULL, '2025-10-01 19:15:00'),
(193, 193, 1, '1999-04-04', NULL, NULL, NULL),
(194, 194, 1, '2011-03-10', NULL, NULL, NULL),
(195, 195, 1, '2003-09-17', NULL, NULL, NULL),
(196, 196, 1, '2000-04-22', NULL, NULL, NULL),
(197, 197, 1, '2005-02-01', NULL, NULL, NULL),
(198, 198, 1, '1997-07-13', NULL, NULL, NULL),
(199, 199, 1, '2001-08-25', NULL, NULL, NULL),
(200, 200, 1, '1999-09-19', NULL, NULL, NULL),
(201, 201, 1, '1998-06-10', NULL, NULL, NULL),
(202, 202, 1, '1986-03-26', NULL, NULL, NULL),
(203, 203, 1, '2000-12-09', NULL, NULL, NULL),
(204, 204, 1, NULL, NULL, NULL, NULL),
(205, 205, 1, '1999-07-22', NULL, NULL, NULL),
(206, 206, 1, '2000-06-26', NULL, NULL, NULL),
(207, 207, 1, '2008-05-15', NULL, NULL, NULL),
(208, 208, 1, '2008-05-15', NULL, NULL, NULL),
(209, 209, 1, '2008-08-15', NULL, NULL, NULL),
(210, 210, 1, NULL, NULL, NULL, NULL),
(211, 211, 1, NULL, NULL, NULL, NULL),
(212, 212, 1, '2009-04-01', NULL, NULL, NULL),
(213, 213, 1, '2009-04-01', NULL, NULL, NULL),
(214, 214, 1, '2009-04-01', NULL, NULL, NULL),
(215, 215, 1, NULL, NULL, NULL, NULL),
(216, 216, 1, '2009-04-01', NULL, NULL, NULL),
(217, 217, 1, '2009-04-01', NULL, NULL, NULL),
(218, 218, 1, '2008-04-01', NULL, NULL, NULL),
(219, 219, 1, '1989-07-17', NULL, NULL, NULL),
(220, 220, 1, NULL, NULL, NULL, NULL),
(221, 221, 1, '2009-04-04', NULL, NULL, NULL),
(222, 222, 1, '2009-03-25', NULL, NULL, NULL),
(223, 223, 1, '2009-03-26', NULL, NULL, NULL),
(224, 224, 1, '2009-03-24', NULL, NULL, NULL),
(225, 225, 1, NULL, NULL, NULL, NULL),
(226, 226, 1, NULL, NULL, NULL, NULL),
(227, 227, 1, NULL, NULL, NULL, NULL),
(228, 228, 1, '2009-03-23', NULL, NULL, NULL),
(229, 229, 1, '2009-03-24', NULL, NULL, '2025-07-10 11:12:18'),
(230, 230, 1, '2009-04-06', NULL, NULL, NULL),
(231, 231, 1, '2009-04-01', NULL, NULL, NULL),
(232, 232, 1, NULL, NULL, NULL, NULL),
(233, 233, 1, '2009-04-25', NULL, NULL, NULL),
(234, 234, 1, '2009-04-25', NULL, NULL, '2024-08-12 14:41:33'),
(235, 235, 1, '2011-04-13', NULL, NULL, NULL),
(236, 236, 1, '2010-03-09', NULL, NULL, NULL),
(237, 237, 1, '1991-10-05', NULL, NULL, NULL),
(238, 238, 1, '2010-03-15', NULL, NULL, NULL),
(239, 239, 1, NULL, NULL, NULL, NULL),
(240, 240, 1, '2011-02-24', NULL, NULL, NULL),
(241, 241, 1, '2011-04-16', NULL, NULL, '2024-07-11 15:11:44'),
(242, 242, 1, '2010-03-03', NULL, NULL, NULL),
(243, 243, 1, '2011-06-09', NULL, NULL, NULL),
(244, 244, 1, '2001-06-07', NULL, NULL, NULL),
(245, 245, 1, '2011-03-16', NULL, NULL, NULL),
(246, 246, 1, '2010-10-10', NULL, NULL, NULL),
(247, 247, 1, '2014-11-15', NULL, NULL, NULL),
(248, 248, 1, '2011-06-26', NULL, NULL, NULL),
(249, 249, 1, '2011-03-16', NULL, NULL, NULL),
(250, 250, 1, '2011-03-11', NULL, NULL, NULL),
(251, 251, 1, '2011-03-16', NULL, NULL, NULL),
(252, 252, 1, NULL, NULL, NULL, NULL),
(253, 253, 1, NULL, NULL, NULL, NULL),
(254, 254, 1, '2011-03-15', NULL, NULL, NULL),
(255, 255, 1, '2011-11-16', NULL, NULL, NULL),
(256, 256, 1, '2011-11-22', NULL, NULL, NULL),
(257, 257, 1, '2012-11-23', NULL, NULL, NULL),
(258, 258, 1, NULL, NULL, NULL, NULL),
(259, 259, 1, '2011-12-21', NULL, NULL, NULL),
(260, 260, 1, '2011-12-16', NULL, NULL, NULL),
(261, 261, 1, '2014-11-25', NULL, NULL, NULL),
(262, 262, 1, '2011-11-11', NULL, NULL, NULL),
(263, 263, 1, '2011-12-25', NULL, NULL, NULL),
(264, 264, 1, '2004-12-27', NULL, NULL, NULL),
(265, 265, 1, NULL, NULL, NULL, NULL),
(266, 266, 1, '2011-12-23', NULL, NULL, NULL),
(267, 267, 1, '2011-12-21', NULL, NULL, NULL),
(268, 268, 1, '2012-01-09', NULL, NULL, NULL),
(269, 269, 1, NULL, NULL, NULL, NULL),
(270, 270, 1, NULL, NULL, NULL, NULL),
(271, 271, 1, '2011-12-21', NULL, NULL, '2024-08-12 12:04:15'),
(272, 272, 1, NULL, NULL, NULL, NULL),
(273, 273, 1, '2012-11-28', NULL, NULL, '2024-07-29 11:47:53'),
(274, 274, 1, '2012-09-10', NULL, NULL, NULL),
(275, 275, 1, '2011-09-22', NULL, NULL, NULL),
(276, 276, 1, NULL, NULL, NULL, NULL),
(277, 277, 1, NULL, NULL, NULL, NULL),
(278, 278, 1, NULL, NULL, NULL, NULL),
(279, 279, 1, '2012-06-12', NULL, NULL, NULL),
(280, 280, 1, NULL, NULL, NULL, NULL),
(281, 281, 1, '2012-06-06', NULL, NULL, NULL),
(282, 282, 1, '2013-04-02', NULL, NULL, NULL),
(283, 283, 1, '2013-04-02', NULL, NULL, NULL),
(284, 284, 1, '2013-01-28', NULL, NULL, NULL),
(285, 285, 1, '2013-04-02', NULL, NULL, NULL),
(286, 286, 1, NULL, NULL, NULL, NULL),
(287, 287, 1, '2013-07-28', NULL, NULL, NULL),
(288, 288, 1, '2013-11-11', NULL, NULL, NULL),
(289, 289, 1, '2014-04-30', NULL, NULL, NULL),
(290, 290, 1, '2013-05-02', NULL, NULL, NULL),
(291, 291, 1, '2013-10-20', NULL, NULL, NULL),
(292, 292, 1, '2014-03-18', NULL, NULL, NULL),
(293, 293, 1, NULL, NULL, NULL, NULL),
(294, 294, 1, '2014-04-18', NULL, NULL, NULL),
(295, 295, 1, '2014-03-20', NULL, NULL, NULL),
(296, 296, 1, '2014-07-01', NULL, NULL, NULL),
(297, 297, 1, '2014-10-21', NULL, NULL, NULL),
(298, 298, 1, '2014-10-29', NULL, NULL, '2024-07-29 15:13:32'),
(299, 299, 1, '2014-10-24', NULL, NULL, NULL),
(300, 300, 1, '2013-10-29', NULL, NULL, NULL),
(301, 301, 1, '1996-02-01', NULL, NULL, '2024-08-14 15:31:21'),
(302, 302, 1, '2013-10-31', NULL, NULL, NULL),
(303, 303, 1, NULL, NULL, NULL, NULL),
(304, 304, 1, '2014-10-18', NULL, NULL, NULL),
(305, 305, 1, '2014-11-11', NULL, NULL, NULL),
(306, 306, 1, '2014-11-17', NULL, NULL, NULL),
(307, 307, 1, '2014-08-28', NULL, NULL, NULL),
(308, 308, 1, '2014-06-30', NULL, NULL, NULL),
(309, 309, 1, '2014-11-21', NULL, NULL, NULL),
(310, 310, 1, '2014-10-14', NULL, NULL, NULL),
(311, 311, 1, NULL, NULL, NULL, NULL),
(312, 312, 1, NULL, NULL, NULL, NULL),
(313, 313, 1, NULL, NULL, NULL, NULL),
(314, 314, 1, NULL, NULL, NULL, NULL),
(315, 315, 1, NULL, NULL, NULL, NULL),
(316, 316, 1, '2014-11-03', NULL, NULL, NULL),
(317, 317, 1, NULL, NULL, NULL, NULL),
(318, 318, 1, NULL, NULL, NULL, NULL),
(319, 319, 1, '2015-06-12', NULL, NULL, NULL),
(320, 320, 1, '2015-06-21', NULL, NULL, NULL),
(321, 321, 1, '2015-05-15', NULL, NULL, NULL),
(322, 322, 1, '2015-06-26', NULL, NULL, NULL),
(323, 323, 1, '2015-06-24', NULL, NULL, NULL),
(324, 324, 1, '2015-06-21', NULL, NULL, NULL),
(325, 325, 1, NULL, NULL, NULL, NULL),
(326, 326, 1, '2015-06-25', NULL, NULL, NULL),
(327, 327, 1, '2015-06-25', NULL, NULL, NULL),
(328, 328, 1, '2015-06-10', NULL, NULL, NULL),
(329, 329, 1, '2015-06-10', NULL, NULL, NULL),
(330, 330, 1, NULL, NULL, NULL, NULL),
(331, 331, 1, '2015-03-12', NULL, NULL, NULL),
(332, 332, 1, '2015-05-20', NULL, NULL, NULL),
(333, 333, 1, '2000-10-10', NULL, NULL, NULL),
(334, 334, 1, '2015-06-16', NULL, NULL, NULL),
(335, 335, 1, '2015-07-24', NULL, NULL, NULL),
(336, 336, 1, '2015-06-15', NULL, NULL, NULL),
(337, 337, 1, '2015-06-24', NULL, NULL, NULL),
(338, 338, 1, '2015-06-26', NULL, NULL, NULL),
(339, 339, 1, NULL, NULL, NULL, NULL),
(340, 340, 1, NULL, NULL, NULL, NULL),
(341, 341, 1, NULL, NULL, NULL, NULL),
(342, 342, 1, NULL, NULL, NULL, NULL),
(343, 343, 1, '2016-07-15', NULL, NULL, NULL),
(344, 344, 1, '2016-06-10', NULL, NULL, NULL),
(345, 345, 1, '2016-06-10', NULL, NULL, NULL),
(346, 346, 1, NULL, NULL, NULL, NULL),
(347, 347, 1, NULL, NULL, NULL, NULL),
(348, 348, 1, NULL, NULL, NULL, NULL),
(349, 349, 1, NULL, NULL, NULL, NULL),
(350, 350, 1, NULL, NULL, NULL, NULL),
(351, 351, 1, NULL, NULL, NULL, NULL),
(352, 352, 1, '2015-11-29', NULL, NULL, NULL),
(353, 353, 1, '2016-03-23', NULL, NULL, NULL),
(354, 354, 1, '2016-12-28', NULL, NULL, NULL),
(355, 355, 1, '2016-11-11', NULL, NULL, NULL),
(356, 356, 1, '2016-11-11', NULL, NULL, NULL),
(357, 357, 1, '2016-09-28', NULL, NULL, NULL),
(358, 358, 1, '2016-11-26', NULL, NULL, NULL),
(359, 359, 1, NULL, NULL, NULL, NULL),
(360, 360, 1, '2019-06-01', NULL, NULL, NULL),
(361, 361, 1, '2005-04-24', NULL, NULL, NULL),
(362, 362, 1, '1998-08-03', NULL, NULL, NULL),
(363, 363, 1, '2015-02-10', NULL, NULL, NULL),
(364, 364, 1, '2014-06-01', NULL, NULL, NULL),
(366, 366, 1, '2009-05-03', NULL, NULL, '2024-07-29 11:58:09'),
(367, 367, 1, NULL, NULL, NULL, NULL),
(368, 368, 1, NULL, NULL, NULL, NULL),
(369, 369, 1, NULL, NULL, NULL, NULL),
(370, 370, 1, NULL, NULL, NULL, NULL),
(371, 371, 1, '2016-07-27', NULL, NULL, '2024-07-29 15:06:27'),
(372, 372, 1, '1996-10-04', NULL, NULL, NULL),
(373, 373, 1, '2013-12-28', NULL, NULL, NULL),
(374, 374, 1, NULL, NULL, NULL, NULL),
(375, 375, 1, NULL, NULL, NULL, NULL),
(376, 376, 1, '2008-02-08', NULL, NULL, '2024-08-12 14:07:39'),
(378, 378, 1, '2014-06-01', NULL, NULL, NULL),
(379, 379, 1, '2014-06-01', NULL, NULL, NULL),
(380, 380, 1, '2017-05-17', NULL, NULL, NULL),
(381, 381, 1, NULL, NULL, NULL, NULL),
(382, 382, 1, '2011-06-09', NULL, NULL, '2024-08-14 12:14:27'),
(383, 383, 1, NULL, NULL, NULL, NULL),
(384, 384, 1, NULL, NULL, NULL, NULL),
(385, 385, 1, '2019-03-19', NULL, NULL, NULL),
(386, 386, 1, NULL, NULL, NULL, NULL),
(387, 387, 1, '2009-04-29', NULL, NULL, '2025-10-06 12:30:11'),
(388, 388, 1, '2012-12-11', NULL, NULL, NULL),
(389, 389, 1, '2019-02-03', NULL, NULL, NULL),
(390, 390, 1, NULL, NULL, NULL, NULL),
(391, 391, 1, NULL, NULL, NULL, NULL),
(392, 392, 1, '2014-06-01', NULL, NULL, NULL),
(393, 393, 1, '1993-04-03', NULL, NULL, NULL),
(394, 394, 1, NULL, NULL, NULL, NULL),
(395, 395, 1, '1997-08-25', NULL, NULL, NULL),
(396, 396, 1, '2016-07-27', NULL, NULL, NULL),
(397, 397, 1, '2015-05-30', NULL, NULL, NULL),
(398, 398, 1, '2015-05-30', NULL, NULL, NULL),
(400, 400, 1, '2015-05-30', NULL, NULL, '2024-08-12 11:53:58'),
(401, 474, 1, '2009-03-31', NULL, '2024-05-28 12:06:58', NULL),
(402, 475, 1, '1997-05-21', NULL, '2024-05-28 12:09:39', NULL),
(403, 478, 1, '1994-05-15', NULL, '2024-07-19 15:15:38', NULL),
(404, 483, 1, '2016-11-10', NULL, '2024-07-22 11:53:58', '2025-10-08 09:27:33'),
(405, 484, 1, '2017-09-15', NULL, '2024-07-24 12:56:28', NULL),
(406, 486, 1, '2015-08-28', NULL, '2024-07-29 14:43:17', NULL),
(407, 492, 1, '2017-09-15', NULL, '2024-07-29 15:28:35', NULL),
(408, 499, 1, '2019-04-19', NULL, '2024-07-30 10:26:27', NULL),
(409, 501, 1, '2019-03-24', NULL, '2024-07-30 10:43:20', NULL),
(410, 510, 1, '1999-09-30', NULL, '2024-08-01 12:16:19', NULL),
(411, 511, 1, '1982-07-29', NULL, '2024-08-01 12:26:43', NULL),
(412, 512, 1, '1992-10-07', NULL, '2024-08-01 12:37:42', NULL),
(413, 516, 1, '2018-06-13', NULL, '2024-08-07 10:50:02', NULL),
(414, 523, 1, '2016-01-13', NULL, '2024-08-07 11:22:57', NULL),
(415, 524, 1, '2013-03-02', NULL, '2024-08-07 11:34:15', NULL),
(416, 525, 1, '2015-04-16', NULL, '2024-08-07 13:59:56', NULL),
(417, 527, 1, '1993-09-05', NULL, '2024-08-07 14:29:40', NULL),
(418, 531, 1, '2015-04-28', NULL, '2024-08-07 15:31:59', NULL),
(419, 532, 1, '1984-05-25', NULL, '2024-08-07 15:49:24', NULL),
(420, 533, 1, '2017-09-15', NULL, '2024-08-09 11:49:47', NULL),
(421, 534, 1, '2016-03-15', NULL, '2024-08-14 09:20:38', '2024-08-14 09:27:07'),
(422, 535, 1, '2000-08-22', NULL, '2024-08-14 12:02:42', '2024-08-14 14:07:31'),
(423, 536, 1, '2015-03-23', NULL, '2024-08-14 13:25:55', NULL),
(424, 556, 1, NULL, NULL, '2025-10-07 10:44:05', '2025-10-08 09:06:15'),
(425, 557, 1, NULL, NULL, '2025-10-07 12:54:55', NULL),
(427, 399, 1, '2015-05-30', 13, '2025-10-09 11:39:02', '2025-10-09 11:39:02'),
(431, 365, 1, '2014-06-01', 13, '2025-10-13 08:58:32', '2025-10-13 08:58:32'),
(434, 132, 1, '1983-12-12', NULL, '2025-11-05 11:52:24', '2025-11-05 11:52:24'),
(442, 25, 1, '1984-08-01', NULL, '2025-11-07 07:56:01', '2025-11-07 07:56:01'),
(444, 45, 1, '1999-05-15', 1, '2025-11-07 09:54:24', '2025-11-07 09:54:24'),
(445, 107, 1, '2006-06-01', NULL, '2025-11-07 13:53:31', '2025-11-07 13:53:31'),
(457, 7, 1, '1988-04-13', NULL, '2025-11-09 17:53:09', '2025-11-09 17:53:09'),
(458, 53, 1, '2001-04-28', NULL, '2025-11-09 18:21:21', '2025-11-09 18:21:21'),
(460, 140, 1, '1987-09-17', NULL, '2025-11-09 18:55:00', '2025-11-09 18:55:00'),
(462, 377, 1, '2014-06-01', NULL, '2025-11-09 18:58:51', '2025-11-09 18:58:51');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ueo`
--

DROP TABLE IF EXISTS `tipo_ueo`;
CREATE TABLE IF NOT EXISTS `tipo_ueo` (
  `id_tipo_ueo` tinyint NOT NULL,
  `descricao_tipo_ueo` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo_ueo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- Extraindo dados da tabela `tipo_ueo`
--

INSERT INTO `tipo_ueo` (`id_tipo_ueo`, `descricao_tipo_ueo`) VALUES
(1, 'Unidade'),
(2, 'Estabelecimento'),
(3, 'Orgão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'TestUser ', 'test@test.com', NULL, '$2y$12$QaqNY1Q5iLEWXrdsoM4sbujUgoY3.oWAuW4LBTkOt1V2nyLdd0Il6', NULL, '2025-03-12 19:40:32', '2025-10-09 11:05:29'),
(2, 'Kelly', 'kelly@test.com', NULL, '$2y$12$aNVfwv0dgus9m7qRCjaqJ.ibxhcaQoVxhpll92AsYnrA0ItxqeJt2', NULL, '2025-03-12 19:40:33', '2025-11-03 11:48:44'),
(4, 'Audácio Jorge Fernando', 'audacio@test.com', NULL, '$2y$12$MAquOw497fDfNI4K4lDzRemMtMLexbIKdMxUQSa3XYhB1eFXilMee', NULL, '2025-03-12 19:40:36', '2025-09-25 15:30:02'),
(5, 'Raimundo Jiko', 'raimundojiko@gmail.com', NULL, '$2y$12$g/ez6.64pKRTOqLal7X8J.kJ9caEPRot3kIgzdc7yNIanH.Qm0Q3i', NULL, '2025-03-12 19:40:37', '2025-11-03 13:39:44'),
(6, 'Rufino da Conceição', 'rufino@gmail.com', NULL, '$2y$12$CzJQrHqSo5w7CQzFf4O.oev3DmIQ5kKBNxNzSXqTnYJDxbBzHZm9O', NULL, '2025-10-13 07:56:17', '2025-10-13 07:57:46');

-- --------------------------------------------------------

--
-- Estrutura da tabela `zona`
--

DROP TABLE IF EXISTS `zona`;
CREATE TABLE IF NOT EXISTS `zona` (
  `idzona` int NOT NULL AUTO_INCREMENT,
  `zona` varchar(150) DEFAULT NULL,
  `tipo_zona` enum('C','CE','NT') DEFAULT NULL,
  `idmunicipio` int DEFAULT NULL,
  PRIMARY KEY (`idzona`),
  KEY `fk_municipio` (`idmunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `zona`
--

INSERT INTO `zona` (`idzona`, `zona`, `tipo_zona`, `idmunicipio`) VALUES
(1, 'Benfica', 'C', 173),
(2, 'Kilamba', 'CE', 204),
(3, 'Caxito', 'C', 4),
(4, 'Cuango Calumbo', 'C', 197),
(5, 'Alto Zaza', 'C', 197),
(6, 'Cambamba', 'C', 196),
(7, 'Vista Alegre', 'C', 196),
(8, 'Macolo', 'C', 195),
(9, 'Massau', 'C', 195),
(10, 'Béu', 'C', 191),
(11, 'Cuilo Futa', 'C', 191),
(12, 'Sacandica', 'C', 191),
(13, 'Cuilo Camboso', 'C', 190),
(14, 'Buega-Sul', 'C', 190),
(15, 'Nova Esperança', 'C', 190),
(16, 'Uando Mucaba', 'C', 157),
(17, 'Mucaba', 'C', 157),
(18, 'Cancungo', 'C', 164),
(19, 'Casseche', 'C', 164),
(20, 'Luanga', 'C', 164),
(21, 'Uige', 'C', 164),
(22, 'Caiongo', 'C', 189),
(23, 'Bengo', 'C', 189),
(24, 'Cangola', 'C', 189),
(25, 'Icoca', 'C', 160),
(26, 'Quimbele', 'C', 160),
(27, 'Quivuenga', 'C', 163),
(28, 'Songo', 'C', 163),
(29, 'Macocola', 'C', 156),
(30, 'Milunga', 'C', 156),
(31, 'Mabaia', 'C', 151),
(32, 'Bembe', 'C', 151),
(33, 'Alfândega', 'C', 162),
(34, 'Cuilo Pombo', 'C', 162),
(35, 'Uamba', 'C', 162),
(36, 'Sanza Pombo', 'C', 162),
(37, 'Sequele', 'CE', 212),
(38, 'Landana', 'C', 32),
(39, 'Dinge', 'C', 32),
(40, 'Belize', 'C', 29),
(41, 'Luali', 'C', 29),
(42, 'Necuto', 'C', 179),
(43, 'Inhuca', 'C', 179),
(44, 'Tando Zinze', 'C', 180),
(45, 'Malembo', 'C', 180),
(46, 'Soyo', 'C', 170),
(47, 'Pedra do Feitiço', 'C', 170),
(48, 'M\'Banza Congo', 'C', 167),
(49, 'Madimba', 'C', 167),
(50, 'Caluca', 'C', 167),
(51, 'Quiende', 'C', 167),
(52, 'Nzeto', 'C', 169),
(53, 'Musserra', 'C', 169),
(54, 'Tomboco', 'C', 171),
(55, 'Quinsimba', 'C', 171),
(56, 'Quinzau', 'C', 171),
(57, 'Cuimba', 'C', 166),
(58, 'Buela', 'C', 166),
(59, 'Luvaca', 'C', 166),
(60, 'Lufico', 'C', 184),
(61, 'Mpala', 'C', 184),
(62, 'Quibala-Norte', 'C', 188),
(63, 'Quindeje', 'C', 188),
(64, 'Quitexe', 'C', 161),
(65, 'Aldeia Viçosa', 'C', 161),
(66, 'Negage', 'C', 158),
(67, 'Dimuca', 'C', 158),
(68, 'Quisseque', 'C', 158),
(69, 'Maquela do Zombo', 'C', 165),
(70, 'Quibocolo', 'C', 165),
(71, 'Damba', 'C', 154),
(72, 'Petecusso', 'C', 154),
(73, 'Camatambo', 'C', 154),
(74, 'Lêmboa', 'C', 154),
(75, 'Mabubas', 'C', 4),
(76, 'Quicabo', 'C', 4),
(77, 'Quibaxe', 'C', 152),
(78, 'Paredes', 'C', 152),
(79, 'Coxe', 'C', 152),
(80, 'Muxaluando', 'C', 89),
(81, 'Quixico', 'C', 89),
(82, 'Cage Mazumbo', 'C', 89),
(83, 'Bula Atumba', 'C', 2),
(84, 'Quiage', 'C', 2),
(85, 'Ambriz', 'C', 1),
(86, 'Bela Vista', 'C', 1),
(87, 'Tabi', 'C', 1),
(88, 'Pango Aluquém', 'C', 9),
(89, 'Cazuangongo', 'C', 9),
(90, 'Gombe', 'C', 7),
(91, 'Canacassala', 'C', 7),
(92, 'Zala', 'C', 7),
(93, 'Cacuaco', 'C', 102),
(94, 'Kikolo', 'C', 102),
(95, 'Cazenga', 'C', 103),
(96, 'Kima Kieza', 'C', 103),
(97, 'Barra do Cuanza', 'C', 101),
(98, 'Cabolombo', 'C', 101),
(99, 'Ramiros', 'C', 101),
(100, 'Golfe', 'C', 175),
(101, 'Nova Vida', 'C', 175),
(102, 'Calandula', 'C', 122),
(103, 'Talatona', 'C', 173),
(104, 'Vila Flôr', 'C', 204),
(105, 'Catete', 'C', 206),
(106, 'Cassoneca', 'C', 206),
(107, 'Caculo Cahango', 'C', 206),
(108, 'Caxicane', 'C', 206),
(109, 'Muxima', 'C', 207),
(110, 'Quixinge', 'C', 207),
(111, 'Demba Chio', 'C', 207),
(112, 'Mumbondo', 'C', 207),
(113, 'Funda', 'C', 212),
(114, 'Quifangondo', 'C', 212),
(115, 'Ndalatando', 'C', 79),
(116, 'Caculo Camuiza', 'C', 79),
(117, 'Golungo Alto', 'C', 80),
(118, 'Cambondo', 'C', 80),
(119, 'Quilombo quia Puto', 'C', 80),
(120, 'Dondo', 'C', 78),
(121, 'Dange ya Menha', 'C', 78),
(122, 'São Pedro da Quilemba', 'C', 78),
(123, 'Samba Cajú', 'C', 85),
(124, 'Samba Lucaca', 'C', 85),
(125, 'Camabatela', 'C', 75),
(126, 'Mátua', 'C', 75),
(127, 'Bindo', 'C', 75),
(128, 'Lucala', 'C', 83),
(129, 'Quiangombe', 'C', 83),
(130, 'Banga', 'C', 76),
(131, 'Cariamba', 'C', 76),
(132, 'Quilombo dos Dembos', 'C', 76),
(133, 'Camame', 'C', 82),
(134, 'Cavunga', 'C', 82),
(135, 'Massangano', 'C', 213),
(136, 'Zenza do Itombe', 'C', 213),
(137, 'Terreiro', 'C', 216),
(138, 'Quiquiemba', 'C', 216),
(139, 'Sumbe', 'C', 99),
(140, 'Quicombo', 'C', 99),
(141, 'Calulo', 'C', 219),
(142, 'Cabuta', 'C', 219),
(143, 'Gabela', 'C', 174),
(144, 'Assango', 'C', 174),
(145, 'Cassongue', 'C', 88),
(146, 'Atóme', 'C', 88),
(147, 'Dumbi', 'C', 88),
(148, 'Porto Amboím', 'C', 94),
(149, 'Capolo', 'C', 94),
(150, 'Quibala', 'C', 96),
(151, 'Dala Cachibo', 'C', 96),
(152, 'Seles', 'C', 98),
(153, 'Botera', 'C', 98),
(154, 'Mussende', 'C', 93),
(155, 'Quipaxi', 'C', 93),
(156, 'Ebo', 'C', 91),
(157, 'Cassanje', 'C', 91),
(158, 'Conda', 'C', 90),
(159, 'Cunjo', 'C', 90),
(160, 'Lonhe', 'C', 230),
(161, 'Cariango', 'C', 230),
(162, 'Cota', 'C', 122),
(163, 'Malange', 'C', 129),
(164, 'Lombe', 'C', 129),
(165, 'Cacuso', 'C', 121),
(166, 'Soqueco', 'C', 121),
(167, 'Marimba', 'C', 130),
(168, 'Mangando', 'C', 130),
(169, 'Quela', 'C', 133),
(170, 'Bângalas', 'C', 133),
(171, 'Quirima', 'C', 134),
(172, 'Sautar', 'C', 134),
(173, 'Cangandala', 'C', 124),
(174, 'Caribo', 'C', 124),
(175, 'Culamagia', 'C', 124),
(176, 'Cahombo', 'C', 125),
(177, 'Micanda', 'C', 125),
(178, 'Kunda dya Baze', 'C', 127),
(179, 'Lemba', 'C', 127),
(180, 'Cambundi Catembo', 'C', 123),
(181, 'Dumba Cambango', 'C', 123),
(182, 'Caculama', 'C', 231),
(183, 'Caxinga', 'C', 231),
(184, 'Kiwaba Nzoji', 'C', 126),
(185, 'Mufuma', 'C', 126),
(186, 'Luquembo', 'C', 128),
(187, 'Dombo wa Zanga', 'C', 128),
(188, 'Mbanji ya Ngola', 'C', 234),
(189, 'Cabombo', 'C', 234),
(190, 'Ngola Luiji', 'C', 237),
(191, 'Cambaxe', 'C', 237),
(192, 'Quihuhu', 'C', 238),
(193, 'Quinguengue', 'C', 238),
(194, 'Xandel', 'C', 239),
(195, 'Moma', 'C', 239),
(196, 'Capunda', 'C', 243),
(197, 'Quimbango', 'C', 243),
(198, 'Cunga Palanga', 'C', 243),
(199, 'Cuilo', 'C', 113),
(200, 'Caluango', 'C', 113),
(201, 'Dundo', 'C', 244),
(202, 'Luachimo', 'C', 244),
(203, 'Lubalo', 'C', 114),
(204, 'Muvuluege', 'C', 114),
(205, 'Capenda Camulemba', 'C', 108),
(206, 'Xinge', 'C', 108),
(207, 'Lucapa', 'C', 115),
(208, 'Camissombo', 'C', 115),
(209, 'Nzage', 'C', 107),
(210, 'Cachimo', 'C', 107),
(211, 'Xá Cassau', 'C', 246),
(212, 'Capaia', 'C', 246),
(213, 'Canzar', 'C', 250),
(214, 'Luia', 'C', 250),
(215, 'Cassanje Calucala', 'C', 251),
(216, 'Iongo', 'C', 251),
(217, 'Mussungue', 'C', 252),
(218, 'Caíta', 'C', 252),
(219, 'Saurimo', 'C', 120),
(220, 'Mona Quimbundo', 'C', 120),
(221, 'Xassengue', 'C', 256),
(222, 'Cucumbi', 'C', 256),
(223, 'Luena', 'C', 142),
(224, 'Cassongo', 'C', 142),
(225, 'Cangombe', 'C', 264),
(226, 'Cassamba', 'C', 264),
(227, 'Cangamba', 'C', 264),
(228, 'Muié', 'C', 264),
(229, 'Lumbala Nguimbo', 'C', 265),
(230, 'Mussuma Mitete', 'C', 265),
(231, 'Sessa', 'C', 265),
(232, 'Léua', 'C', 138),
(233, 'Liangongo', 'C', 138),
(234, 'Lutembo', 'C', 266),
(235, 'Luvuei', 'C', 266),
(236, 'Cazombo', 'C', 273),
(237, 'Lumbala Caquengue', 'C', 273),
(238, 'Macondo', 'C', 276),
(239, 'Calunda', 'C', 276),
(240, 'Andulo', 'C', 20),
(241, 'Cassumbe', 'C', 20),
(242, 'Chivaúlo', 'C', 20),
(243, 'Chitembo', 'C', 24),
(244, 'Cachingues', 'C', 24),
(245, 'Malengue', 'C', 24),
(246, 'Cuito', 'C', 27),
(247, 'Cunje', 'C', 27),
(248, 'Camacupa', 'C', 21),
(249, 'Cuanza', 'C', 21),
(250, 'Muinha', 'C', 21),
(251, 'Chinguar', 'C', 23),
(252, 'Cutato', 'C', 23),
(253, 'Cangote', 'C', 23),
(254, 'Catabola', 'C', 22),
(255, 'Caiuera', 'C', 22),
(256, 'Sande', 'C', 22),
(257, 'Cuemba', 'C', 25),
(258, 'Munhango', 'C', 25),
(259, 'Sachinemuna', 'C', 25),
(260, 'Nharêa', 'C', 28),
(261, 'Gamba', 'C', 28),
(262, 'Caieie', 'C', 28),
(263, 'Mumbué', 'C', 278),
(264, 'Mutumbo', 'C', 278),
(265, 'Soma Cuanza', 'C', 278),
(266, 'Chipeta', 'C', 281),
(267, 'Chiuca', 'C', 281),
(268, 'Lúbia', 'C', 283),
(269, 'Dando', 'C', 283),
(270, 'Bailundo', 'C', 50),
(271, 'Lunge', 'C', 50),
(272, 'Luvemba', 'C', 50),
(273, 'Huambo', 'C', 54),
(274, 'Calima', 'C', 54),
(275, 'Londuimbali', 'C', 55),
(276, 'Ussoque', 'C', 55),
(277, 'Chicala', 'C', 58),
(278, 'Mbave', 'C', 58),
(279, 'Cachiungo', 'C', 51),
(280, 'Chinhama', 'C', 51),
(281, 'Mungo', 'C', 57),
(282, 'Cambuengo', 'C', 57),
(283, 'Longonjo', 'C', 56),
(284, 'Lépi', 'C', 56),
(285, 'Ucuma', 'C', 60),
(286, 'Cacoma', 'C', 60),
(287, 'Mundundo', 'C', 60),
(288, 'Ecunha', 'C', 53),
(289, 'Quipeio', 'C', 53),
(290, 'Chinjenje', 'C', 59),
(291, 'Chiaca', 'C', 59),
(292, 'Bimbe', 'C', 286),
(293, 'Hengue', 'C', 286),
(294, 'Sambo', 'C', 287),
(295, 'Samboto', 'C', 287),
(296, 'Galanga', 'C', 288),
(297, 'Cumbira', 'C', 288),
(298, 'Cuima', 'C', 291),
(299, 'Catata', 'C', 291),
(300, 'Bocoio', 'C', 13),
(301, 'Cubal do Lumbo', 'C', 13),
(302, 'Monte Belo', 'C', 13),
(303, 'Balombo', 'C', 10),
(304, 'Maca Mombolo', 'C', 10),
(305, 'Caimbambo', 'C', 14),
(306, 'Caiave', 'C', 14),
(307, 'Viangombe', 'C', 14),
(308, 'Chongorói', 'C', 16),
(309, 'Camuine', 'C', 16),
(310, 'Egito Praia', 'C', 292),
(311, 'Canjala', 'C', 292),
(312, 'Bibala', 'C', 144),
(313, 'Capangombe', 'C', 144),
(314, 'Caitou', 'C', 144),
(315, 'Lola', 'C', 144),
(316, 'Virei', 'C', 148),
(317, 'Cainde', 'C', 148),
(318, 'Camucuio', 'C', 145),
(319, 'Mamué', 'C', 145),
(320, 'Chingo', 'C', 145),
(321, 'Lucira', 'C', 305),
(322, 'Bentiaba', 'C', 305),
(323, 'Caconda', 'C', 61),
(324, 'Gungue', 'C', 61),
(325, 'Uaba', 'C', 61),
(326, 'Cusse', 'C', 61),
(327, 'Chiange', 'C', 309),
(328, 'Chimbemba', 'C', 309),
(329, 'Lubango', 'C', 71),
(330, 'Huíla', 'C', 71),
(331, 'Chibia', 'C', 65),
(332, 'Jau', 'C', 65),
(333, 'Quilengues', 'C', 73),
(334, 'Impulo', 'C', 73),
(335, 'Dinde', 'C', 73),
(336, 'Caluquembe', 'C', 63),
(337, 'Calepi', 'C', 63),
(338, 'Negola', 'C', 63),
(339, 'Jamba Mineira', 'C', 70),
(340, 'Cassinga', 'C', 70),
(341, 'Chipindo', 'C', 67),
(342, 'Bambi', 'C', 67),
(343, 'Chicomba', 'C', 66),
(344, 'Cutenda', 'C', 66),
(345, 'Cacula', 'C', 62),
(346, 'Tchicuaqueia', 'C', 62),
(347, 'Capelongo', 'C', 311),
(348, 'Mulondo', 'C', 311),
(349, 'Capunda Cavilongo', 'C', 313),
(350, 'Quihita', 'C', 313),
(351, 'Xangongo', 'C', 48),
(352, 'Ombala yo Mungu', 'C', 48),
(353, 'Ondjiva', 'C', 44),
(354, 'Môngua', 'C', 44),
(355, 'Cahama', 'C', 43),
(356, 'Otchinjau', 'C', 43),
(357, 'Nehone', 'C', 319),
(358, 'Evale', 'C', 319),
(359, 'Mucope', 'C', 320),
(360, 'Humbe', 'C', 320),
(361, 'Nancova', 'C', 41),
(362, 'Rito', 'C', 41),
(363, 'Savate', 'C', 326),
(364, 'Bondo Caíla', 'C', 326),
(365, 'Caiundo', 'C', 327),
(366, 'Jamba Cueio', 'C', 327),
(367, 'Longa', 'C', 38),
(368, 'Baixo Longa', 'C', 38),
(369, 'Cutato', 'C', 328),
(370, 'Vissati', 'C', 328),
(371, 'Mavengue', 'C', 330),
(372, 'Maué', 'C', 330),
(373, 'Cuito Cuanavale', 'C', 36),
(374, 'Lupire', 'C', 36),
(375, 'Dirico', 'C', 37),
(376, 'Xamavera', 'C', 37),
(377, 'Cunjamba', 'C', 332),
(378, 'Cutuile', 'C', 332),
(379, 'Não tem comuna', 'NT', 3),
(380, 'Não tem comuna', 'NT', 5),
(381, 'Não tem comuna', 'NT', 11),
(382, 'Não tem comuna', 'NT', 12),
(383, 'Não tem comuna', 'NT', 15),
(384, 'Não tem comuna', 'NT', 17),
(385, 'Não tem comuna', 'NT', 18),
(386, 'Não tem comuna', 'NT', 19),
(387, 'Não tem comuna', 'NT', 26),
(388, 'Não tem comuna', 'NT', 30),
(389, 'Não tem comuna', 'NT', 31),
(390, 'Não tem comuna', 'NT', 33),
(391, 'Não tem comuna', 'NT', 34),
(392, 'Não tem comuna', 'NT', 35),
(393, 'Não tem comuna', 'NT', 39),
(394, 'Não tem comuna', 'NT', 40),
(395, 'Não tem comuna', 'NT', 42),
(396, 'Não tem comuna', 'NT', 45),
(397, 'Não tem comuna', 'NT', 46),
(398, 'Não tem comuna', 'NT', 47),
(399, 'Não tem comuna', 'NT', 49),
(400, 'Não tem comuna', 'NT', 52),
(401, 'Não tem comuna', 'NT', 64),
(402, 'Não tem comuna', 'NT', 68),
(403, 'Não tem comuna', 'NT', 69),
(404, 'Não tem comuna', 'NT', 72),
(405, 'Não tem comuna', 'NT', 74),
(406, 'Não tem comuna', 'NT', 77),
(407, 'Não tem comuna', 'NT', 81),
(408, 'Não tem comuna', 'NT', 84),
(409, 'Não tem comuna', 'NT', 87),
(410, 'Não tem comuna', 'NT', 92),
(411, 'Não tem comuna', 'NT', 97),
(412, 'Não tem comuna', 'NT', 100),
(413, 'Não tem comuna', 'NT', 104),
(414, 'Não tem comuna', 'NT', 105),
(415, 'Não tem comuna', 'NT', 106),
(416, 'Não tem comuna', 'NT', 109),
(417, 'Não tem comuna', 'NT', 110),
(418, 'Não tem comuna', 'NT', 112),
(419, 'Não tem comuna', 'NT', 116),
(420, 'Não tem comuna', 'NT', 117),
(421, 'Não tem comuna', 'NT', 118),
(422, 'Não tem comuna', 'NT', 119),
(423, 'Não tem comuna', 'NT', 131),
(424, 'Não tem comuna', 'NT', 132),
(425, 'Não tem comuna', 'NT', 135),
(426, 'Não tem comuna', 'NT', 136),
(427, 'Não tem comuna', 'NT', 137),
(428, 'Não tem comuna', 'NT', 139),
(429, 'Não tem comuna', 'NT', 140),
(430, 'Não tem comuna', 'NT', 141),
(431, 'Não tem comuna', 'NT', 143),
(432, 'Não tem comuna', 'NT', 146),
(433, 'Não tem comuna', 'NT', 147),
(434, 'Não tem comuna', 'NT', 149),
(435, 'Não tem comuna', 'NT', 150),
(436, 'Não tem comuna', 'NT', 153),
(437, 'Não tem comuna', 'NT', 155),
(438, 'Não tem comuna', 'NT', 159),
(439, 'Não tem comuna', 'NT', 168),
(440, 'Não tem comuna', 'NT', 176),
(441, 'Não tem comuna', 'NT', 177),
(442, 'Não tem comuna', 'NT', 178),
(443, 'Não tem comuna', 'NT', 181),
(444, 'Não tem comuna', 'NT', 182),
(445, 'Não tem comuna', 'NT', 183),
(446, 'Não tem comuna', 'NT', 185),
(447, 'Não tem comuna', 'NT', 186),
(448, 'Não tem comuna', 'NT', 192),
(449, 'Não tem comuna', 'NT', 193),
(450, 'Não tem comuna', 'NT', 194),
(451, 'Não tem comuna', 'NT', 198),
(452, 'Não tem comuna', 'NT', 199),
(453, 'Não tem comuna', 'NT', 200),
(454, 'Não tem comuna', 'NT', 201),
(455, 'Não tem comuna', 'NT', 202),
(456, 'Não tem comuna', 'NT', 203),
(457, 'Não tem comuna', 'NT', 205),
(458, 'Não tem comuna', 'NT', 208),
(459, 'Não tem comuna', 'NT', 209),
(460, 'Não tem comuna', 'NT', 210),
(461, 'Não tem comuna', 'NT', 211),
(462, 'Não tem comuna', 'NT', 214),
(463, 'Não tem comuna', 'NT', 215),
(464, 'Não tem comuna', 'NT', 217),
(465, 'Não tem comuna', 'NT', 218),
(466, 'Não tem comuna', 'NT', 220),
(467, 'Não tem comuna', 'NT', 221),
(468, 'Não tem comuna', 'NT', 222),
(469, 'Não tem comuna', 'NT', 223),
(470, 'Não tem comuna', 'NT', 224),
(471, 'Não tem comuna', 'NT', 225),
(472, 'Não tem comuna', 'NT', 226),
(473, 'Não tem comuna', 'NT', 227),
(474, 'Não tem comuna', 'NT', 229),
(475, 'Não tem comuna', 'NT', 232),
(476, 'Não tem comuna', 'NT', 233),
(477, 'Não tem comuna', 'NT', 235),
(478, 'Não tem comuna', 'NT', 236),
(479, 'Não tem comuna', 'NT', 240),
(480, 'Não tem comuna', 'NT', 241),
(481, 'Não tem comuna', 'NT', 242),
(482, 'Não tem comuna', 'NT', 245),
(483, 'Não tem comuna', 'NT', 247),
(484, 'Não tem comuna', 'NT', 248),
(485, 'Não tem comuna', 'NT', 249),
(486, 'Não tem comuna', 'NT', 253),
(487, 'Não tem comuna', 'NT', 254),
(488, 'Não tem comuna', 'NT', 255),
(489, 'Não tem comuna', 'NT', 257),
(490, 'Não tem comuna', 'NT', 258),
(491, 'Não tem comuna', 'NT', 259),
(492, 'Não tem comuna', 'NT', 260),
(493, 'Não tem comuna', 'NT', 261),
(494, 'Não tem comuna', 'NT', 262),
(495, 'Não tem comuna', 'NT', 263),
(496, 'Não tem comuna', 'NT', 267),
(497, 'Não tem comuna', 'NT', 268),
(498, 'Não tem comuna', 'NT', 269),
(499, 'Não tem comuna', 'NT', 270),
(500, 'Não tem comuna', 'NT', 271),
(501, 'Não tem comuna', 'NT', 272),
(502, 'Não tem comuna', 'NT', 274),
(503, 'Não tem comuna', 'NT', 275),
(504, 'Não tem comuna', 'NT', 277),
(505, 'Não tem comuna', 'NT', 279),
(506, 'Não tem comuna', 'NT', 280),
(507, 'Não tem comuna', 'NT', 282),
(508, 'Não tem comuna', 'NT', 284),
(509, 'Não tem comuna', 'NT', 285),
(510, 'Não tem comuna', 'NT', 289),
(511, 'Não tem comuna', 'NT', 290),
(512, 'Não tem comuna', 'NT', 293),
(513, 'Não tem comuna', 'NT', 294),
(514, 'Não tem comuna', 'NT', 295),
(515, 'Não tem comuna', 'NT', 296),
(516, 'Não tem comuna', 'NT', 297),
(517, 'Não tem comuna', 'NT', 298),
(518, 'Não tem comuna', 'NT', 299),
(519, 'Não tem comuna', 'NT', 300),
(520, 'Não tem comuna', 'NT', 301),
(521, 'Não tem comuna', 'NT', 302),
(522, 'Não tem comuna', 'NT', 303),
(523, 'Não tem comuna', 'NT', 304),
(524, 'Não tem comuna', 'NT', 306),
(525, 'Não tem comuna', 'NT', 307),
(526, 'Não tem comuna', 'NT', 308),
(527, 'Não tem comuna', 'NT', 310),
(528, 'Não tem comuna', 'NT', 312),
(529, 'Não tem comuna', 'NT', 315),
(530, 'Não tem comuna', 'NT', 316),
(531, 'Não tem comuna', 'NT', 317),
(532, 'Não tem comuna', 'NT', 318),
(533, 'Não tem comuna', 'NT', 321),
(534, 'Não tem comuna', 'NT', 322),
(535, 'Não tem comuna', 'NT', 323),
(536, 'Não tem comuna', 'NT', 324),
(537, 'Não tem comuna', 'NT', 325),
(538, 'Não tem comuna', 'NT', 329),
(539, 'Não tem comuna', 'NT', 331),
(540, 'Não tem comuna', 'NT', 333),
(541, 'Não tem comuna', 'NT', 334),
(542, 'Não tem comuna', 'NT', 335);

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_cargo_pessoa`
--
DROP TABLE IF EXISTS `qry_cargo_pessoa`;

DROP VIEW IF EXISTS `qry_cargo_pessoa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `qry_cargo_pessoa`  AS SELECT `tbl_cargo_pessoa`.`id_estrutura_organica` AS `id_estrutura_organica`, count(0) AS `contar_cargos` FROM `tbl_cargo_pessoa` GROUP BY `tbl_cargo_pessoa`.`id_estrutura_organica` ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_divisao_zonal`
--
DROP TABLE IF EXISTS `qry_divisao_zonal`;

DROP VIEW IF EXISTS `qry_divisao_zonal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_divisao_zonal`  AS SELECT (case when (`zona`.`idzona` = 'C') then 'Comuna' when (`zona`.`idzona` = 'CE') then 'Centralidade' when (`zona`.`idzona` = 'NT') then 'Não Tem Comuna' else '' end) AS `DivisaoAdministrativa`, `municipio`.`municipio` AS `municipio`, `zona`.`zona` AS `zona`, `municipio`.`idmunicipio` AS `idmunicipio`, `provincia`.`provincia` AS `provincia`, `provincia`.`idprovincia` AS `idprovincia`, `b`.`bairro` AS `bairro`, `b`.`tipo_bairro` AS `tipo_bairro`, `b`.`idbairro` AS `idbairro` FROM (((`bairro` `b` join `zona` on((`b`.`idzona` = `zona`.`idzona`))) join `municipio` on((`zona`.`idmunicipio` = `municipio`.`idmunicipio`))) join `provincia` on((`municipio`.`idprovincia` = `provincia`.`idprovincia`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_eliminar_dependencia`
--
DROP TABLE IF EXISTS `qry_eliminar_dependencia`;

DROP VIEW IF EXISTS `qry_eliminar_dependencia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `qry_eliminar_dependencia`  AS SELECT (case when (`tbl_dependencias`.`id_sub_sub_filho` = '27') then '' else `tbl_estrutura_sub_unidade_filho`.`descricao_sub_unidade` end) AS `Descricao_subunidade_filho`, `do_unidadesmilitares`.`Ueo` AS `Ueo`, `tbl_estrutura_sub_unidade_mae`.`descricao_sub_unidade` AS `descricao_subunidade_mae`, `tbl_dependencias`.`id_sub_sub_filho` AS `id_sub_sub_filho` FROM (((`tbl_dependencias` join `tbl_estrutura_sub_unidade` `tbl_estrutura_sub_unidade_mae` on((`tbl_dependencias`.`id_sub_unidade_mae` = `tbl_estrutura_sub_unidade_mae`.`id_es`))) join `tbl_estrutura_sub_unidade` `tbl_estrutura_sub_unidade_filho` on((`tbl_dependencias`.`id_sub_sub_filho` = `tbl_estrutura_sub_unidade_filho`.`id_es`))) join `do_unidadesmilitares` on((`tbl_dependencias`.`id_unidade_pai` = `do_unidadesmilitares`.`UnidadeID`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_endereco_completo`
--
DROP TABLE IF EXISTS `qry_endereco_completo`;

DROP VIEW IF EXISTS `qry_endereco_completo`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_endereco_completo`  AS SELECT `e`.`id` AS `id`, `e`.`idpessoa` AS `idPessoa`, `q`.`provincia` AS `provincia`, `q`.`municipio` AS `municipio`, `q`.`zona` AS `zona`, `q`.`bairro` AS `bairro`, `q`.`tipo_bairro` AS `tipo_bairro`, `q`.`DivisaoAdministrativa` AS `DivisaoAdministrativa`, `e`.`endereco` AS `endereco`, (case when (`q`.`tipo_bairro` = 'S') then concat(`e`.`endereco`,', ',`q`.`DivisaoAdministrativa`,' ',`q`.`zona`,', Município de ',`q`.`municipio`,', Província de ',`q`.`provincia`) when (`q`.`tipo_bairro` = 'B') then concat(`e`.`endereco`,', Bairro ',`q`.`bairro`,', ',`q`.`DivisaoAdministrativa`,' ',`q`.`zona`,', Município de ',`q`.`municipio`,', Província de ',`q`.`provincia`) when (`q`.`tipo_bairro` is null) then 'Endereço não especificado' else `q`.`provincia` end) AS `endereco_completo` FROM ((`endereco` `e` join (select (case when (`z`.`idzona` = 'C') then 'Comuna' when (`z`.`idzona` = 'CE') then 'Centralidade' when (`z`.`idzona` = 'NT') then 'Não Tem Comuna' else '' end) AS `DivisaoAdministrativa`,`m`.`municipio` AS `municipio`,`z`.`zona` AS `zona`,`m`.`idmunicipio` AS `idmunicipio`,`p`.`provincia` AS `provincia`,`p`.`idprovincia` AS `idprovincia`,`b`.`bairro` AS `bairro`,`b`.`tipo_bairro` AS `tipo_bairro`,`b`.`idbairro` AS `idbairro` from (((`bairro` `b` join `zona` `z` on((`b`.`idzona` = `z`.`idzona`))) join `municipio` `m` on((`z`.`idmunicipio` = `m`.`idmunicipio`))) join `provincia` `p` on((`m`.`idprovincia` = `p`.`idprovincia`)))) `q` on((`e`.`idbairro` = `q`.`idbairro`))) join `pessoa_fisica` `pf` on((`e`.`idpessoa` = `pf`.`id_pessoa_fisica`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_historico_ordem`
--
DROP TABLE IF EXISTS `qry_historico_ordem`;

DROP VIEW IF EXISTS `qry_historico_ordem`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `qry_historico_ordem`  AS SELECT `tbl_historico_progressao`.`idOrdem` AS `idOrdem`, `tbl_ordens`.`id` AS `id`, (`dcm_postosmilitares`.`Posto_Id` - 2) AS `cod_patente_posterior`, `tbl_tipoordem`.`CodTipoOrdem` AS `CodTipoOrdem`, `tbl_historico_progressao`.`CodPatente` AS `CodPatenteActual`, `tbl_tipoordem`.`TipoAbrev` AS `TipoAbrev`, `tbl_tipoordem`.`Grupo_tipo_ordem` AS `Grupo_tipo_ordem`, concat(`tbl_ordens`.`N_ORDEM`,'/',`tbl_entidade`.`Entidade_Abrev`,'/',year(`tbl_ordens`.`DATA_ORDEM`),', de ',dayofmonth(`tbl_ordens`.`DATA_ORDEM`),' de ',monthname(`tbl_ordens`.`DATA_ORDEM`)) AS `referencia_ordem`, `dcm_postosmilitares`.`Posto` AS `PostoActual`, `tbl_historico_progressao`.`idPessoa` AS `idPessoa`, `tbl_tipoordem`.`Descricao_tipo_ordem` AS `Descricao_tipo_ordem`, `tbl_ordens`.`DATA_ORDEM` AS `DATA_ORDEM` FROM ((((`tbl_ordens` join `tbl_historico_progressao` on((`tbl_ordens`.`id` = `tbl_historico_progressao`.`idOrdem`))) join `tbl_entidade` on((`tbl_ordens`.`idEntidade` = `tbl_entidade`.`id_entidade`))) join `tbl_tipoordem` on((`tbl_ordens`.`idTipoOrdem` = `tbl_tipoordem`.`CodTipoOrdem`))) join `dcm_postosmilitares` on((`tbl_historico_progressao`.`CodPatente` = `dcm_postosmilitares`.`Posto_Id`))) WHERE (`tbl_tipoordem`.`Grupo_tipo_ordem` = 1) ORDER BY `tbl_historico_progressao`.`idPessoa` ASC, `tbl_historico_progressao`.`CodPatente` ASC ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_historico_ordem_1`
--
DROP TABLE IF EXISTS `qry_historico_ordem_1`;

DROP VIEW IF EXISTS `qry_historico_ordem_1`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `qry_historico_ordem_1`  AS SELECT `tbl_tipoordem`.`CodTipoOrdem` AS `CodTipoOrdem`, `tbl_tipoordem`.`TipoAbrev` AS `TipoAbrev`, `tbl_tipoordem`.`Grupo_tipo_ordem` AS `Grupo_tipo_ordem`, concat(`tbl_ordens`.`N_ORDEM`,'/',`tbl_entidade`.`Entidade_Abrev`,'/',year(`tbl_ordens`.`DATA_ORDEM`),', de ',dayofmonth(`tbl_ordens`.`DATA_ORDEM`),' de ',monthname(`tbl_ordens`.`DATA_ORDEM`)) AS `referencia_ordem`, `tbl_tipoordem`.`Descricao_tipo_ordem` AS `Descricao_tipo_ordem`, `tbl_ordens`.`DATA_ORDEM` AS `DATA_ORDEM`, `tbl_ordens`.`id` AS `id` FROM ((`tbl_ordens` join `tbl_entidade` on((`tbl_ordens`.`idEntidade` = `tbl_entidade`.`id_entidade`))) join `tbl_tipoordem` on((`tbl_ordens`.`idTipoOrdem` = `tbl_tipoordem`.`CodTipoOrdem`))) WHERE (`tbl_tipoordem`.`Grupo_tipo_ordem` = 1) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_listapromocao`
--
DROP TABLE IF EXISTS `qry_listapromocao`;

DROP VIEW IF EXISTS `qry_listapromocao`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `qry_listapromocao`  AS SELECT (case when (`qry_historico_ordem`.`CodPatenteActual` in (117,113,111,128,126)) then 'Escolha' when (`qry_historico_ordem`.`CodPatenteActual` in (120,115,127)) then 'Antiguidade' when (`qry_historico_ordem`.`CodPatenteActual` in (123,121,130,129)) then 'Diuturnidade' else 'Indefinido' end) AS `Modalidade`, `qry_historico_ordem`.`cod_patente_posterior` AS `cod_patente_posterior`, `pessoa_juridica`.`id_especialidade` AS `id_especialidade`, `dcm_classes`.`Classe` AS `Classe`, `pessoa_juridica`.`nip` AS `nip`, `pessoa_fisica`.`nome` AS `nome`, `qry_historico_ordem`.`CodPatenteActual` AS `CodPatenteActual`, `qry_historico_ordem`.`PostoActual` AS `PostoActual`, `dcm_postosmilitares`.`Posto` AS `Posto_a_promover`, `qry_historico_ordem`.`idPessoa` AS `idPessoa` FROM ((((`dcm_classes` join (`pessoa_fisica` join `pessoa_juridica` on((`pessoa_fisica`.`id_pessoa_fisica` = `pessoa_juridica`.`id_pessoa_juridica`)))) join `especialidade` on(((`pessoa_juridica`.`id_especialidade` = `especialidade`.`id_especialidade`) and (`dcm_classes`.`Classe_Id` = `especialidade`.`id_quadro_especial`)))) join `qry_historico_ordem` on(((`pessoa_juridica`.`id_patente` = `qry_historico_ordem`.`CodPatenteActual`) and (`pessoa_juridica`.`id_pessoa_juridica` = `qry_historico_ordem`.`idPessoa`)))) join `dcm_postosmilitares` on((`qry_historico_ordem`.`cod_patente_posterior` = `dcm_postosmilitares`.`Posto_Id`))) WHERE (`qry_historico_ordem`.`CodPatenteActual` > 109) ORDER BY `qry_historico_ordem`.`CodPatenteActual` ASC ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_reformados_nova`
--
DROP TABLE IF EXISTS `qry_reformados_nova`;

DROP VIEW IF EXISTS `qry_reformados_nova`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `qry_reformados_nova`  AS SELECT `pessoa_fisica`.`id_pessoa_fisica` AS `id_pessoa_fisica`, `pessoa_fisica`.`nome` AS `nome`, timestampdiff(YEAR,`pessoa_fisica`.`Data_Nascimento`,curdate()) AS `idade`, timestampdiff(YEAR,`tipo_incorporacao_data`.`data_incorporacao`,curdate()) AS `tempo_servico`, `pessoa_juridica`.`nip` AS `nip`, `pessoa_juridica`.`id_patente` AS `id_patente`, `pessoa_juridica`.`FPS` AS `FPS`, `dcm_postosmilitares`.`PostoAbrev` AS `PostoAbrev`, `dcm_postosmilitares`.`Posto_Id` AS `Posto_Id`, `ueo_dependencia_especialidade`.`Ueo` AS `ueo_especialidade`, `dcm_classes`.`Classe` AS `Classe`, `unidade_colocado`.`UnidadeID` AS `id_uni_colocado`, `unidade_colocado`.`Ueo` AS `unidade_colocado`, `cargo`.`nome_cargo` AS `cargo`, concat(`cargo`.`nome_cargo`,' ',if((`estrutura_mae`.`visualizacao` = 0),'',`estrutura_mae`.`descricao_sub_unidade`),' ',`tbl_estrutura_sub_unidade`.`descricao_sub_unidade`) AS `cargocolocacao`, `foto`.`foto_militar` AS `foto_militar`, `dcm_classes`.`Classe_abv` AS `quadro_especial`, `pessoa_fisica`.`Data_Nascimento` AS `Data_Nascimento`, date_format(`tipo_incorporacao_data`.`data_incorporacao`,'%d/%m/%Y') AS `Data_Incorporacao`, `tipo_incorporacao`.`nome` AS `Tpo_Incorporacao`, (case when ((`dcm_postosmilitares`.`Posto_Id` < 111) and (`pessoa_juridica`.`FPS` = 'P')) then (year(`pessoa_fisica`.`Data_Nascimento`) + 65) when ((`dcm_postosmilitares`.`Posto_Id` > 110) and (`pessoa_juridica`.`FPS` = 'P')) then (year(`pessoa_fisica`.`Data_Nascimento`) + 60) else 0 end) AS `LIMITE_IDADE`, (case when (`dcm_postosmilitares`.`Posto_Id` < 111) then (year(`tipo_incorporacao_data`.`data_incorporacao`) + 40) when (`dcm_postosmilitares`.`Posto_Id` > 110) then (case when (`pessoa_juridica`.`FPS` = 'M') then (year(`tipo_incorporacao_data`.`data_incorporacao`) + 13) when (`pessoa_juridica`.`FPS` = 'O') then (year(`tipo_incorporacao_data`.`data_incorporacao`) + 3) else (year(`tipo_incorporacao_data`.`data_incorporacao`) + 35) end) end) AS `TSM` FROM ((((((((((((((((((((`pessoa_fisica` join `pessoa_juridica` on((`pessoa_fisica`.`id_pessoa_fisica` = `pessoa_juridica`.`id_pessoa_juridica`))) left join `tipo_incorporacao_data` on(((`pessoa_juridica`.`id_pessoa_juridica` = `tipo_incorporacao_data`.`pessoa_juridica`) and (`tipo_incorporacao_data`.`id_tipo_incorporacao` = 1)))) left join `tipo_incorporacao` on((`tipo_incorporacao_data`.`id_tipo_incorporacao` = `tipo_incorporacao`.`id_tipo`))) left join `municipio` on((`pessoa_fisica`.`id_naturalidade` = `municipio`.`idmunicipio`))) left join `estado_civil` on((`pessoa_fisica`.`id_estado_civil` = `estado_civil`.`id_estado_civil`))) left join `sexo` on((`pessoa_fisica`.`id_sexo` = `sexo`.`id_sexo`))) left join `dcm_postosmilitares` on((`pessoa_juridica`.`id_patente` = `dcm_postosmilitares`.`Posto_Id`))) left join `especialidade` on((`pessoa_juridica`.`id_especialidade` = `especialidade`.`id_especialidade`))) left join `do_unidadesmilitares` `ueo_dependencia_especialidade` on((`especialidade`.`id_dir_especialidade` = `ueo_dependencia_especialidade`.`UnidadeID`))) join `dcm_classes` on((`especialidade`.`id_quadro_especial` = `dcm_classes`.`Classe_Id`))) left join `tbl_cargo_pessoa` on((`pessoa_juridica`.`id_pessoa_juridica` = `tbl_cargo_pessoa`.`id_pessoa`))) left join `estrutura_organica` on((`tbl_cargo_pessoa`.`id_estrutura_organica` = `estrutura_organica`.`id_estrutura_organica`))) left join `tbl_dependencias` on((`estrutura_organica`.`id_dependencia` = `tbl_dependencias`.`id_dependencia`))) left join `tbl_estrutura_sub_unidade` on((`tbl_dependencias`.`id_sub_sub_filho` = `tbl_estrutura_sub_unidade`.`id_es`))) left join `tbl_estrutura_sub_unidade` `estrutura_mae` on((`tbl_dependencias`.`id_sub_unidade_mae` = `estrutura_mae`.`id_es`))) left join `do_unidadesmilitares` `unidade_colocado` on((`tbl_dependencias`.`id_unidade_pai` = `unidade_colocado`.`UnidadeID`))) left join `cargo` on((`estrutura_organica`.`id_cargo` = `cargo`.`id_cargo`))) left join `foto` on((`pessoa_juridica`.`id_pessoa_juridica` = `foto`.`id_pessoa_juridica`))) left join `dcm_ramo` on((`pessoa_juridica`.`Ramo_Origem` = `dcm_ramo`.`Ramo_ID`))) left join `dcm_situacao_quadro` on((`pessoa_juridica`.`FPS` = `dcm_situacao_quadro`.`Sitq_Id`))) ;

-- --------------------------------------------------------

--
-- Estrutura para vista `qry_sem_dependencia`
--
DROP TABLE IF EXISTS `qry_sem_dependencia`;

DROP VIEW IF EXISTS `qry_sem_dependencia`;
CREATE ALGORITHM=UNDEFINED DEFINER=`Admin`@`localhost` SQL SECURITY DEFINER VIEW `qry_sem_dependencia`  AS SELECT (case when (`tbl_dependencias`.`id_sub_sub_filho` = '27') then '' else `subunidade_filho`.`descricao_sub_unidade` end) AS `descricao_subunidade_filho`, `tbl_dependencias`.`id_sub_sub_filho` AS `id_sub_sub_filho`, `estrutura_organica`.`id_estrutura_organica` AS `id_estrutura_organica`, `cargo`.`nome_cargo` AS `nome_cargo`, `descricao_subunidade_mae`.`descricao_sub_unidade` AS `descricao_sub_unidade` FROM ((((`cargo` join `estrutura_organica` on((`cargo`.`id_cargo` = `estrutura_organica`.`id_cargo`))) join `tbl_dependencias` on((`estrutura_organica`.`id_dependencia` = `tbl_dependencias`.`id_dependencia`))) join `tbl_estrutura_sub_unidade` `subunidade_filho` on((`tbl_dependencias`.`id_sub_sub_filho` = `subunidade_filho`.`id_es`))) join `tbl_estrutura_sub_unidade` `descricao_subunidade_mae` on((`tbl_dependencias`.`id_sub_unidade_mae` = `descricao_subunidade_mae`.`id_es`))) ;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `bairro`
--
ALTER TABLE `bairro`
  ADD CONSTRAINT `fk_zona` FOREIGN KEY (`idzona`) REFERENCES `zona` (`idzona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `cargo`
--
ALTER TABLE `cargo`
  ADD CONSTRAINT `cargo_ibfk_1` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id_funcao`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`);

--
-- Limitadores para a tabela `coordenadas_geo`
--
ALTER TABLE `coordenadas_geo`
  ADD CONSTRAINT `coordenadas_geo_ibfk_1` FOREIGN KEY (`id_ueo`) REFERENCES `do_unidadesmilitares` (`UnidadeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_curso` (`id_nivel_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `curso_ibfk_2` FOREIGN KEY (`id_tipo_curso`) REFERENCES `tipo_curso` (`id_tipo_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `curso_frequentado`
--
ALTER TABLE `curso_frequentado`
  ADD CONSTRAINT `curso_frequentado_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `curso_frequentado_ibfk_3` FOREIGN KEY (`id_instituicao`) REFERENCES `instituicao` (`id_instituicao`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `dcm_classes`
--
ALTER TABLE `dcm_classes`
  ADD CONSTRAINT `dcm_classes_ibfk_1` FOREIGN KEY (`Ramo_id`) REFERENCES `dcm_ramo` (`Ramo_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `dcm_postosmilitares`
--
ALTER TABLE `dcm_postosmilitares`
  ADD CONSTRAINT `dcm_postosmilitares_ibfk_1` FOREIGN KEY (`Cod_categoria`) REFERENCES `tbcategoriapatente` (`CodCategoriaPatente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `dc_municipio`
--
ALTER TABLE `dc_municipio`
  ADD CONSTRAINT `dc_municipio_ibfk_1` FOREIGN KEY (`idProvincia`) REFERENCES `dc_provincia` (`idProvincia`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_2` FOREIGN KEY (`id_tipo_doc`) REFERENCES `tipo_documento` (`id_tipo_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `documento_ibfk_3` FOREIGN KEY (`id_pessoa_fisica`) REFERENCES `pessoa_fisica` (`id_pessoa_fisica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `do_unidadesmilitares`
--
ALTER TABLE `do_unidadesmilitares`
  ADD CONSTRAINT `do_unidadesmilitares_ibfk_1` FOREIGN KEY (`RM`) REFERENCES `tbl_regiaomilitar1` (`CodRM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `do_unidadesmilitares_ibfk_2` FOREIGN KEY (`id_tipo_ueo`) REFERENCES `tipo_ueo` (`id_tipo_ueo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `do_unidadesmilitares_ibfk_4` FOREIGN KEY (`id_subdivisao_ueo`) REFERENCES `tbl_subdivisao_ueo` (`id_divisao`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`idmunicipio`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `fk_endereco_1` FOREIGN KEY (`idbairro`) REFERENCES `bairro` (`idbairro`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_endereco_2` FOREIGN KEY (`idpessoa`) REFERENCES `pessoa_fisica` (`id_pessoa_fisica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `especialidade`
--
ALTER TABLE `especialidade`
  ADD CONSTRAINT `especialidade_ibfk_1` FOREIGN KEY (`id_quadro_especial`) REFERENCES `dcm_classes` (`Classe_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `especialidade_ibfk_2` FOREIGN KEY (`id_dir_especialidade`) REFERENCES `do_unidadesmilitares` (`UnidadeID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `estrutura_organica`
--
ALTER TABLE `estrutura_organica`
  ADD CONSTRAINT `estrutura_dependencia` FOREIGN KEY (`id_dependencia`) REFERENCES `tbl_dependencias` (`id_dependencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estrutura_organica_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estrutura_organica_ibfk_2` FOREIGN KEY (`id_posto_organico`) REFERENCES `dcm_postosmilitares` (`Posto_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estrutura_organica_ibfk_3` FOREIGN KEY (`id_funcao`) REFERENCES `funcao` (`id_funcao`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_ibfk_1` FOREIGN KEY (`id_pessoa_juridica`) REFERENCES `pessoa_juridica` (`id_pessoa_juridica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `instituicao`
--
ALTER TABLE `instituicao`
  ADD CONSTRAINT `instituicao_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tipo_instuicao` FOREIGN KEY (`tipo`) REFERENCES `tipo_curso` (`id_tipo_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `fk_provincia_1` FOREIGN KEY (`idprovincia`) REFERENCES `provincia` (`idprovincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `pais_ibfk_1` FOREIGN KEY (`id_continente`) REFERENCES `continente` (`id_continente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `pessoa_fisica`
--
ALTER TABLE `pessoa_fisica`
  ADD CONSTRAINT `habilitacao_id` FOREIGN KEY (`habilitacao_id`) REFERENCES `habilitacaoliteraria` (`habilitacao_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `naturalidade` FOREIGN KEY (`id_naturalidade`) REFERENCES `municipio` (`idmunicipio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pessoa_juridica`
--
ALTER TABLE `pessoa_juridica`
  ADD CONSTRAINT `cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `especialida` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `id_situacao` FOREIGN KEY (`id_situacao`) REFERENCES `situacao_condicoes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pessoa_juridica_ibfk_1` FOREIGN KEY (`id_pessoa_juridica`) REFERENCES `pessoa_fisica` (`id_pessoa_fisica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ramo` FOREIGN KEY (`Ramo_Origem`) REFERENCES `do_ramos` (`RamoID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tipo_de_membro` FOREIGN KEY (`tipo_membro`) REFERENCES `tbl_tipo_membro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `fk_capital` FOREIGN KEY (`capital`) REFERENCES `municipio` (`idmunicipio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `quadro_especial_eo`
--
ALTER TABLE `quadro_especial_eo`
  ADD CONSTRAINT `quadro_especial_eo_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `quadro_especial_eo_ibfk_2` FOREIGN KEY (`id_quadro_especial`) REFERENCES `dcm_classes` (`Classe_Id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `situacao_condicoes`
--
ALTER TABLE `situacao_condicoes`
  ADD CONSTRAINT `situacao_Servico` FOREIGN KEY (`id_situacao`) REFERENCES `situacao_servico` (`id_situacao`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tbgrupopatente`
--
ALTER TABLE `tbgrupopatente`
  ADD CONSTRAINT `tbgrupopatente_ibfk_1` FOREIGN KEY (`CodCategoriaPatente`) REFERENCES `tbcategoriapatente` (`CodCategoriaPatente`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbl_cargo_pessoa`
--
ALTER TABLE `tbl_cargo_pessoa`
  ADD CONSTRAINT `tbl_cargo_pessoa_ibfk_3` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa_juridica` (`id_pessoa_juridica`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbl_contactos`
--
ALTER TABLE `tbl_contactos`
  ADD CONSTRAINT `tbl_contactos_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa_fisica` (`id_pessoa_fisica`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `tbl_dependencias`
--
ALTER TABLE `tbl_dependencias`
  ADD CONSTRAINT `tbl_dependencias_ibfk_2` FOREIGN KEY (`id_unidade_pai`) REFERENCES `do_unidadesmilitares` (`UnidadeID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_dependencias_ibfk_3` FOREIGN KEY (`id_sub_sub_filho`) REFERENCES `tbl_estrutura_sub_unidade` (`id_es`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tbl_dependencias_ibfk_4` FOREIGN KEY (`id_sub_unidade_mae`) REFERENCES `tbl_estrutura_sub_unidade` (`id_es`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbl_estrutura_sub_unidade`
--
ALTER TABLE `tbl_estrutura_sub_unidade`
  ADD CONSTRAINT `tbl_estrutura_sub_unidade_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tbl_tipo_subunidade` (`id_tipo_subunidade`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbl_regiaomilitar`
--
ALTER TABLE `tbl_regiaomilitar`
  ADD CONSTRAINT `tbl_regiaomilitar_ibfk_1` FOREIGN KEY (`RamoID`) REFERENCES `do_ramos` (`RamoID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tbl_tipo_subunidade`
--
ALTER TABLE `tbl_tipo_subunidade`
  ADD CONSTRAINT `tbl_tipo_subunidade_ibfk_1` FOREIGN KEY (`id_grupo_tipo_subunidade`) REFERENCES `tbl_grupo_tipo_subunidade` (`id_grupo_tipo_subunidade`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `tipo_incorporacao_data`
--
ALTER TABLE `tipo_incorporacao_data`
  ADD CONSTRAINT `id_pessoa_juridica` FOREIGN KEY (`pessoa_juridica`) REFERENCES `pessoa_juridica` (`id_pessoa_juridica`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `local_incorporacao` FOREIGN KEY (`local`) REFERENCES `provincia` (`idprovincia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tipo_incorporacao` FOREIGN KEY (`id_tipo_incorporacao`) REFERENCES `tipo_incorporacao` (`id_tipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `zona`
--
ALTER TABLE `zona`
  ADD CONSTRAINT `fk_municipio` FOREIGN KEY (`idmunicipio`) REFERENCES `municipio` (`idmunicipio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
