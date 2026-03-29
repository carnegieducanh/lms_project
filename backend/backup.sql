-- Database Backup: lms_project (from Railway)
-- Generated: 2026-03-21 14:56:17

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `chapter_id` bigint unsigned NOT NULL,
  `lesson_id` bigint unsigned NOT NULL,
  `is_completed` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `is_last_watched` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activities_user_id_foreign` (`user_id`),
  KEY `activities_course_id_foreign` (`course_id`),
  KEY `activities_chapter_id_foreign` (`chapter_id`),
  KEY `activities_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `activities_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activities_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activities_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('1', '新入社員研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('2', '全社員必須研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('3', 'IT・セキュリティ研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('4', '安全衛生研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('5', '管理職研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('6', 'スキル向上研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('7', 'DX推進研修', '1', NULL, NULL);
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('8', '製造業向け研修', '1', NULL, NULL);

DROP TABLE IF EXISTS `chapters`;
CREATE TABLE `chapters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `sort_order` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chapters_course_id_foreign` (`course_id`),
  CONSTRAINT `chapters_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('13', 'Module 1: 社会人としての心構え', '7', '1000', '1', '2026-02-22 07:21:13', '2026-02-22 07:21:13');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('14', 'Module 2: 敬語の使い方', '7', '1000', '1', '2026-02-22 07:21:20', '2026-02-22 07:21:20');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('15', 'Module 3: 名刺交換と来客対応', '7', '1000', '1', '2026-02-22 07:21:25', '2026-02-22 07:21:25');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('16', 'Module 4: ビジネス文書作成', '7', '1000', '1', '2026-02-22 07:21:30', '2026-02-22 07:21:30');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('17', 'Module 1: コンプライアンスの基礎', '8', '1000', '1', '2026-02-22 07:26:42', '2026-02-22 07:26:42');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('18', 'Module 2: ハラスメント防止', '8', '1000', '1', '2026-02-22 07:26:46', '2026-02-22 07:26:46');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('19', 'Module 3: 情報管理', '8', '1000', '1', '2026-02-22 07:26:51', '2026-02-22 07:26:51');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('20', 'Module 4: 内部通報制度', '8', '1000', '1', '2026-02-22 07:26:55', '2026-02-22 07:26:55');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('21', 'Module 1: 情報セキュリティの基礎', '9', '1000', '1', '2026-02-22 07:33:39', '2026-02-22 07:33:39');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('22', 'Module 2: パスワードと認証管理', '9', '1000', '1', '2026-02-22 07:33:46', '2026-02-22 07:33:46');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('23', 'Module 3: メール・インターネット利用', '9', '1000', '1', '2026-02-22 07:33:49', '2026-02-22 07:33:49');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('24', 'Module 4: 在宅勤務とモバイルセキュリティ', '9', '1000', '1', '2026-02-22 07:33:53', '2026-02-22 07:33:53');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('25', 'Module 1: 安全衛生の基礎', '10', '1000', '1', '2026-02-22 07:39:19', '2026-02-22 07:39:19');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('26', 'Module 2: オフィス・工場の安全管理', '10', '1000', '1', '2026-02-22 07:39:23', '2026-02-22 07:39:23');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('27', 'Module 3: 健康管理', '10', '1000', '1', '2026-02-22 07:39:26', '2026-02-22 07:39:26');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('28', 'Module 4: 災害対策', '10', '1000', '1', '2026-02-22 07:39:29', '2026-02-22 07:39:29');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('29', 'Module 1: リーダーの役割', '11', '1000', '1', '2026-02-22 07:45:38', '2026-02-22 07:45:38');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('30', 'Module 2: チームマネジメント', '11', '1000', '1', '2026-02-22 07:45:42', '2026-02-22 07:45:42');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('31', 'Module 3: 評価とフィードバック', '11', '1000', '1', '2026-02-22 07:45:46', '2026-02-22 07:45:46');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('32', 'Module 4: 部下育成', '11', '1000', '1', '2026-02-22 07:45:50', '2026-02-22 07:45:50');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('33', 'Module 1: 傾聴力', '12', '1000', '1', '2026-02-22 07:49:49', '2026-02-22 07:49:49');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('34', 'Module 2: プレゼンテーション', '12', '1000', '1', '2026-02-22 07:49:53', '2026-02-22 07:49:53');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('35', 'Module 3: 会議運営', '12', '1000', '1', '2026-02-22 07:49:57', '2026-02-22 07:49:57');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('36', 'Module 4: 異文化理解', '12', '1000', '1', '2026-02-22 07:50:01', '2026-02-22 07:50:01');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('37', 'Module 1: DX基礎', '13', '1000', '1', '2026-02-22 07:54:31', '2026-02-22 07:54:31');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('38', 'Module 2: クラウドとIT基礎', '13', '1000', '1', '2026-02-22 07:54:36', '2026-02-22 07:54:36');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('39', 'Module 3: データ活用', '13', '1000', '1', '2026-02-22 07:54:39', '2026-02-22 07:54:39');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('40', 'Module 4: 自動化技術', '13', '1000', '1', '2026-02-22 07:54:43', '2026-02-22 07:54:43');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('41', 'Module 1: 品質管理の基礎', '14', '1000', '1', '2026-02-22 08:01:08', '2026-02-22 08:01:08');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('42', 'Module 2: QC七つ道具', '14', '1000', '1', '2026-02-22 08:01:11', '2026-02-22 08:01:11');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('43', 'Module 3: 5S活動', '14', '1000', '1', '2026-02-22 08:01:14', '2026-02-22 08:01:14');
