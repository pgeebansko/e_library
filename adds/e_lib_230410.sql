-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10 апр 2023 в 11:17
-- Версия на сървъра: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_lib`
--

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Клас', 7, 'add_klas'),
(26, 'Can change Клас', 7, 'change_klas'),
(27, 'Can delete Клас', 7, 'delete_klas'),
(28, 'Can view Клас', 7, 'view_klas'),
(29, 'Can add Учебен предмет', 8, 'add_subject'),
(30, 'Can change Учебен предмет', 8, 'change_subject'),
(31, 'Can delete Учебен предмет', 8, 'delete_subject'),
(32, 'Can view Учебен предмет', 8, 'view_subject'),
(33, 'Can add Специалност', 9, 'add_speciality'),
(34, 'Can change Специалност', 9, 'change_speciality'),
(35, 'Can delete Специалност', 9, 'delete_speciality'),
(36, 'Can view Специалност', 9, 'view_speciality'),
(37, 'Can add Статия/публикация', 10, 'add_article'),
(38, 'Can change Статия/публикация', 10, 'change_article'),
(39, 'Can delete Статия/публикация', 10, 'delete_article'),
(40, 'Can view Статия/публикация', 10, 'view_article'),
(41, 'Can add Тема', 11, 'add_theme'),
(42, 'Can change Тема', 11, 'change_theme'),
(43, 'Can delete Тема', 11, 'delete_theme'),
(44, 'Can view Тема', 11, 'view_theme'),
(45, 'Can add Въшен ресурс(link)', 12, 'add_link'),
(46, 'Can change Въшен ресурс(link)', 12, 'change_link'),
(47, 'Can delete Въшен ресурс(link)', 12, 'delete_link'),
(48, 'Can view Въшен ресурс(link)', 12, 'view_link'),
(49, 'Can add Прикачен файл', 13, 'add_attacment'),
(50, 'Can change Прикачен файл', 13, 'change_attacment'),
(51, 'Can delete Прикачен файл', 13, 'delete_attacment'),
(52, 'Can view Прикачен файл', 13, 'view_attacment');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$5Nc7u2GdzFUfT56CIJniFE$FFT4yRKPb8CDN63zvAxi0tZbaodytkvT4uiDYO3TGEU=', '2023-04-10 08:57:14.806672', 1, 'admin', '', '', '', 1, 1, '2023-04-02 12:50:55.240524'),
(2, 'pbkdf2_sha256$390000$jGgvh4vyNe1KBMOOMxqGf8$ywyaFgRV3+9T/0KdsHD8fe/cxO5IwKLx5fOIZbB9/Ws=', NULL, 0, 'teacher', '', '', '', 1, 1, '2023-04-10 08:19:15.000000');

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура на таблица `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 37),
(2, 2, 38);

-- --------------------------------------------------------

