-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 23 2021 г., 12:14
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ms`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`id`, `user_id`) VALUES
(1, 1),
(2, 4),
(3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `basket_item`
--

CREATE TABLE `basket_item` (
  `id` int(11) NOT NULL,
  `basket_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `prior` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `category_group`
--

CREATE TABLE `category_group` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_group`
--

INSERT INTO `category_group` (`id`, `title`) VALUES
(1, 'Жанр'),
(2, 'Топ 100'),
(3, 'Авторы'),
(4, 'Часто покупаемые'),
(5, 'Год издания');

-- --------------------------------------------------------

--
-- Структура таблицы `category_product`
--

CREATE TABLE `category_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `username` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `avatar` varchar(256) NOT NULL,
  `comment` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `delivery`
--

CREATE TABLE `delivery` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `phone` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `status` smallint(6) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_item`
--

CREATE TABLE `order_item` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `picture` varchar(127) DEFAULT NULL,
  `preview` varchar(511) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_access`
--

CREATE TABLE `rbac_access` (
  `role` varchar(128) NOT NULL,
  `permission` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbac_access`
--

INSERT INTO `rbac_access` (`role`, `permission`) VALUES
('ROLE_SUPERADMIN', 'ACCESS_SAVE'),
('ROLE_SUPERADMIN', 'ACCESS_UPDATE'),
('ROLE_SUPERADMIN', 'CATEGORY_CREATE'),
('ROLE_SUPERADMIN', 'CATEGORY_LIST'),
('ROLE_SUPERADMIN', 'CATEGORY_SAVE'),
('ROLE_SUPERADMIN', 'DELIVERY_CREATE'),
('ROLE_SUPERADMIN', 'DELIVERY_DELETE'),
('ROLE_SUPERADMIN', 'DELIVERY_READ'),
('ROLE_SUPERADMIN', 'DELIVERY_UPDATE'),
('ROLE_SUPERADMIN', 'LIST_ORDER'),
('ROLE_SUPERADMIN', 'NEWS_CREATE'),
('ROLE_SUPERADMIN', 'ORDER_CREATE'),
('ROLE_SUPERADMIN', 'ORDER_LIST'),
('ROLE_SUPERADMIN', 'ORDER_SAVE'),
('ROLE_SUPERADMIN', 'PAYMENT_CREATE'),
('ROLE_SUPERADMIN', 'PAYMENT_DELETE'),
('ROLE_SUPERADMIN', 'PAYMENT_READ'),
('ROLE_SUPERADMIN', 'PAYMENT_UPDATE'),
('ROLE_SUPERADMIN', 'PERMISSION_CREATE'),
('ROLE_SUPERADMIN', 'PERMISSION_DELETE'),
('ROLE_SUPERADMIN', 'PERMISSION_READ'),
('ROLE_SUPERADMIN', 'PERMISSION_SAVE'),
('ROLE_SUPERADMIN', 'PRODUCT_CREATE'),
('ROLE_SUPERADMIN', 'PRODUCT_DELETE'),
('ROLE_SUPERADMIN', 'PRODUCT_READ'),
('ROLE_SUPERADMIN', 'PRODUCT_SAVE'),
('ROLE_SUPERADMIN', 'PRODUCT_UPDATE'),
('ROLE_SUPERADMIN', 'SHOP_CREATE'),
('ROLE_SUPERADMIN', 'SHOP_DELETE'),
('ROLE_SUPERADMIN', 'SHOP_READ'),
('ROLE_SUPERADMIN', 'SHOP_UPDATE'),
('ROLE_ADMIN', 'DELIVERY_CREATE'),
('ROLE_ADMIN', 'DELIVERY_DELETE'),
('ROLE_ADMIN', 'DELIVERY_READ'),
('ROLE_ADMIN', 'DELIVERY_UPDATE'),
('ROLE_ADMIN', 'PAYMENT_CREATE'),
('ROLE_ADMIN', 'PAYMENT_DELETE'),
('ROLE_ADMIN', 'PAYMENT_READ'),
('ROLE_ADMIN', 'PAYMENT_UPDATE'),
('ROLE_ADMIN', 'PRODUCT_CREATE'),
('ROLE_ADMIN', 'PRODUCT_DELETE'),
('ROLE_ADMIN', 'PRODUCT_READ'),
('ROLE_ADMIN', 'PRODUCT_UPDATE'),
('ROLE_ADMIN', 'SHOP_CREATE'),
('ROLE_ADMIN', 'SHOP_DELETE'),
('ROLE_ADMIN', 'SHOP_READ'),
('ROLE_ADMIN', 'SHOP_UPDATE'),
('ROLE_MANAGER', 'DELIVERY_READ'),
('ROLE_MANAGER', 'PAYMENT_READ'),
('ROLE_MANAGER', 'PRODUCT_READ'),
('ROLE_MANAGER', 'SHOP_READ');

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_permission`
--

CREATE TABLE `rbac_permission` (
  `permission` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbac_permission`
--

INSERT INTO `rbac_permission` (`permission`) VALUES
('ACCESS_SAVE'),
('ACCESS_UPDATE'),
('CATEGORY_CREATE'),
('CATEGORY_LIST'),
('CATEGORY_SAVE'),
('DELIVERY_CREATE'),
('DELIVERY_DELETE'),
('DELIVERY_READ'),
('DELIVERY_UPDATE'),
('LIST_ORDER'),
('NEWS_CREATE'),
('ORDER_CREATE'),
('ORDER_LIST'),
('ORDER_SAVE'),
('PAYMENT_CREATE'),
('PAYMENT_DELETE'),
('PAYMENT_READ'),
('PAYMENT_UPDATE'),
('PERMISSION_CREATE'),
('PERMISSION_DELETE'),
('PERMISSION_READ'),
('PERMISSION_SAVE'),
('PRODUCT_CREATE'),
('PRODUCT_DELETE'),
('PRODUCT_READ'),
('PRODUCT_SAVE'),
('PRODUCT_UPDATE'),
('SHOP_CREATE'),
('SHOP_DELETE'),
('SHOP_READ'),
('SHOP_UPDATE');

-- --------------------------------------------------------

--
-- Структура таблицы `rbac_role`
--

CREATE TABLE `rbac_role` (
  `role` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `rbac_role`
--

INSERT INTO `rbac_role` (`role`) VALUES
('ROLE_ADMIN'),
('ROLE_MANAGER'),
('ROLE_PRODUCT_ADMIN'),
('ROLE_SHOP_ADMIN'),
('ROLE_SHOP_MANAGER'),
('ROLE_SUPERADMIN');

-- --------------------------------------------------------

--
-- Структура таблицы `shops`
--

CREATE TABLE `shops` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `roles` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `password`, `roles`) VALUES
(1, 'mahmadullo', '+992907983474', 'mahmadullo.1111@gmail.com', '', '[\"ROLE_SUPERADMIN\"]');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `basket_item`
--
ALTER TABLE `basket_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `category_group`
--
ALTER TABLE `category_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rbac_permission`
--
ALTER TABLE `rbac_permission`
  ADD UNIQUE KEY `permission` (`permission`);

--
-- Индексы таблицы `rbac_role`
--
ALTER TABLE `rbac_role`
  ADD UNIQUE KEY `role` (`role`);

--
-- Индексы таблицы `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `basket_item`
--
ALTER TABLE `basket_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `category_group`
--
ALTER TABLE `category_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `delivery`
--
ALTER TABLE `delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `shops`
--
ALTER TABLE `shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