INSERT INTO `chapters` (`id`, `title`, `course_id`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('44', 'Module 4: 改善活動', '14', '1000', '1', '2026-02-22 08:01:20', '2026-02-22 08:01:20');

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned DEFAULT NULL,
  `level_id` bigint unsigned DEFAULT NULL,
  `language_id` bigint unsigned DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `cross_price` double DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `is_featured` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_user_id_foreign` (`user_id`),
  KEY `courses_category_id_foreign` (`category_id`),
  KEY `courses_level_id_foreign` (`level_id`),
  KEY `courses_language_id_foreign` (`language_id`),
  CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `courses_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `courses_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `levels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('7', 'ビジネスマナー基礎研修', '1', '1', '1', '2', '社会人として必要な基本的なビジネスマナーを学び、職場で信頼される人材を目指します。', NULL, NULL, '1', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771745143/lms/courses/course-7-1771745142.jpg', '2026-02-22 07:11:23', '2026-02-22 08:14:28');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('8', 'コンプライアンス研修', '1', '2', '2', '2', '法令遵守と企業倫理を理解し、リスクを未然に防ぐ意識を高めます。', NULL, NULL, '1', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771745427/lms/courses/course-8-1771745426.jpg', '2026-02-22 07:26:10', '2026-02-22 08:10:18');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('9', '情報セキュリティ研修', '1', '3', '3', '2', '情報漏洩やサイバー攻撃のリスクを理解し、安全に業務を行うための知識と対策を学びます。', NULL, NULL, '1', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771745866/lms/courses/course-9-1771745865.png', '2026-02-22 07:33:05', '2026-02-22 08:11:36');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('10', '労働安全衛生研修', '1', '4', '1', '2', '職場の安全と健康を守るための基本知識を学び、事故や健康被害を未然に防止します。', NULL, NULL, '1', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771746245/lms/courses/course-10-1771746242.png', '2026-02-22 07:38:53', '2026-02-22 08:16:43');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('11', 'リーダーシップ研修', '1', '5', '1', '2', 'チームを効果的に導き、成果を最大化するためのリーダーシップスキルを習得します。', NULL, NULL, '1', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771746545/lms/courses/course-11-1771746543.png', '2026-02-22 07:45:12', '2026-02-22 08:08:43');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('12', 'ビジネスコミュニケーション研修', '1', '6', '1', '2', '円滑なコミュニケーション能力を高め、職場での協働を促進します。', NULL, NULL, '1', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771746771/lms/courses/course-12-1771746769.jpg', '2026-02-22 07:49:26', '2026-02-22 08:12:44');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('13', 'DX・デジタルスキル研修', '1', '7', '2', '2', 'デジタル技術を活用し、業務効率化とイノベーションを推進します。', NULL, NULL, '0', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771747214/lms/courses/course-13-1771747212.png', '2026-02-22 07:54:05', '2026-02-22 08:00:14');
INSERT INTO `courses` (`id`, `title`, `user_id`, `category_id`, `level_id`, `language_id`, `description`, `price`, `cross_price`, `status`, `is_featured`, `image`, `created_at`, `updated_at`) VALUES ('14', '品質管理（QC）基礎研修', '1', '8', '2', '2', '品質向上と継続的改善を実現するための基本手法を学びます。', NULL, NULL, '0', 'yes', 'https://res.cloudinary.com/dxxfokthl/image/upload/v1771747530/lms/courses/course-14-1771747528.jpg', '2026-02-22 08:00:37', '2026-02-22 08:05:30');

DROP TABLE IF EXISTS `enrollments`;
CREATE TABLE `enrollments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enrollments_user_id_foreign` (`user_id`),
  KEY `enrollments_course_id_foreign` (`course_id`),
  CONSTRAINT `enrollments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `enrollments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('1', 'English', '1', NULL, NULL);
INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('2', 'Japanese', '1', NULL, NULL);
INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('3', 'Chinese', '1', NULL, NULL);
INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('4', 'Taiwanese', '1', NULL, NULL);
INSERT INTO `languages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('5', 'Vietnamese', '1', NULL, NULL);

DROP TABLE IF EXISTS `lessons`;
CREATE TABLE `lessons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chapter_id` bigint unsigned NOT NULL,
  `is_free_preview` enum('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `duration` int DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lessons_chapter_id_foreign` (`chapter_id`),
  CONSTRAINT `lessons_chapter_id_foreign` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('41', 'Lesson 1: 社会人の責任 — 会社で働く意味と責任について理解する', '13', 'yes', '3', 'https://res.cloudinary.com/dxxfokthl/video/upload/v1771748046/lms/videos/lesson-41-1771748044.mp4', '<p style=\"\">社会人として必要な基本的なビジネスマナーを学び、職場で信頼される人材を目指します。</p>', '1000', '1', '2026-02-22 07:21:47', '2026-02-22 08:14:11');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('42', 'Lesson 2: 時間管理 — 遅刻防止とスケジュール管理の基本', '13', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:21:56', '2026-02-22 07:21:56');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('43', 'Lesson 3: 報連相の重要性 — 報告・連絡・相談の基本', '13', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:22:05', '2026-02-22 07:22:05');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('44', 'Lesson 4: 職場での態度 — 礼儀正しい振る舞い', '13', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:22:15', '2026-02-22 07:22:15');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('45', 'Lesson 1: 丁寧語の基本', '14', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:22:28', '2026-02-22 07:22:28');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('46', 'Lesson 2: 尊敬語と謙譲語', '14', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:22:37', '2026-02-22 07:22:37');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('47', 'Lesson 3: 電話応対の敬語', '14', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:22:44', '2026-02-22 07:22:44');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('48', 'Lesson 4: メールでの敬語表現', '14', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:22:52', '2026-02-22 07:22:52');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('49', 'Lesson 1: 名刺交換の流れ', '15', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:01', '2026-02-22 07:23:01');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('50', 'Lesson 2: 来客案内の基本', '15', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:10', '2026-02-22 07:23:10');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('51', 'Lesson 3: 会議室でのマナー', '15', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:19', '2026-02-22 07:23:19');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('52', 'Lesson 4: 訪問時のマナー', '15', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:27', '2026-02-22 07:23:27');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('53', 'Lesson 1: メールの基本構成', '16', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:36', '2026-02-22 07:23:36');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('54', 'Lesson 2: 件名の書き方', '16', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:43', '2026-02-22 07:23:43');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('55', 'Lesson 3: お詫び・依頼メール', '16', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:49', '2026-02-22 07:23:49');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('56', 'Lesson 4: 社内文書の作成', '16', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:23:56', '2026-02-22 07:23:56');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('57', 'Lesson 1: コンプライアンスとは', '17', 'yes', '10', 'https://res.cloudinary.com/dxxfokthl/video/upload/v1771747799/lms/videos/lesson-57-1771747796.mp4', '<p style=\"\">法令遵守と企業倫理を理解し、リスクを未然に防ぐ意識を高めます。</p>', '1000', '1', '2026-02-22 07:27:44', '2026-02-22 08:10:08');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('58', 'Lesson 2: 法令遵守の重要性', '17', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:27:55', '2026-02-22 07:27:55');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('59', 'Lesson 3: 企業倫理', '17', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:04', '2026-02-22 07:28:04');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('60', 'Lesson 4: 違反事例の紹介', '17', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:11', '2026-02-22 07:28:11');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('61', 'Lesson 1: パワハラとは', '18', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:21', '2026-02-22 07:28:21');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('62', 'Lesson 2: セクハラとは', '18', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:28', '2026-02-22 07:28:28');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('63', 'Lesson 3: モラハラとは', '18', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:35', '2026-02-22 07:28:35');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('64', 'Lesson 4: 相談窓口の利用方法', '18', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:43', '2026-02-22 07:28:43');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('65', 'Lesson 1: 個人情報保護法', '19', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:50', '2026-02-22 07:28:50');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('66', 'Lesson 2: 機密情報の取り扱い', '19', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:28:58', '2026-02-22 07:28:58');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('67', 'Lesson 3: SNS利用の注意点', '19', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:29:06', '2026-02-22 07:29:06');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('68', 'Lesson 4: 情報漏洩事例', '19', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:29:13', '2026-02-22 07:29:13');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('69', 'Lesson 1: 通報制度の仕組み', '20', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:29:20', '2026-02-22 07:29:20');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('70', 'Lesson 2: 匿名通報', '20', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:29:27', '2026-02-22 07:29:27');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('71', 'Lesson 3: 調査の流れ', '20', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:29:33', '2026-02-22 07:29:33');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('72', 'Lesson 4: 再発防止策', '20', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:29:40', '2026-02-22 07:29:40');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('73', 'Lesson 1: 情報セキュリティとは — 基本概念と重要性', '21', 'yes', '3', 'https://res.cloudinary.com/dxxfokthl/video/upload/v1771747880/lms/videos/lesson-73-1771747878.mp4', NULL, '1000', '1', '2026-02-22 07:34:03', '2026-02-22 08:23:48');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('74', 'Lesson 2: サイバー攻撃の種類 — ウイルス・マルウェアの概要', '21', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:12', '2026-02-22 07:34:12');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('75', 'Lesson 3: 社内ルールの理解 — セキュリティポリシー', '21', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:20', '2026-02-22 07:34:20');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('76', 'Lesson 4: 事故事例の紹介 — 実際の情報漏洩事例', '21', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:27', '2026-02-22 07:34:27');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('77', 'Lesson 1: 強固なパスワードの作成方法', '22', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:34', '2026-02-22 07:34:34');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('78', 'Lesson 2: 二段階認証の重要性', '22', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:40', '2026-02-22 07:34:40');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('79', 'Lesson 3: パスワード管理ツールの利用', '22', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:47', '2026-02-22 07:34:47');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('80', 'Lesson 4: 不正アクセスの防止策', '22', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:34:53', '2026-02-22 07:34:53');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('81', 'Lesson 1: フィッシングメールの見分け方', '23', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:01', '2026-02-22 07:35:01');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('82', 'Lesson 2: 添付ファイルの注意点', '23', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:08', '2026-02-22 07:35:08');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('83', 'Lesson 3: 安全なウェブサイト利用', '23', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:15', '2026-02-22 07:35:15');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('84', 'Lesson 4: SNS利用時の注意事項', '23', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:23', '2026-02-22 07:35:23');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('85', 'Lesson 1: リモートワーク時の注意点', '24', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:30', '2026-02-22 07:35:30');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('86', 'Lesson 2: 公共Wi-Fiの危険性', '24', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:38', '2026-02-22 07:35:38');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('87', 'Lesson 3: デバイス紛失時の対応', '24', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:45', '2026-02-22 07:35:45');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('88', 'Lesson 4: セキュリティインシデント報告手順', '24', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:35:53', '2026-02-22 07:35:53');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('89', 'Lesson 1: 労働安全衛生法の概要', '25', 'yes', '7', 'https://res.cloudinary.com/dxxfokthl/video/upload/v1771748185/lms/videos/lesson-89-1771748183.mp4', '<p style=\"\">職場の安全と健康を守るための基本知識を学び、事故や健康被害を未然に防止します。</p>', '1000', '1', '2026-02-22 07:39:38', '2026-02-22 08:16:31');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('90', 'Lesson 2: 職場の危険要因', '25', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:39:48', '2026-02-22 07:39:48');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('91', 'Lesson 3: 事故発生時の対応', '25', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:39:55', '2026-02-22 07:39:55');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('92', 'Lesson 4: 安全第一の意識', '25', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:02', '2026-02-22 07:40:02');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('93', 'Lesson 1: 転倒・転落防止', '26', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:10', '2026-02-22 07:40:10');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('94', 'Lesson 2: 機械設備の安全利用', '25', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:16', '2026-02-22 07:40:16');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('95', 'Lesson 3: 防護具の使用方法', '26', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:24', '2026-02-22 07:40:24');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('96', 'Lesson 4: 5S活動の実践', '26', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:30', '2026-02-22 07:40:30');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('97', 'Lesson 1: 定期健康診断', '27', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:37', '2026-02-22 07:40:37');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('98', 'Lesson 2: ストレスチェック制度', '27', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:45', '2026-02-22 07:40:45');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('99', 'Lesson 3: 長時間労働の防止', '27', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:52', '2026-02-22 07:40:52');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('100', 'Lesson 4: メンタルヘルス対策', '27', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:40:59', '2026-02-22 07:40:59');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('101', 'Lesson 1: 地震・火災時の対応', '28', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:41:07', '2026-02-22 07:41:07');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('102', 'Lesson 2: 避難経路の確認', '28', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:41:13', '2026-02-22 07:41:13');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('103', 'Lesson 3: 防災訓練の重要性', '28', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:41:20', '2026-02-22 07:41:20');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('104', 'Lesson 4: 緊急連絡体制', '28', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:41:28', '2026-02-22 07:41:28');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('105', 'Lesson 1: リーダーシップとは', '29', 'yes', '5', 'https://res.cloudinary.com/dxxfokthl/video/upload/v1771747698/lms/videos/lesson-105-1771747695.mp4', '<p style=\"\">チームを効果的に導き、成果を最大化するためのリーダーシップスキルを習得します。</p>', '1000', '1', '2026-02-22 07:46:00', '2026-02-22 08:08:30');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('106', 'Lesson 2: 組織における役割', '29', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:08', '2026-02-22 07:46:08');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('107', 'Lesson 3: ビジョン共有', '29', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:14', '2026-02-22 07:46:14');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('108', 'Lesson 4: 信頼関係の構築', '29', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:21', '2026-02-22 07:46:21');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('109', 'Lesson 1: 目標設定（SMART', '30', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:29', '2026-02-22 07:46:29');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('110', 'Lesson 2: 業務分担', '30', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:36', '2026-02-22 07:46:36');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('111', 'Lesson 3: モチベーション管理', '30', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:42', '2026-02-22 07:46:42');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('112', 'Lesson 4: チームビルディング', '30', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:48', '2026-02-22 07:46:48');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('113', 'Lesson 1: 人事評価の基礎', '31', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:46:56', '2026-02-22 07:46:56');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('114', 'Lesson 2: 面談の進め方', '31', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:03', '2026-02-22 07:47:03');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('115', 'Lesson 3: 建設的フィードバック', '31', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:10', '2026-02-22 07:47:10');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('116', 'Lesson 4: 問題社員への対応', '31', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:17', '2026-02-22 07:47:17');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('117', 'Lesson 1: OJTの実施方法', '32', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:23', '2026-02-22 07:47:23');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('118', 'Lesson 2: コーチング技法', '32', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:30', '2026-02-22 07:47:30');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('119', 'Lesson 3: キャリア支援', '32', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:36', '2026-02-22 07:47:36');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('120', 'Lesson 4: 次世代リーダー育成', '32', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:47:43', '2026-02-22 07:47:43');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('121', 'Lesson 1: アクティブリスニング', '33', 'yes', '3', 'https://res.cloudinary.com/dxxfokthl/video/upload/v1771747946/lms/videos/lesson-121-1771747943.mp4', '<p style=\"\">円滑なコミュニケーション能力を高め、職場での協働を促進します。</p>', '1000', '1', '2026-02-22 07:50:11', '2026-02-22 08:12:35');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('122', 'Lesson 2: 共感力', '33', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:18', '2026-02-22 07:50:18');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('123', 'Lesson 3: 質問技法', '33', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:25', '2026-02-22 07:50:25');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('124', 'Lesson 4: 誤解を防ぐ確認', '33', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:31', '2026-02-22 07:50:31');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('125', 'Lesson 1: 構成作成', '34', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:38', '2026-02-22 07:50:38');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('126', 'Lesson 2: 視覚資料作成', '34', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:44', '2026-02-22 07:50:44');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('127', 'Lesson 3: 話し方の工夫', '34', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:50', '2026-02-22 07:50:50');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('128', 'Lesson 4: 質疑応答対応', '34', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:50:56', '2026-02-22 07:50:56');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('129', 'Lesson 1: アジェンダ作成', '35', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:03', '2026-02-22 07:51:03');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('130', 'Lesson 2: ファシリテーション', '35', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:09', '2026-02-22 07:51:09');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('131', 'Lesson 3: 意見調整', '35', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:15', '2026-02-22 07:51:15');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('132', 'Lesson 4: 議事録作成', '35', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:21', '2026-02-22 07:51:21');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('133', 'Lesson 1: 文化の違い', '36', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:29', '2026-02-22 07:51:29');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('134', 'Lesson 2: グローバルマナー', '36', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:37', '2026-02-22 07:51:37');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('135', 'Lesson 3: 外国人社員対応', '36', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:43', '2026-02-22 07:51:43');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('136', 'Lesson 4: ダイバーシティ推進', '36', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:51:49', '2026-02-22 07:51:49');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('137', 'Lesson 1: DXとは', '37', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:54:51', '2026-02-22 07:54:51');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('138', 'Lesson 2: 日本企業のDX事例', '37', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:54:58', '2026-02-22 07:54:58');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('139', 'Lesson 3: デジタル思考', '37', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:55:04', '2026-02-22 07:55:04');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('140', 'Lesson 4: 業務改革の視点', '37', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:55:10', '2026-02-22 07:55:10');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('141', 'Lesson 1: クラウド概念', '38', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:55:18', '2026-02-22 07:55:18');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('145', 'Lesson 2: SaaS利用', '38', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:56:30', '2026-02-22 07:56:30');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('146', 'Lesson 3: セキュリティ基礎', '38', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:56:37', '2026-02-22 07:56:37');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('147', 'Lesson 4: データ共有', '38', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:56:44', '2026-02-22 07:56:44');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('148', 'Lesson 1: データ分析基礎', '39', 'no', NULL, NULL, NULL, '0', '1', '2026-02-22 07:56:52', '2026-02-22 07:57:53');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('149', 'Lesson 3: BIツール入門', '39', 'no', NULL, NULL, NULL, '2', '1', '2026-02-22 07:57:04', '2026-02-22 07:57:54');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('150', 'Lesson 4: KPI設定', '39', 'no', NULL, NULL, NULL, '3', '1', '2026-02-22 07:57:24', '2026-02-22 07:57:54');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('151', 'Lesson 2: Excel活用', '39', 'no', NULL, NULL, NULL, '1', '1', '2026-02-22 07:57:35', '2026-02-22 07:57:54');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('152', 'Lesson 1: RPA基礎', '40', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:58:16', '2026-02-22 07:58:16');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('153', 'Lesson 2: AI活用例', '40', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:58:23', '2026-02-22 07:58:23');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('154', 'Lesson 3: チャットボット導入', '40', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:58:29', '2026-02-22 07:58:29');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('155', 'Lesson 4: 業務自動化計画', '40', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 07:58:36', '2026-02-22 07:58:36');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('156', 'Lesson 1: 品質とは', '41', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:02:42', '2026-02-22 08:02:42');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('157', 'Lesson 2: PDCAサイクル', '41', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:02:49', '2026-02-22 08:02:49');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('158', 'Lesson 3: 品質コスト', '41', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:02:55', '2026-02-22 08:02:55');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('159', 'Lesson 4: 顧客満足', '41', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:00', '2026-02-22 08:03:00');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('160', 'Lesson 1: パレート図', '42', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:06', '2026-02-22 08:03:06');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('161', 'Lesson 2: 特性要因図', '42', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:14', '2026-02-22 08:03:14');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('162', 'Lesson 3: ヒストグラム', '42', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:21', '2026-02-22 08:03:21');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('163', 'Lesson 4: 管理図', '42', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:27', '2026-02-22 08:03:27');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('164', 'Lesson 1: 整理', '43', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:34', '2026-02-22 08:03:34');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('165', 'Lesson 2: 整頓', '43', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:40', '2026-02-22 08:03:40');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('166', 'Lesson 3: 清掃', '43', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:47', '2026-02-22 08:03:47');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('167', 'Lesson 4: 標準化', '43', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:53', '2026-02-22 08:03:53');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('168', 'Lesson 1: 問題発見', '44', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:03:59', '2026-02-22 08:03:59');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('169', 'Lesson 2: 原因分析', '44', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:04:05', '2026-02-22 08:04:05');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('170', 'Lesson 3: 改善提案', '44', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:04:13', '2026-02-22 08:04:13');
INSERT INTO `lessons` (`id`, `title`, `chapter_id`, `is_free_preview`, `duration`, `video`, `description`, `sort_order`, `status`, `created_at`, `updated_at`) VALUES ('171', 'Lesson 4: 成果報告', '44', 'no', NULL, NULL, NULL, '1000', '1', '2026-02-22 08:04:22', '2026-02-22 08:04:22');

DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `levels` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('1', 'Beginner', '1', NULL, NULL);
INSERT INTO `levels` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('2', 'Intermediate', '1', NULL, NULL);
INSERT INTO `levels` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES ('3', 'Expert', '1', NULL, NULL);

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('1', '0001_01_01_000000_create_users_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('2', '0001_01_01_000001_create_cache_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('3', '0001_01_01_000002_create_jobs_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('4', '2025_04_19_042726_create_categories_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('5', '2025_04_19_043023_create_languages_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('6', '2025_04_19_043142_create_levels_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('7', '2025_04_19_043324_create_courses_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('8', '2025_04_19_044636_create_outcomes_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('9', '2025_04_19_044654_create_requirements_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('10', '2025_04_19_044950_create_chapters_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('11', '2025_04_19_045017_create_lessons_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('12', '2025_04_19_045858_create_enrollments_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('13', '2025_04_19_045924_create_activities_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('14', '2025_04_19_045937_create_reviews_table', '1');
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES ('15', '2025_04_20_084615_create_personal_access_tokens_table', '1');

DROP TABLE IF EXISTS `outcomes`;
CREATE TABLE `outcomes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `outcomes_course_id_foreign` (`course_id`),
  CONSTRAINT `outcomes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('13', '7', '基本的なビジネスマナーを理解できる', '1000', '2026-02-22 07:24:06', '2026-02-22 07:24:06');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('14', '7', '正しい敬語を使用できる', '1000', '2026-02-22 07:24:11', '2026-02-22 07:24:11');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('15', '7', '来客・電話対応ができる', '1000', '2026-02-22 07:24:16', '2026-02-22 07:24:16');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('16', '7', 'ビジネスメールを適切に作成できる', '1000', '2026-02-22 07:24:22', '2026-02-22 07:24:22');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('17', '8', '法令遵守の意識向上', '1000', '2026-02-22 07:27:04', '2026-02-22 07:27:04');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('18', '8', 'ハラスメント防止の理解', '1000', '2026-02-22 07:27:08', '2026-02-22 07:27:08');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('19', '8', '情報管理能力の向上', '1000', '2026-02-22 07:27:12', '2026-02-22 07:27:12');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('20', '8', '適切な通報対応の理解', '1000', '2026-02-22 07:27:15', '2026-02-22 07:27:15');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('21', '9', '情報セキュリティの基礎を理解できる', '1000', '2026-02-22 07:36:00', '2026-02-22 07:36:00');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('22', '9', 'サイバー攻撃への対処方法を身につける', '1000', '2026-02-22 07:36:03', '2026-02-22 07:36:03');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('23', '9', '安全なIT利用習慣を確立できる', '1000', '2026-02-22 07:36:07', '2026-02-22 07:36:07');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('24', '9', 'インシデント発生時に適切に対応できる', '1000', '2026-02-22 07:36:11', '2026-02-22 07:36:11');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('25', '10', '安全衛生の基本理解', '1000', '2026-02-22 07:41:35', '2026-02-22 07:41:35');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('26', '10', '事故防止意識の向上', '1000', '2026-02-22 07:41:38', '2026-02-22 07:41:38');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('27', '10', '健康管理の重要性理解', '1000', '2026-02-22 07:41:42', '2026-02-22 07:41:42');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('28', '10', '災害時の適切な行動', '1000', '2026-02-22 07:41:45', '2026-02-22 07:41:45');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('29', '11', '効果的なチーム運営ができる', '1000', '2026-02-22 07:47:49', '2026-02-22 07:47:49');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('30', '11', '部下育成能力の向上', '1000', '2026-02-22 07:47:53', '2026-02-22 07:47:53');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('31', '11', '適切な評価と面談ができる', '1000', '2026-02-22 07:47:57', '2026-02-22 07:47:57');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('32', '11', '組織成果の向上', '1000', '2026-02-22 07:48:00', '2026-02-22 07:48:00');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('33', '12', '傾聴力向上', '1000', '2026-02-22 07:52:09', '2026-02-22 07:52:09');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('34', '12', 'プレゼン能力向上', '1000', '2026-02-22 07:52:12', '2026-02-22 07:52:12');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('35', '12', '会議効率改善', '1000', '2026-02-22 07:52:16', '2026-02-22 07:52:16');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('36', '12', '異文化理解促進', '1000', '2026-02-22 07:52:19', '2026-02-22 07:52:19');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('37', '13', 'DX基礎理解', '1000', '2026-02-22 07:58:42', '2026-02-22 07:58:42');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('38', '13', 'データ活用能力向上', '1000', '2026-02-22 07:58:46', '2026-02-22 07:58:46');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('39', '13', '業務効率化推進', '1000', '2026-02-22 07:58:49', '2026-02-22 07:58:49');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('40', '13', 'デジタル思考習得', '1000', '2026-02-22 07:58:53', '2026-02-22 07:58:53');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('41', '14', '品質管理の基礎理解', '1000', '2026-02-22 08:04:29', '2026-02-22 08:04:29');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('42', '14', 'QC手法の活用', '1000', '2026-02-22 08:04:33', '2026-02-22 08:04:33');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('43', '14', '改善提案能力向上', '1000', '2026-02-22 08:04:37', '2026-02-22 08:04:37');
INSERT INTO `outcomes` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('44', '14', '生産性向上', '1000', '2026-02-22 08:04:40', '2026-02-22 08:04:40');

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('1', 'App\\Models\\User', '1', 'token', 'f4f413896ade3f17aaa3d8e165a59a70fe17e5f81d6741d4e697bbce8963739f', '[\"*\"]', '2026-02-18 10:58:01', NULL, '2026-02-15 14:17:19', '2026-02-18 10:58:01');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('2', 'App\\Models\\User', '1', 'token', '79e1378cec561508e4d6ccb67519313fa6522b1571cbfb55ae406d5f300f7ae9', '[\"*\"]', '2026-02-19 00:49:50', NULL, '2026-02-16 21:25:33', '2026-02-19 00:49:50');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('3', 'App\\Models\\User', '1', 'token', '2145edcb3e4ad72fa57a72c2572eb14f8fca7599e4abdc3a17b1fe8ce86cf086', '[\"*\"]', '2026-02-20 03:49:20', NULL, '2026-02-18 10:57:27', '2026-02-20 03:49:20');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('4', 'App\\Models\\User', '1', 'token', '8f7c4452d92ea882db592e01f34d0f5df4dd46d3bae122f6eaeabe3c03735965', '[\"*\"]', '2026-02-19 05:03:09', NULL, '2026-02-19 05:02:43', '2026-02-19 05:03:09');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('5', 'App\\Models\\User', '1', 'token', '76b07afda129d5f21bcf318c4f20b0fcfdd6278addec4c7ead0b39ac2f4d52fc', '[\"*\"]', NULL, NULL, '2026-02-19 05:04:53', '2026-02-19 05:04:53');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('6', 'App\\Models\\User', '1', 'token', '62324cba3bb85cbde446a16df945c621eef66fc312b78d3021a90d475e1807f6', '[\"*\"]', NULL, NULL, '2026-02-19 05:06:22', '2026-02-19 05:06:22');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('7', 'App\\Models\\User', '1', 'token', '2d2b1a9218a5fa38043b7adc088227a210b799f70c8d3f9822257e5658bdadbb', '[\"*\"]', NULL, NULL, '2026-02-19 05:06:49', '2026-02-19 05:06:49');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('8', 'App\\Models\\User', '1', 'token', 'a4d18c2e9ce06ef9c112b9597bfd84b664060adc1f86440645b222ed20164aea', '[\"*\"]', NULL, NULL, '2026-02-19 05:08:45', '2026-02-19 05:08:45');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('9', 'App\\Models\\User', '2', 'token', 'c4dd8254a097203740841aac30b45d5a88f9a3aa8951fb0f0fe3f58bff4b909d', '[\"*\"]', '2026-02-19 05:25:29', NULL, '2026-02-19 05:11:30', '2026-02-19 05:25:29');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('10', 'App\\Models\\User', '1', 'token', '91f5582d03e79d0413593df7cabcf9a5ebc05710f3f0dc9ca948a473cd0c0c01', '[\"*\"]', '2026-02-20 01:45:46', NULL, '2026-02-19 05:25:23', '2026-02-20 01:45:46');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('11', 'App\\Models\\User', '1', 'token', 'fdc7321bba1fe65ac1220b4f565594be0e1683acf149665a86725003c02877cb', '[\"*\"]', NULL, NULL, '2026-02-20 01:40:36', '2026-02-20 01:40:36');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('12', 'App\\Models\\User', '1', 'token', '34aa2572854a96e78842fb38d5ae90c4523065da49ae32b12759d5e8fc54c7c9', '[\"*\"]', '2026-02-20 02:38:36', NULL, '2026-02-20 01:59:29', '2026-02-20 02:38:36');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('13', 'App\\Models\\User', '1', 'token', '0547da6bc37f1c09b7ba9f2f73ec42585867979d0da7a683b247c97305b7f8fc', '[\"*\"]', '2026-02-23 10:28:26', NULL, '2026-02-20 02:38:16', '2026-02-23 10:28:26');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('14', 'App\\Models\\User', '1', 'token', 'd83c784cb3a2db6e46b30000401f31d99e3822e420b10428ee1cc95eac567307', '[\"*\"]', '2026-02-20 03:51:34', NULL, '2026-02-20 03:49:04', '2026-02-20 03:51:34');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('15', 'App\\Models\\User', '1', 'token', '1206c520bd69c338a9e663c747621b4aa5dd17a4249aa0ac9cbeede790bd4cfc', '[\"*\"]', '2026-02-22 08:23:52', NULL, '2026-02-21 11:44:06', '2026-02-22 08:23:52');
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES ('16', 'App\\Models\\User', '1', 'token', '203b19d5d08ea68b4cd68e7e6dab9eb36fc76dc021fb9950213b86f4a32e204c', '[\"*\"]', '2026-02-23 10:22:46', NULL, '2026-02-22 12:46:06', '2026-02-23 10:22:46');

DROP TABLE IF EXISTS `requirements`;
CREATE TABLE `requirements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requirements_course_id_foreign` (`course_id`),
  CONSTRAINT `requirements_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('12', '7', '日本語能力N3以上', '1000', '2026-02-22 07:24:28', '2026-02-22 07:24:28');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('13', '7', 'パソコンの基本操作', '1000', '2026-02-22 07:24:32', '2026-02-22 07:24:32');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('14', '7', '会社規則の理解', '1000', '2026-02-22 07:24:35', '2026-02-22 07:24:35');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('15', '7', '受講後の確認テスト受験', '1000', '2026-02-22 07:24:39', '2026-02-22 07:24:39');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('16', '8', '全社員対象', '1000', '2026-02-22 07:27:20', '2026-02-22 07:27:20');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('17', '8', '年1回受講必須', '1000', '2026-02-22 07:27:23', '2026-02-22 07:27:23');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('18', '8', '確認テスト合格', '1000', '2026-02-22 07:27:26', '2026-02-22 07:27:26');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('19', '8', 'ケーススタディ参加', '1000', '2026-02-22 07:27:30', '2026-02-22 07:27:30');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('20', '9', '全社員対象', '1000', '2026-02-22 07:36:16', '2026-02-22 07:36:16');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('21', '9', '年1回の受講必須', '1000', '2026-02-22 07:36:20', '2026-02-22 07:36:20');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('22', '9', 'オンラインテスト合格', '1000', '2026-02-22 07:36:23', '2026-02-22 07:36:23');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('23', '9', '社内ポリシーの確認', '1000', '2026-02-22 07:36:27', '2026-02-22 07:36:27');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('24', '10', '全社員受講必須', '1000', '2026-02-22 07:41:49', '2026-02-22 07:41:49');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('25', '10', '年1回更新', '1000', '2026-02-22 07:41:53', '2026-02-22 07:41:53');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('26', '10', '防災訓練参加', '1000', '2026-02-22 07:41:56', '2026-02-22 07:41:56');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('27', '10', '確認テスト実施', '1000', '2026-02-22 07:41:59', '2026-02-22 07:41:59');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('28', '11', '管理職対象', '1000', '2026-02-22 07:48:04', '2026-02-22 07:48:04');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('29', '11', '実務経験3年以上', '1000', '2026-02-22 07:48:08', '2026-02-22 07:48:08');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('30', '11', 'ケーススタディ参加', '1000', '2026-02-22 07:48:11', '2026-02-22 07:48:11');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('31', '11', '修了レポート提出', '1000', '2026-02-22 07:48:16', '2026-02-22 07:48:16');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('32', '12', '全社員対象', '1000', '2026-02-22 07:51:56', '2026-02-22 07:51:56');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('33', '12', 'グループワーク参加', '1000', '2026-02-22 07:51:59', '2026-02-22 07:51:59');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('34', '12', '実践演習必須', '1000', '2026-02-22 07:52:03', '2026-02-22 07:52:03');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('35', '12', '修了テスト合格', '1000', '2026-02-22 07:52:06', '2026-02-22 07:52:06');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('36', '13', 'PC操作可能', '1000', '2026-02-22 07:59:16', '2026-02-22 07:59:16');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('37', '13', '基本的IT知識', '1000', '2026-02-22 07:59:20', '2026-02-22 07:59:20');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('38', '13', '実習参加', '1000', '2026-02-22 07:59:23', '2026-02-22 07:59:23');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('39', '13', '最終課題提出', '1000', '2026-02-22 07:59:27', '2026-02-22 07:59:27');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('40', '14', '製造部門対象', '1000', '2026-02-22 08:04:44', '2026-02-22 08:04:44');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('41', '14', '現場経験1年以上', '1000', '2026-02-22 08:04:47', '2026-02-22 08:04:47');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('42', '14', 'グループ演習参加', '1000', '2026-02-22 08:04:51', '2026-02-22 08:04:51');
INSERT INTO `requirements` (`id`, `course_id`, `text`, `sort_order`, `created_at`, `updated_at`) VALUES ('43', '14', '改善レポート提出', '1000', '2026-02-22 08:04:55', '2026-02-22 08:04:55');

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `rating` int NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_user_id_foreign` (`user_id`),
  KEY `reviews_course_id_foreign` (`course_id`),
  CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('0BAZx4LySMSAXSFEQyKgo9dwRxykNRrMVIDYaKap', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid2gzemdaTWJ4T1dyb1hmbVNvdEpWRWRkWndUZkM5cG1ESnplNEphQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772319957');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('1aA5oIXm2ExUIKZsmKgrwK8QP4KKq1HsG1AdfjLQ', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRG1LRlFJVDI3V2FjSnhjUGpxZElNZnhiYnNhNWMycWdXOHB2c1V2WCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772310122');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('1PkD8Q9NJ32JNvmAFXOo9OATE3p5HrPmym6560WG', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWVZ5YmZqbml5ODJTQ21HUXJhdVVXVGFTdVdHemphOW9lbGduOGVLYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772318725');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('3a7hd8weNyI0x1sCiUXg6UFGox1CbGlAnvOTngEy', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQmxJMEFpN1poUXk3eHM5aDR2b2pDdDhIYjlkalhuYTZuNE1LNFV6ZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772298756');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('3khYRukjczfwd1rIdZhFBcBm9qi76UMwJtM2ealW', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicHRuekVLQ3hjckVSQ244VXNjanI1NUpleWdORnFTSmRYY0NKYVBYciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772319344');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('3kvHPF402BNI1vDvgZM9OiF7P246X7Apgo9iwPpi', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ29icktkeUVwUFdTTWk1eDdZdVVVd2cweTZUa3RSWEF1SGJCZ0xHbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772299062');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('4EpCC2ts7QOTOWal81gxMo8FHemTO6WC93sR8Fp8', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoialpWRnAzRkVUbDVuUjJlVVcwOWZ5a3B0cWMwYlF5RkxHc1UyUEFwbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772314736');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('4LAQu2G1laZGaCISqHoev8VHf0Yaroh6VAtGv8DX', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVnJUOWFrbEJHd2ZmM2g2MHhsckc3azdickJRdno0OWVMSzFoM0hSTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772301515');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('4vGvTtNyCwymxIlQrDXV46C953oiTGOMnk6Q6v9j', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWmo1WW1BSFNWYTBwdGI4a0plNXVCakp3WFNqUGRvMjdvTGc1dUlZTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772300288');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('5CAaDoAmp0t7EEgJtScHYrqtOyhu6CW6d25Di5yb', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNVMxazkxMmNwMnFteG1MVU0xMVVjN1lPY0VTRDZMOFZtWm1mSnFQWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772313200');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('5zwAWZYO5z5pyzXaBuXrbAfXO9neO9gDjuptO1UB', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMW1nWjB4UXdvb2lTU0JLaFMweE53U3Z1cVFER2RRYXA5alJFQlRyQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772319651');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('8anzleRmex5FW3mglSdYW0MFlLu88v75Tz1sru3t', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY3JPaDlYcGlvMTFhcEV5U01WYUJ0bWFBZnpTbExFSDd1dTFyZkREdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772302743');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('9pzVAWkcf6CWQSzWfFagxwWht7KA5ib83WtAXn58', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiM2Q1RUg0Q2txYTFCN2VVQldpUGhTRHRxMHhBc2MzbEVTZW1zWjFPMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772313815');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('9RTIMDRgQ45ITLQV01coQSWrS7p4u0aIl7LS6Na2', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRmMxSjE5UThocnhOcXlEWGxNcW11S05TZWFQOE9ieDFHUzloNklqbiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772313507');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('9zjHKWWTptPhNvJ8aSo8sPyAfzivGvcaFxD9ZjuI', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ2JrT0x1WkZHWVo0UVVvQUtXYVhYSjFIZXVnazR5djh1OVJhUXlOUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772311047');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('am1Pb03rs4T0TIEdkQYgFO6F2bG29zfavcFkz1wO', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYWVENzYxbWMwQThDR25mUHl6Mmw0S2pmYVpmaHBPanBmWGVHQUhONyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772304274');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('B3xaHIdvsX98pFl2yugSCgxHv8CHyiAtaTRp1JmO', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSTlUMU03OTV4Zkc4TFNRYmlWTUt4R0YwdTFDNEUwd21YVmszS1YwZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772309816');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('bZH0REOyykCXxAKAS5sApYg9JmlD0GzEXP3QDIKX', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUGFpd3Y2WTlFa3BYSEpuZ2djZ2FQeXRDdlBRaWNaYUpwYXhlMEdjQyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772315349');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('cC0pfmZ73vOZwQcbpiefqY4i8aBTAkPo3tdOLPGQ', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiU1E3SG1DaWl1dzBCYXVkQklCU3ZvcGRSSzlTYUhneXU4ODlwZVdlNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772318110');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('ckmK0d47lMlxn5Nck6jEBNT17yEjODqAIRWhd4SC', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT0xWNTRrZkl2ZVZrRUxOU0lOdE9zck10cHRqbmxZVEpWNzlhcUtQdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772309204');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('cOLN3TUKSDAkiah4ybXlsUHUw78BHtfocQUQYf21', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSDFSWUdwbUlGNWhCN1NsRmJ5OXlSRGdTZ2RmR1ZYTDhDMXFJWlFXWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772315962');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('CuslUpydUUZkzzYp5XtQaW6aHB2fWXlTnVmAKByr', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiREJQYjRvRG5ZNlBlR0p6Mk9pdHE5d0xxTEFiakxVbEhvTTBMb1d0eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772304888');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('DHI1KFsSmx49B3lCViki4XoqUqo9ZaLbNrMMQrpA', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoia1RuUmlSQ2VTRHJ3dFdxaVlvb0dBcU9Sd1FOdHBiY3A5R2RJTXpNYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772307658');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('DOSwfMyg5uLkURrfug1DOQBDIl6odsiMaXTpRlUH', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiang3NEpCbk1OMUk3WlBWVTJmS1hnUjBqMmFFcUpqdWg3dnJBNWpJeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772306434');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('DSrB869hd6y5CHQz7r6La9jyb5e0hbZMdqrU3Xfh', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSUE0anVLbUswZ0h3Z3FhZnBKVFJtWG5lSVRVWlZwYmdoU1RRWkF3VyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772307972');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('dv7k8Lr9ViCCOtLGP562Em71weX6PaPAUYFpDqGz', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZW1vYzk4SXR3T0VhRWhVV3R5VmE1VkgyWmR5UENLenFwZGJoMnNDZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772303661');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('e6IPQCccEhXGwFmxzsMVF2YW1oy0TzhfsA86MGG9', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWnV5eFRRT2Jwa1IwVVFFSUVkZ0g2VVJoT0tWUEhaT0o4b29LQktKUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772310734');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('eZ1ncNPMfEWHWTJNC0bfizDG3iG1Ry96T6Wu6RQH', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRWlNYzg3WkVqZ2EwWnU1enk2VThxVXoyWGdvT2ZNQ2pvZGtBV3Z4SyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772305816');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('F1mFiWxlV0cqqsAodPdFUNYR74jeLG43VnBrPtLx', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaTJiUEF5MEFpcnhsUUE4R1BOdm1OTHc1dmxIb3IyVHZXZXc3TW1laCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772310428');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('FMvOCkCqgCBTdBVVw3MiakQboxj2BSCR3UzghBGV', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN0Z4M3l6V25wTnBuUDV6SnMweGVod1ZSOEpSUWNXNFIyTE9nNmllUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772317186');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('GFx7a9WL06B7n4HNkw6Z1U2f05B0ol4xmlieFKlq', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiN1QzVG1XY0sycHlrWE9hUDFzR0FncG9oeEZNdmF2RTJtenRGM0xQYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772300902');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('H22pUqnZFqFWB38jKOH3ZA51iIyCTVWM8C3PKSKF', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibHd2dDRlNmNTbFNLSDhPTmVoTERJWjVNUGREVjBKNEEwYzNwWElpNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772298449');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('hCIKmVbKFeezsxSx21WJjdBKQJ2PJ2LdADdGrL8O', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMDlMQmhBYVhyenMyenZlekJlTnhzRHNuSVNJeklZZGtHT05xREV5QiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772302129');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('hkjil7ZCnHNxJOksGRycpQ5ZFXvb40Aa3nTh8nB1', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSHFYRzQzamdPRmdrT0xnc2RzdVRyWkhxNktkd0hKd2pma2x3MmsxdCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772320267');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('iK8x37GYjk4U9qG8rlliCWtaWN5PD8VatEPDPx6J', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNDg2VGJROGQ4dEg2OVpORlNRTjM3WTNZZXBWNW82VDk0dGpBNUhQdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772299676');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('iwfm5o1sAhxBBbOBa4nDUaxYbFyflVoMnXoRksJp', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNUZmcXVLcERsQ2UyekpTQ0NnZUJBc3RHaTBnQUJxdm1SMkJaQ3M4OSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772303049');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('j203hWMRwRwDfTL2xwYUPRtcMrkWgzbWInmsdyhO', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoib1IzWmduNnZ2dmVKdzdPcE5oSXdIRUtjaGptcHpBaEQzRFhEc0d3VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772301822');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('j668X1iKNEvGB16japOtLaUtq2DayebjPJ2OiYY5', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVTdpcndhMmlOYTY2SktoVzhLMUh4Z2pHZHRkUmVuaVR1QjVSWXNUOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772300595');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('K2fPW4zL5aXz2eYtp7UwHcn2awrxzWXNSXYvBkEH', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMjlESHF0ZDg4VnpjVEUzN0E3eGIwMU5HMllwUUJvbDFhbHBMNEJaSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772309510');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('kJdRUlM20BtfHAP8QXoTdEwWfz5f3j6QRUbIlCWQ', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYkFRc3RKbFFYaUlKZTZUSjlnRFVFVWUxVTQ2clE3b20yaG9xY1VuMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772303968');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('kvzmIHFRvBrhnaBzmpaqLriNfaaBd95CMbAIAgrP', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMjZDM3FLN2QybDlJZ2JsbllremdRbW5wQll5dkxIQUZaR2lMY3IzcCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772297531');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('LBkiwCzytCTvOD6GJchC3D14NinxDQJ2P9jz3rT9', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicUwyVjFJaVRJb1UzUzA3YnNWZnp4VnVzRzNvNGhUQnpSRDE3aW1KVSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772316574');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('lCJgBx76YsPXGsOmr391cmQwkx39Q1ZOEyhO5mne', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVmxlVmU2QTF5ZUpscDZZY2QxemNKcVRYWEowM3Z6VUJmVEE0WFNRRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772311966');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('lFmDGnLaHHQI2KSbSBTPS0KX3W3nIQdONpckeKsK', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiT0V4OFVHZllNUExTeUJ2MzVyYWpVZjhnNWtJZEtCZWtrclFjVEQxTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772308897');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('loWxDTjvt4OmNBdXsn7zjRjhO4XDLEeDzgc51v81', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieVJGckpuekFOWDEwNDdmMDBQaTgwQWxRV0t2eUFPa1l5U1VlYm1yUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772306740');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('LxEkyHthjXrBIBFiWw1vBtrJIJD77CtFEORTPyY7', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUm5lYm41MU5FZUk4c1hYeWNDUE8ybVloMTd0R3J0NWp2RUVheVBwaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772312892');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('MXCVIJCQ25NAZmzd46ox23nFq044yfcjWgqlQiTB', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQjZEMkljbDVDcG1LN0t4enBmUmMwS0ZzMUZxVGs4SGlZaGhBRWdvMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772308278');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('NaroBACGggdVqe8XhVqlUhHCsuLYhxcw5odZERWT', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic3hEUEx4T0RZMkk1T0tQM3RzaGdkTmVIaHFoVVBQWmdBeDM3RlJpdSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772315656');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('NOZJlxpX9iOYKP6IdeCf6GRhmt5591QcInVAMG70', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaU1GU3JnZ2hKSmdzb3BOREd6emgxWkcySGFyOExpcmo5Q21PWmlOYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772315042');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('o2RStlA59d07rCtmll8AHlnvqIDIKD94pUv7irIc', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOEpRV01zb1hpOXlnMUcxRVF0c2dmSzFHbXpPaEVzNGxGOGNTMTZGdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772307046');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('o6rHSUCtKNhkVp3hOCobkNvrsXAQIEXJIjCIFS1T', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWVhKYk5pSkFaaEdHeWY1c2U0QTI0cWk3ZEFPWm4yRWpkeW01Qm9UOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772314122');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('O7sLvgmoo91z74vL2KJ8CJeHv8IgUIzsGerasBSh', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSWN5VjF5UUNlVElmS0t5cGZSVkEzc2RQWENxNUY1NHlBQ0NwblNlWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772320574');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('Oe4T0LuYmhGjc7NfYyMm0f1Wy2wIwKfPerKWIf3u', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTlFYUE1tSGNRbXN6WERsUHlrUDZManNsQmdkeURhdVBFQk9SeUNodyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772297836');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('PcHdCJByg0v8b4rOGFJlybmmLEE2YZMSVSvQpakF', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiajN1bHZZQ29FOG8yM3FpZFY2RUJsOU82ODlUY2MzOVBsUXprb29PZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772312272');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('qapsX6XiThDQc9wsDZDABMUq3J1mNvZsqwKo6yxZ', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUzlyRVRZSU5Yc0RmdlFCcm91SXFRZXRGSWdRN2s0VVlzN0h0NWgycSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772317805');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('RtIMNhmUrD1grAKt98zU33MSLI6zm2ybbvAWCmlR', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY21sVWxyTmhtcEFIQmViN3oxZGtxVGd1ekRBRGphQXZVMUswNFliaCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772311660');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('sSzZrzFuzqHgznjpxI4z6Bo2Q4gqbR2xMSmC6jmE', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoieTY0MlVtNndSQ1IwSFJKTWhselRnQ2dkWHhycjhOVnVRblI5VEhjTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772317493');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('sUEfjmfcX1na275OZO4AdC4jw9kq4DWV4ypFFpzk', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQU9tcG02eElFS1lsQ01PZGxVWEx0emI3Ym1VR1BTWXAzblR6VE5oSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772306122');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('swo4stJ242X4eEct7ylihawIDIGdba6FfHFNDL2u', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicnpMem1Tb2p4QjFBV0g4djVReDVNVmtBVXRzbkRrSnFIQ2Q4bzR2eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772318418');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('tK8RameE3S7h0v44kjFoeftO4gXTCGbKOACivusy', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV0lCbWh3cm1VMENQRGxpamc1dnVWZ010V21lUkpjN2pPUFlvRVlITiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772305203');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('ugXwRjEb1ojVIHTbRC2eNvT5xaFpiRsSRt5CMIdT', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUFdhY3pvRDRuaGthcEhrMjVMV081ekx4aHRjQ3E5TUxsVUR6Z1BGeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772307352');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('UhRID1Cp6tKiaBtyed1qt5GsHCR9BqXBlPeFBwAz', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiV3hZYTNyZ2NiellrRTd0QWlKODMyUjhjMTVUMjZyUTNoczlNQXYzcSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772319037');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('v1VCMVXoI5vNHlcy3tNjFwWn6W0b3V9aL35KjsuS', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoic1M2aWxCN25CNDNEZnllbmE3Zk91eUhScUNSekxuSGN0bUx0U3lFNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772316268');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('Ve9PCc8YwasDJkXmKk13w2iU6o72RPUml9hnb9t8', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMlY2dmJhd2NMemxtb1dST2pKMUZBV3dwanE3MGhiZm9Ma2dWWlZHZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772302435');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('vf2B5iD0yXgREel715HPcUlRSPJTxxLqg5bL5Tut', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRHpaNzBGY3JpdWhQb1RMM0pjWGhOb2JYOVozZmNzN1dVR3NBMXpsRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772308584');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('VHx8E0emE4KmIirS9NdVcijfDwtNElNE9vyy4JSy', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUGhzOXdXZlFaUkpramRnMmtPV3V1aGdnaEVia1pSNkZuZ3hqSE1jRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772298144');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('VQa0xhBSqQISJuee3AiZqXiW05uYTQBosT6h1OQg', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiQ0RKdnlrSHR0aTdsb2xISFZlcGxhY1gwV3pUM1RFR1NhRmd0QVhWOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772299982');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('WOafmXnKdAcR2QWV9qMZCDSY6WqrN2hqRETrVmfm', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibDY3MmdUMEMyOGt3b1oyU0hWNHQxZUswUTR3aFI1aUtJOWk0ZGh2bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772311354');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('WZq5ol5Y2F9rcOiOwt49ZiNweU31RnyuNFrJPVKt', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWW5LWnM3ZXEzWmFTbVBUQkxzd0JHOTdSU29pOTNIOTFTVnZQd0RHMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772312579');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('x59jwrtomT5VektkNFAOtUUJ8xcTUwqqcnyxJLkD', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNE96V21nbW5rOEVDdnR2TGdsVnl2VEIyejk2SjEyZ3JEc3RmWWI3TSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772304581');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('YgKddZabKC1vBpSdVI5Jylu2xIEvGU0P1QccFrtI', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMkhlclp5WlJzUXVqdVhIZmEydWNlUHZCdHRMTFN6N0RhQVpzeVNMdiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772299369');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('YjqqVzVqnzswvtz0xhPVEqojHICun6BmeqT8yBrX', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZU5jZ3V4eW9lNGpDTklPQnJKYTV4cTRaQm04Mmwyd1FNUUllazRtUiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772314428');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('YlLr9JNoUSqwDG0XHKqltcDaB7TBq7RqcIe4AryR', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiakNSWFBQV2pZcDlDWEtHR0hoelV6WjhKN0FIZFpkZlZaUnloeEhheiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772303354');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('z6PI19ipXi3CSD9J6kmD8Wmc1zVf0qCEmjEd7mnx', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOFY3ZTR6NkNhVG0wSFA4YVRXZjdyVmxOczdhVlN4VjFzQkNNM2R4ZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772316880');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('z7peQYizn3D7qCF2vctKnjeIVhJAEmoM3jXpi6Cn', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVks4TU1vV2xTeDJCTDVxdGJaZnhNNHV6ak1PV2RiM3paM3FFcVdWOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772305509');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES ('zjTtnQGAleHpGvPgKEEF3f89ycLqxnbtLICmbCfk', NULL, '::1', 'Mozilla/5.0+(compatible; UptimeRobot/2.0; http://www.uptimerobot.com/)', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidmdPWU15S3hQcWFSRGZ6UWlVTFh4dGM0UUVPREp3S2xYbjJLbVhtTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', '1772301209');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES ('1', 'huyducanh', 'ilovephp@exam.com', NULL, '$2y$12$6NuMJM51.2IGoKscttgDhe5Qsr1BIu5nxlEtH0Q4hJ/EJs0Iv/rpq', NULL, '2026-02-15 14:17:13', '2026-02-15 14:17:13');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES ('2', 'laravel', 'laravel@exam.com', NULL, '$2y$12$LeKnazsUhJiLr7LwQkurk.Atg62RxKMvV2wRrpz81cWFbaYoTe51O', NULL, '2026-02-19 05:11:15', '2026-02-19 05:11:15');

SET FOREIGN_KEY_CHECKS=1;