--
-- Структура на таблица `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-04-02 13:13:55.996353', '1', '8-ми', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-04-02 13:14:02.129190', '2', '9-ти', 1, '[{\"added\": {}}]', 7, 1),
(3, '2023-04-02 13:14:08.615550', '3', '10-ти', 1, '[{\"added\": {}}]', 7, 1),
(4, '2023-04-02 13:14:13.285745', '4', '11-ти', 1, '[{\"added\": {}}]', 7, 1),
(5, '2023-04-02 13:14:15.814033', '5', '12-ти', 1, '[{\"added\": {}}]', 7, 1),
(6, '2023-04-02 13:15:53.290473', '1', 'Възобновяеми енергийни източници', 1, '[{\"added\": {}}]', 9, 1),
(7, '2023-04-02 13:16:10.226879', '2', 'Електрически превозни средства', 1, '[{\"added\": {}}]', 9, 1),
(8, '2023-04-02 13:16:39.563497', '3', 'Компютърна техника и технологии', 1, '[{\"added\": {}}]', 9, 1),
(9, '2023-04-02 13:16:49.678641', '4', 'Системно програмиране', 1, '[{\"added\": {}}]', 9, 1),
(10, '2023-04-02 13:17:01.312338', '5', 'Приложно програмиране', 1, '[{\"added\": {}}]', 9, 1),
(11, '2023-04-02 13:18:47.594764', '1', 'Обектно ориентирано програмиране', 1, '[{\"added\": {}}]', 8, 1),
(12, '2023-04-02 13:19:49.912179', '2', 'Компютърни мрежи', 1, '[{\"added\": {}}]', 8, 1),
(13, '2023-04-02 15:22:25.883606', '2', 'Компютърни мрежи', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(14, '2023-04-02 15:24:41.990607', '1', 'Обектно ориентирано програмиране', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(15, '2023-04-02 19:23:01.456535', '1', 'Обектно ориентирано програмиране', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(16, '2023-04-02 19:23:33.837403', '2', 'Компютърни мрежи', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(17, '2023-04-02 19:34:21.768955', '2', 'Компютърни мрежи', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(18, '2023-04-02 19:50:32.677236', '2', 'Компютърни мрежи', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(19, '2023-04-02 20:05:37.358617', '2', 'Компютърни мрежи', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(20, '2023-04-03 20:25:28.144056', '2', 'Компютърни мрежи', 2, '[{\"changed\": {\"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]', 8, 1),
(21, '2023-04-04 07:26:08.111747', '3', 'Въведение в ООП', 1, '[{\"added\": {}}]', 8, 1),
(22, '2023-04-08 13:52:22.107496', '1', 'Мрежови протоколи', 1, '[{\"added\": {}}]', 11, 1),
(23, '2023-04-08 13:52:57.968439', '2', 'TCP/IP', 1, '[{\"added\": {}}]', 11, 1),
(24, '2023-04-08 14:01:06.984156', '1', 'Въведение в мрежовите протоколи', 1, '[{\"added\": {}}]', 10, 1),
(25, '2023-04-08 14:04:57.243923', '1', 'Приложен файл към предмет', 1, '[{\"added\": {}}]', 13, 1),
(26, '2023-04-08 14:08:22.403378', '2', 'Приложен файл към тема', 1, '[{\"added\": {}}]', 13, 1),
(27, '2023-04-08 14:09:44.812068', '3', 'Приложен файл към  статия', 1, '[{\"added\": {}}]', 13, 1),
(28, '2023-04-08 14:10:40.406226', '1', 'Линк към външен сайт', 1, '[{\"added\": {}}]', 12, 1),
(29, '2023-04-09 08:36:26.966406', '1', 'Линк към външен сайт', 2, '[]', 12, 1),
(30, '2023-04-09 08:47:16.884646', '3', 'Приложен файл към  статия', 2, '[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]', 13, 1),
(31, '2023-04-09 08:49:23.004648', '1', 'Приложен файл към предмет', 2, '[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]', 13, 1),
(32, '2023-04-09 09:39:35.603351', '1', 'Въведение в мрежовите протоколи', 2, '[]', 10, 1),
(33, '2023-04-09 09:44:26.783800', '2', 'Съпоставяне на DoD и OSI', 1, '[{\"added\": {}}]', 10, 1),
(34, '2023-04-09 13:51:35.446965', '1', 'Въведение в мрежовите протоколи', 2, '[{\"changed\": {\"fields\": [\"\\u0421\\u044a\\u0434\\u044a\\u0440\\u0436\\u0430\\u043d\\u0438\\u0435(\\u0442\\u0435\\u043a\\u0441\\u0442)\"]}}]', 10, 1),
(35, '2023-04-10 08:19:15.920567', '2', 'teacher', 1, '[{\"added\": {}}]', 4, 1),
(36, '2023-04-10 08:20:38.131939', '2', 'teacher', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"User permissions\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'lib', 'article'),
(13, 'lib', 'attacment'),
(7, 'lib', 'klas'),
(12, 'lib', 'link'),
(9, 'lib', 'speciality'),
(8, 'lib', 'subject'),
(11, 'lib', 'theme'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура на таблица `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-04-02 11:56:41.532614'),
(2, 'auth', '0001_initial', '2023-04-02 11:56:41.935788'),
(3, 'admin', '0001_initial', '2023-04-02 11:56:42.030724'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-04-02 11:56:42.039722'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-02 11:56:42.048217'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-04-02 11:56:42.100969'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-04-02 11:56:42.143405'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-04-02 11:56:42.162409'),
(9, 'auth', '0004_alter_user_username_opts', '2023-04-02 11:56:42.171031'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-04-02 11:56:42.223862'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-04-02 11:56:42.226864'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-04-02 11:56:42.235054'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-04-02 11:56:42.252771'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-04-02 11:56:42.268857'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-04-02 11:56:42.285856'),
(16, 'auth', '0011_update_proxy_permissions', '2023-04-02 11:56:42.294863'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-04-02 11:56:42.312866'),
(18, 'sessions', '0001_initial', '2023-04-02 11:56:42.346911'),
(19, 'lib', '0001_initial', '2023-04-02 12:46:02.297282'),
(20, 'lib', '0002_subject_picture', '2023-04-02 15:21:05.404746'),
(21, 'lib', '0003_alter_subject_name', '2023-04-06 10:01:09.145981'),
(22, 'lib', '0004_article_alter_subject_name_theme_link_attacment_and_more', '2023-04-08 13:45:37.565661'),
(23, 'lib', '0005_alter_article_publish_date', '2023-04-08 13:54:39.760458'),
(24, 'lib', '0006_alter_article_publish_date', '2023-04-08 22:21:35.396897'),
(25, 'lib', '0007_alter_theme_номер', '2023-04-08 22:38:38.594745'),
(26, 'lib', '0008_remove_theme_номер_remove_theme_предемт_theme_order_and_more', '2023-04-08 23:09:07.136737'),
(27, 'lib', '0009_alter_link_link', '2023-04-09 08:35:53.373135'),
(28, 'lib', '0010_alter_attacment_attachment', '2023-04-09 08:45:21.147710'),
(29, 'lib', '0011_article_order', '2023-04-09 09:38:53.089155');

-- --------------------------------------------------------

--
-- Структура на таблица `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('4712flajhmin7hw6eye4vy0hgumxlneb', '.eJxVjDEOwjAMRe-SGUUOxE1gZOcMkWMbUkCJ1LQT4u5QqQOs_733XybRMpe0dJ3SKOZknNn9bpn4oXUFcqd6a5Zbnacx21WxG-320kSf5839OyjUy7dWFvADogZAhShe0KEXEueQY4TA4rJnuUbwQAzHzMMBAug-qwKweX8A5Es4Dw:1plnKs:MQ6PcGCI3pTR7r3Y0DTy3k9R_2HZTHtZfxtedWuQxI8', '2023-04-24 08:57:14.815183'),
('g9nfakj1axydr3xs19du2cm47219jz7e', '.eJxVjDEOwjAMRe-SGUUOxE1gZOcMkWMbUkCJ1LQT4u5QqQOs_733XybRMpe0dJ3SKOZknNn9bpn4oXUFcqd6a5Zbnacx21WxG-320kSf5839OyjUy7dWFvADogZAhShe0KEXEueQY4TA4rJnuUbwQAzHzMMBAug-qwKweX8A5Es4Dw:1plmgt:RW-Vt3Fi-fogftt4S8Dlacntb9q46VqkJpMDDE14MzA', '2023-04-24 08:15:55.046503'),
('ou3rcoe81z89zvrisv82h6calj7hc5gw', '.eJxVjDEOwjAMRe-SGUUOxE1gZOcMkWMbUkCJ1LQT4u5QqQOs_733XybRMpe0dJ3SKOZknNn9bpn4oXUFcqd6a5Zbnacx21WxG-320kSf5839OyjUy7dWFvADogZAhShe0KEXEueQY4TA4rJnuUbwQAzHzMMBAug-qwKweX8A5Es4Dw:1pixDG:rOOUqfesJMlOr-S_fA7awkLITPngcXM9NmNLO1EqslI', '2023-04-16 12:53:38.991795');

-- --------------------------------------------------------

--
-- Структура на таблица `lib_article`
--

DROP TABLE IF EXISTS `lib_article`;
CREATE TABLE `lib_article` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `annotation` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `publish_date` date NOT NULL,
  `author` varchar(60) NOT NULL,
  `theme_id_id` bigint(20) DEFAULT NULL,
  `order` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_article`
--

INSERT INTO `lib_article` (`id`, `title`, `picture`, `annotation`, `content`, `publish_date`, `author`, `theme_id_id`, `order`) VALUES
(1, 'Въведение в мрежовите протоколи', 'article_pics/circle.jpg', 'Понятие, примери, модели', '<p><strong>Мрежовите протоколи</strong>&nbsp;са набор от правила &mdash; логиката, по която мрежата работи.</p>\r\n\r\n<p><strong>Мрежовите услуги</strong>&nbsp;имат за задача изпълнението на специфични функции и управлението на конкретни задачи, като например тези за преобразуване на имена, назначаване на адреси и др. подобни.</p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10px\">Съществуват много видове компютърни протоколи. Всеки работи в различен слой на OSI модела. Когато става дума за компютърни мрежи, терминът &bdquo;протокол&quot; често се използва за означаване на мрежовите/транспортните протоколи &mdash; тези, които работят в слоевете 3 и 4 на OSI модела. За да могат свързаните в мрежа компютри да комуникират помежду си, те трябва да използват 1 един и същ протокол.</span></p>\r\n\r\n<p><strong>Протоколният стек (protocol stack)&nbsp;</strong>е група от два или повече протокола, работещи заедно, като всеки от тях оперира в различен слой на референтния OSI модел.</p>\r\n\r\n<p>Най-популярният протоколен стек, безспорно, е&nbsp;<strong>ТСP/IP&nbsp;</strong>(Transmission Control Protocol/Internet Protocol), но трябва да отбележим още&nbsp;<strong>NetBEUI</strong>&nbsp;(NetBIOS Extended User Interface) и&nbsp;<strong>IPX/SPX</strong>&nbsp;(Internet Packet Exchange/Sequenced Packet Exchange).</p>\r\n\r\n<p>Това са трите стандартни стека, поддържани от множество популярни операционни системи за PC-та. Всеки от тях си има предимства и недостатъци, като това зависи от самата локална мрежа.</p>', '2023-04-08', 'Георги Бориков', 1, 1),
(2, 'Съпоставяне на DoD и OSI', 'article_pics/TCPIP_arch.png', 'Съпоставяне на архитектурата на TCP/IP протоколите към моделите DoD и OSI', '<p>Архитектурата на комплекта протоколи TCP/IP отговаря на четирислойния мрежови модел DoD (известен още като модел DARPA), но всеки един от четирите му слоя може да бъде съпоставен на един и няколко от слоевете на референтния OSI модел. Това е илюстрирани на схемата по-долу.</p>', '2023-04-09', 'инж. Георги Бориков', 1, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_attacment`
--

DROP TABLE IF EXISTS `lib_attacment`;
CREATE TABLE `lib_attacment` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `article_id_id` bigint(20) DEFAULT NULL,
  `subject_id_id` bigint(20) DEFAULT NULL,
  `theme_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_attacment`
--

INSERT INTO `lib_attacment` (`id`, `title`, `attachment`, `article_id_id`, `subject_id_id`, `theme_id_id`) VALUES
(1, 'Приложен файл към предмет', 'attachments/4810201-networks_ed2mfpQ.docx', NULL, 2, NULL),
(2, 'Приложен файл към тема', 'attachments/section4_theme1.ppt', NULL, 2, 1),
(3, 'Приложен файл към  статия', 'attachments/i43_2_c6K9sNN.png', 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_klas`
--

DROP TABLE IF EXISTS `lib_klas`;
CREATE TABLE `lib_klas` (
  `id` bigint(20) NOT NULL,
  `class_num` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_klas`
--

INSERT INTO `lib_klas` (`id`, `class_num`) VALUES
(1, 8),
(2, 9),
(3, 10),
(4, 11),
(5, 12);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_link`
--

DROP TABLE IF EXISTS `lib_link`;
CREATE TABLE `lib_link` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `link` varchar(200) NOT NULL,
  `article_id_id` bigint(20) DEFAULT NULL,
  `subject_id_id` bigint(20) DEFAULT NULL,
  `theme_id_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_link`
--

INSERT INTO `lib_link` (`id`, `title`, `link`, `article_id_id`, `subject_id_id`, `theme_id_id`) VALUES
(1, 'Линк към външен сайт', 'https://django-ckeditor.readthedocs.io/en/latest/#installation', NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_speciality`
--

DROP TABLE IF EXISTS `lib_speciality`;
CREATE TABLE `lib_speciality` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_speciality`
--

INSERT INTO `lib_speciality` (`id`, `name`) VALUES
(1, 'Възобновяеми енергийни източници'),
(2, 'Електрически превозни средства'),
(3, 'Компютърна техника и технологии'),
(4, 'Системно програмиране'),
(5, 'Приложно програмиране');

-- --------------------------------------------------------

--
-- Структура на таблица `lib_subject`
--

DROP TABLE IF EXISTS `lib_subject`;
CREATE TABLE `lib_subject` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_subject`
--

INSERT INTO `lib_subject` (`id`, `name`, `picture`) VALUES
(1, 'Обектно ориентирано програмиране', 'subject_pics/image_PP.jpg'),
(2, 'Компютърни мрежи', 'subject_pics/pngegg.png'),
(3, 'Въведение в ООП', 'subject_pics/bg_1_2.png');

-- --------------------------------------------------------

--
-- Структура на таблица `lib_subject_class_for`
--

DROP TABLE IF EXISTS `lib_subject_class_for`;
CREATE TABLE `lib_subject_class_for` (
  `id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `klas_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_subject_class_for`
--

INSERT INTO `lib_subject_class_for` (`id`, `subject_id`, `klas_id`) VALUES
(1, 1, 5),
(2, 2, 5),
(3, 3, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_subject_subject_for`
--

DROP TABLE IF EXISTS `lib_subject_subject_for`;
CREATE TABLE `lib_subject_subject_for` (
  `id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `speciality_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_subject_subject_for`
--

INSERT INTO `lib_subject_subject_for` (`id`, `subject_id`, `speciality_id`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 2, 3),
(4, 3, 4),
(5, 3, 5);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_theme`
--

DROP TABLE IF EXISTS `lib_theme`;
CREATE TABLE `lib_theme` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `order` smallint(6) NOT NULL,
  `subject_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Схема на данните от таблица `lib_theme`
--

INSERT INTO `lib_theme` (`id`, `name`, `order`, `subject_id`) VALUES
(1, 'Мрежови протоколи', 1, 2),
(2, 'TCP/IP', 2, 2);

-- --------------------------------------------------------

--
-- Структура на таблица `lib_theme_item`
--

DROP TABLE IF EXISTS `lib_theme_item`;
CREATE TABLE `lib_theme_item` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `Номер` smallint(6) NOT NULL,
  `Предмет_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `lib_article`
--
ALTER TABLE `lib_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lib_article_theme_id_id_7fbc0e87_fk_lib_theme_id` (`theme_id_id`);

--
-- Indexes for table `lib_attacment`
--
ALTER TABLE `lib_attacment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lib_attacment_article_id_id_f0d77fc9_fk_lib_article_id` (`article_id_id`),
  ADD KEY `lib_attacment_subject_id_id_65da91b2_fk_lib_subject_id` (`subject_id_id`),
  ADD KEY `lib_attacment_theme_id_id_d95ca11f_fk_lib_theme_id` (`theme_id_id`);

--
-- Indexes for table `lib_klas`
--
ALTER TABLE `lib_klas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_link`
--
ALTER TABLE `lib_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lib_link_article_id_id_1b75b49b_fk_lib_article_id` (`article_id_id`),
  ADD KEY `lib_link_subject_id_id_bfd8e67d_fk_lib_subject_id` (`subject_id_id`),
  ADD KEY `lib_link_theme_id_id_cf72a1ab_fk_lib_theme_id` (`theme_id_id`);

--
-- Indexes for table `lib_speciality`
--
ALTER TABLE `lib_speciality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_subject`
--
ALTER TABLE `lib_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lib_subject_class_for`
--
ALTER TABLE `lib_subject_class_for`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lib_subject_class_for_subject_id_klas_id_4fde6272_uniq` (`subject_id`,`klas_id`),
  ADD KEY `lib_subject_class_for_klas_id_efe5ad39_fk_lib_klas_id` (`klas_id`);

--
-- Indexes for table `lib_subject_subject_for`
--
ALTER TABLE `lib_subject_subject_for`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lib_subject_subject_for_subject_id_speciality_id_6d222742_uniq` (`subject_id`,`speciality_id`),
  ADD KEY `lib_subject_subject__speciality_id_310ea1f6_fk_lib_speci` (`speciality_id`);

--
-- Indexes for table `lib_theme`
--
ALTER TABLE `lib_theme`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lib_theme_subject_id_3220fd60_fk_lib_subject_id` (`subject_id`);

--
-- Indexes for table `lib_theme_item`
--
ALTER TABLE `lib_theme_item`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `lib_article`
--
ALTER TABLE `lib_article`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lib_attacment`
--
ALTER TABLE `lib_attacment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lib_klas`
--
ALTER TABLE `lib_klas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lib_link`
--
ALTER TABLE `lib_link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lib_speciality`
--
ALTER TABLE `lib_speciality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lib_subject`
--
ALTER TABLE `lib_subject`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lib_subject_class_for`
--
ALTER TABLE `lib_subject_class_for`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lib_subject_subject_for`
--
ALTER TABLE `lib_subject_subject_for`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lib_theme`
--
ALTER TABLE `lib_theme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lib_theme_item`
--
ALTER TABLE `lib_theme_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Ограничения за дъмпнати таблици
--

--
-- Ограничения за таблица `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения за таблица `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения за таблица `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения за таблица `lib_attacment`
--
ALTER TABLE `lib_attacment`
  ADD CONSTRAINT `lib_attacment_article_id_id_f0d77fc9_fk_lib_article_id` FOREIGN KEY (`article_id_id`) REFERENCES `lib_article` (`id`),
  ADD CONSTRAINT `lib_attacment_subject_id_id_65da91b2_fk_lib_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `lib_subject` (`id`);

--
-- Ограничения за таблица `lib_link`
--
ALTER TABLE `lib_link`
  ADD CONSTRAINT `lib_link_article_id_id_1b75b49b_fk_lib_article_id` FOREIGN KEY (`article_id_id`) REFERENCES `lib_article` (`id`),
  ADD CONSTRAINT `lib_link_subject_id_id_bfd8e67d_fk_lib_subject_id` FOREIGN KEY (`subject_id_id`) REFERENCES `lib_subject` (`id`),
  ADD CONSTRAINT `lib_link_theme_id_id_cf72a1ab_fk_lib_theme_id` FOREIGN KEY (`theme_id_id`) REFERENCES `lib_theme` (`id`);

--
-- Ограничения за таблица `lib_subject_class_for`
--
ALTER TABLE `lib_subject_class_for`
  ADD CONSTRAINT `lib_subject_class_for_klas_id_efe5ad39_fk_lib_klas_id` FOREIGN KEY (`klas_id`) REFERENCES `lib_klas` (`id`),
  ADD CONSTRAINT `lib_subject_class_for_subject_id_892de46b_fk_lib_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `lib_subject` (`id`);

--
-- Ограничения за таблица `lib_subject_subject_for`
--
ALTER TABLE `lib_subject_subject_for`
  ADD CONSTRAINT `lib_subject_subject__speciality_id_310ea1f6_fk_lib_speci` FOREIGN KEY (`speciality_id`) REFERENCES `lib_speciality` (`id`),
  ADD CONSTRAINT `lib_subject_subject_for_subject_id_b8cae3ff_fk_lib_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `lib_subject` (`id`);

--
-- Ограничения за таблица `lib_theme`
--
ALTER TABLE `lib_theme`
  ADD CONSTRAINT `lib_theme_subject_id_3220fd60_fk_lib_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `lib_subject` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
