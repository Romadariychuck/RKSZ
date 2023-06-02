-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Чрв 02 2023 р., 11:26
-- Версія сервера: 8.0.30
-- Версія PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `Library`
--

-- --------------------------------------------------------

--
-- Структура таблиці `Books`
--

CREATE TABLE `Books` (
  `books_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `publication_date` date NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп даних таблиці `Books`
--

INSERT INTO `Books` (`books_id`, `title`, `publication_date`, `genre_id`) VALUES
(1, 'Великий Гестбі', '1925-06-04', 3),
(2, 'Собака Баскервілів', '1902-07-17', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `Checkouts`
--

CREATE TABLE `Checkouts` (
  `checkout_id` int NOT NULL,
  `book_id` int NOT NULL,
  `user_id` int NOT NULL,
  `checkout_date` date NOT NULL,
  `return_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп даних таблиці `Checkouts`
--

INSERT INTO `Checkouts` (`checkout_id`, `book_id`, `user_id`, `checkout_date`, `return_date`) VALUES
(1, 1, 1, '2023-03-14', '2023-05-14');

-- --------------------------------------------------------

--
-- Структура таблиці `Genres`
--

CREATE TABLE `Genres` (
  `genre_id` int NOT NULL,
  `genre_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп даних таблиці `Genres`
--

INSERT INTO `Genres` (`genre_id`, `genre_name`) VALUES
(1, 'Фантастика'),
(2, 'Детектив'),
(3, 'Роман'),
(4, 'Автобіографія'),
(5, 'Психологія'),
(6, 'Бізнес-література'),
(7, 'Поезія'),
(8, 'Лірика');

-- --------------------------------------------------------

--
-- Структура таблиці `Users`
--

CREATE TABLE `Users` (
  `users_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп даних таблиці `Users`
--

INSERT INTO `Users` (`users_id`, `name`, `email`, `address`) VALUES
(1, 'Ігор', 'igor@gmail.com', 'вул. Білгородська 43/A'),
(2, 'Микола', 'nikalya@gmail.com', 'вул. Конотопська 12/3');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`books_id`),
  ADD KEY `books_ibfk_1` (`genre_id`);

--
-- Індекси таблиці `Checkouts`
--
ALTER TABLE `Checkouts`
  ADD PRIMARY KEY (`checkout_id`),
  ADD KEY `checkouts_ibfk_1` (`book_id`),
  ADD KEY `checkouts_ibfk_2` (`user_id`);

--
-- Індекси таблиці `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`genre_id`);

--
-- Індекси таблиці `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `Books`
--
ALTER TABLE `Books`
  MODIFY `books_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `Checkouts`
--
ALTER TABLE `Checkouts`
  MODIFY `checkout_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `Genres`
--
ALTER TABLE `Genres`
  MODIFY `genre_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблиці `Users`
--
ALTER TABLE `Users`
  MODIFY `users_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `Books`
--
ALTER TABLE `Books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `Genres` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `Checkouts`
--
ALTER TABLE `Checkouts`
  ADD CONSTRAINT `checkouts_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`books_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `checkouts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `Users` (`users_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
