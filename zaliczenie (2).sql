-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Wrz 2021, 13:04
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zaliczenie`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(250) NOT NULL,
  `rating` decimal(10,0) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `courses`
--

INSERT INTO `courses` (`id`, `name`, `description`, `price`, `image`, `rating`, `teacher_id`, `created_at`, `updated_at`) VALUES
(12, 'Sit rerum perspiciatis deleniti culpa necessitatibus officia consequatur aut sunt.', 'Est qui sed quia illum et.', '920.00', 'http://placeimg.com/640/480/cats', '5', 18, '2021-09-16 18:38:19', '2021-09-16 18:38:19'),
(42, 'Ipsam dolores asperiores eveniet quaerat qui aliquid velit id.', 'rerum sit excepturi', '936.00', 'http://placeimg.com/640/480/cats', '3', 12, '2021-09-18 14:14:30', '2021-09-18 14:14:30'),
(43, 'Rerum iusto non vel enim qui velit.', 'Aperiam ut veniam. Eligendi et cupiditate molestiae. Suscipit iure rerum quam cupiditate doloremque ex ratione. Labore adipisci tempore magnam ipsum odit sed est qui. Earum aut hic ut nobis nisi magni atque. Aliquam officiis dolorem accusamus molestiae fuga quos explicabo voluptas.', '588.00', 'http://placeimg.com/640/480/cats', '0', 18, '2021-09-18 14:14:30', '2021-09-18 14:14:30'),
(44, 'Sint aut accusantium est cum eveniet natus.', 'Dignissimos consequatur iusto suscipit ipsa illo aut.\nUnde commodi nobis magni.', '730.00', 'http://placeimg.com/640/480/cats', '0', 12, '2021-09-18 14:14:30', '2021-09-18 14:14:30'),
(45, 'Minus laborum beatae voluptatem et natus saepe quia.', 'Alias quaerat et ipsa asperiores placeat enim. At deserunt est odit vel aspernatur et id similique earum. Sunt qui aspernatur aspernatur deserunt.', '616.00', 'http://placeimg.com/640/480/cats', '0', 15, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(46, 'Ab temporibus ut eveniet enim sit fuga sit quam.', 'nihil consectetur totam', '588.00', 'http://placeimg.com/640/480/cats', '4', 18, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(47, 'Id voluptas ipsa enim at sit expedita dolorem.', 'Eos culpa quisquam non architecto quas et ad nostrum error. Sint commodi temporibus dolorum eum delectus. Placeat enim delectus. Tempora nemo autem at est repellat dolor ipsa. Officia voluptas doloremque sapiente fugiat rerum esse et.\n \rSint esse exercitationem. Quisquam quidem dignissimos voluptates temporibus pariatur. Rerum nam est aliquam eius eum qui id. Id porro autem. Aliquid minus est dolore dolor at molestiae perspiciatis unde. Quia quis laboriosam est.\n \rConsequatur quidem aspernatur aut. Vel impedit et aut ut qui. Nostrum consequuntur magnam et consequuntur ad eos aperiam. Sequi minus enim est provident. Ab dolores nisi blanditiis ut.', '805.00', 'http://placeimg.com/640/480/cats', '0', 18, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(48, 'Labore odit quibusdam et alias.', 'Perspiciatis suscipit et similique ipsam cumque sequi sit incidunt. Eaque optio nulla ullam. Sed ut eum quibusdam corporis cumque officia eius. Autem saepe est aut eum. Enim nihil dignissimos vitae ipsam perferendis.', '260.00', 'http://placeimg.com/640/480/cats', '0', 12, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(49, 'Molestiae aut sed quo hic harum.', 'Aut officiis sit qui unde vero aut voluptates. Placeat sit et qui voluptates sequi soluta. Aut nostrum aut corporis rerum totam repellendus omnis qui distinctio.\n \rAd ipsa consequatur maiores illo suscipit autem et. Repellat enim distinctio voluptate nihil itaque quia. Qui animi suscipit. Reiciendis error error repellendus distinctio et eum enim. Accusamus similique maiores autem incidunt quia.\n \rSit odio vero neque quo. Quas ut saepe iusto nulla cupiditate sequi laborum aut. Quasi quos totam aliquid ipsa blanditiis quia illo tenetur doloribus. Et unde et distinctio et quis consequatur eaque delectus. Explicabo et quis ea neque quod nihil reprehenderit.', '967.00', 'http://placeimg.com/640/480/cats', '0', 15, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(50, 'Dicta odit eos quo corrupti est placeat sequi.', 'Minus vel sed ut at.', '559.00', 'http://placeimg.com/640/480/cats', '0', 18, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(51, 'Iste et et.', 'Illo alias dignissimos laboriosam esse doloribus. Ullam in facere. Qui et voluptas omnis illum blanditiis sunt. Architecto officiis est voluptas.\n \rDolores temporibus deserunt nobis sit aut et. Nam aut nostrum beatae nobis neque consequatur aut. Ut est quia et molestiae asperiores velit et velit.\n \rAut et incidunt dolor. Unde ipsam debitis eius tenetur accusamus suscipit sint. Voluptatibus mollitia alias.', '8.00', 'http://placeimg.com/640/480/cats', '0', 15, '2021-09-18 14:14:31', '2021-09-18 14:14:31'),
(52, 'Dobry kurs', 'Kursiwo', '345.00', 'http://placeimg.com/640/480/cats', '0', 21, '2021-09-24 11:03:10', '2021-09-24 11:03:10'),
(53, 'Dobry kurs', 'Kursiwo', '345.00', 'http://placeimg.com/640/480/cats', '0', 21, '2021-09-24 11:03:15', '2021-09-24 11:03:15');

--
-- Wyzwalacze `courses`
--
DELIMITER $$
CREATE TRIGGER `generateNotificationOnInsert` AFTER INSERT ON `courses` FOR EACH ROW INSERT INTO `notifications` (user_id, cours_id, action, notification_for, readed)
SELECT 
NEW.teacher_id AS user_id, 
NEW.id AS cours_id, 
'I' AS action, 
fu.follower_user_id AS notification_for, 
false AS readed
FROM `followed_users` AS fu 
WHERE fu.followed_user_id = NEW.teacher_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `favourite_courses`
--

CREATE TABLE `favourite_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `followed_users`
--

CREATE TABLE `followed_users` (
  `id` int(11) NOT NULL,
  `followed_user_id` int(11) NOT NULL,
  `follower_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `followed_users`
--

INSERT INTO `followed_users` (`id`, `followed_user_id`, `follower_user_id`) VALUES
(1, 12, 13),
(2, 12, 14),
(3, 21, 13);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `street` varchar(150) NOT NULL,
  `city` varchar(150) NOT NULL,
  `country` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `location`
--

INSERT INTO `location` (`id`, `street`, `city`, `country`) VALUES
(2, 'Leonardo Villages', 'Jodieborough', 'Mayotte'),
(3, 'Hailee Cape', 'Blandafort', 'Guinea-Bissau'),
(4, 'Albertha Plaza', 'West Mozellmouth', 'United Kingdom'),
(5, 'Willow Green', 'West Hartford', 'Botswana'),
(6, 'Flatley Plains', 'Lake Louville', 'Burundi'),
(7, 'Alvis Shores', 'North Malindaland', 'Morocco'),
(8, 'Corrine Summit', 'Ellicott City', 'Uzbekistan'),
(9, 'Heller Meadows', 'Medastad', 'Hungary'),
(10, 'Roob Port', 'Buckridgeside', 'Georgia'),
(11, 'Jadon Islands', 'Charleston', 'Liechtenstein'),
(12, 'Labadie Valleys', 'East Murlside', 'Malaysia'),
(13, 'Ruecker Camp', 'Kristopherville', 'Cayman Islands'),
(14, 'Hamill Mountains', 'Bryonville', 'Fiji'),
(15, 'Noelia Parkway', 'South Averyville', 'Denmark'),
(16, 'Oberbrunner Land', 'Ankundinghaven', 'Turkey'),
(17, 'Nadia Route', 'Mooreborough', 'French Guiana'),
(18, 'Flo Ranch', 'South Georgiana', 'Poland'),
(19, 'Nola Lake', 'Eduardoberg', 'Guam'),
(20, 'Lulu Plain', 'Port Isai', 'Martinique'),
(21, 'Erdman Flats', 'Evastad', 'Somalia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `logs_history`
--

CREATE TABLE `logs_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logged_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `action` enum('U','I') NOT NULL DEFAULT 'I',
  `notification_for` int(11) NOT NULL,
  `readed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `cours_id`, `action`, `notification_for`, `readed`, `created_at`) VALUES
(48, 12, 42, 'I', 13, 1, '2021-09-19 11:06:11'),
(49, 12, 42, 'I', 14, 0, '2021-09-19 11:06:11'),
(51, 12, 44, 'I', 13, 0, '2021-09-19 11:06:11'),
(52, 12, 44, 'I', 14, 0, '2021-09-19 11:06:11'),
(54, 12, 48, 'I', 13, 0, '2021-09-17 11:06:11'),
(55, 12, 48, 'I', 14, 0, '2021-09-19 11:06:11'),
(56, 21, 52, 'I', 13, 0, '2021-09-24 11:03:10'),
(57, 21, 53, 'I', 13, 0, '2021-09-24 11:03:15');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `card_num` varchar(30) NOT NULL,
  `card_cvv` varchar(5) NOT NULL,
  `card_owner` varchar(100) NOT NULL,
  `card_term` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `cours_id`, `price`, `card_num`, `card_cvv`, `card_owner`, `card_term`, `created_at`) VALUES
(2, 13, 12, '921.00', '23984179412987', '366', 'Shirley Adams', '09/2025', '2021-09-19 13:59:56'),
(3, 14, 47, '921.00', '23984179412987', '366', 'Tester', '09/2025', '2021-07-14 14:02:45'),
(4, 14, 42, '920.00', '23984179412987', '366', 'test', '09/2025', '2021-08-19 14:04:21'),
(5, 20, 44, '450.00', '123213132', '554', 'Adam Tester', '04/2021', '2021-09-19 14:05:24'),
(6, 13, 46, '588.00', '645645645645546', 'undef', 'Adam Nowicki', '03/2025', '2021-08-19 09:02:20'),
(7, 13, 42, '936.00', '092384091890750', 'undef', 'Adam Krysiak', '25/2001', '2021-09-24 09:57:23');

--
-- Wyzwalacze `payments`
--
DELIMITER $$
CREATE TRIGGER `addUserCours` AFTER INSERT ON `payments` FOR EACH ROW INSERT INTO user_courses
(cours_id, user_id, payment_id)
VALUES (
	NEW.cours_id,
    NEW.user_id,
    NEW.id
)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `starts` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `ratings`
--

INSERT INTO `ratings` (`id`, `cours_id`, `user_id`, `starts`, `created_at`) VALUES
(1, 12, 13, '5', '2021-09-17 09:06:29'),
(7, 46, 13, '5', '2021-09-24 09:48:59'),
(10, 42, 13, '3', '2021-09-24 10:01:42');

--
-- Wyzwalacze `ratings`
--
DELIMITER $$
CREATE TRIGGER `updateCoursRating` AFTER INSERT ON `ratings` FOR EACH ROW UPDATE courses
INNER JOIN ratings ON ratings.cours_id = courses.id
SET courses.rating = (SELECT ROUND(AVG(ratings.starts), 1) as stars FROM `ratings` WHERE ratings.cours_id = NEW.cours_id)
WHERE courses.id = NEW.cours_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(70) NOT NULL,
  `password` varchar(250) NOT NULL,
  `location_id` int(11) NOT NULL,
  `role` enum('S','T') NOT NULL DEFAULT 'S',
  `avatar` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `password`, `location_id`, `role`, `avatar`) VALUES
(12, 'Katherine Luettgen', '1-397-637-9368', 'Dave_Walsh69@gmail.com', '6z4dpVfcL8FJXZE', 1, 'T', 'https://cdn.fakercloud.com/avatars/codepoet_ru_128.jpg'),
(13, 'Shirley Powlowski', '344-490-3579', 'Erica_Bosco@gmail.com', '2DKO5sBdyJE7TZ8', 2, 'S', 'https://cdn.fakercloud.com/avatars/traneblow_128.jpg'),
(14, 'Chad Sanford', '1-939-862-2218', 'Ulices.Wunsch99@gmail.com', 'fN3K2hJdLOzlJFM', 3, 'S', 'https://cdn.fakercloud.com/avatars/leonfedotov_128.jpg'),
(15, 'Richard Carroll', '485.399.6740 x5', 'Leland.Tillman@hotmail.com', 'u6B5Rw39FZX0B9m', 4, 'T', 'https://cdn.fakercloud.com/avatars/sangdth_128.jpg'),
(16, 'Brent Macejkovic', '(259) 797-0644 ', 'Veronica_Grady44@gmail.com', 'V1IYeVVVRA2UFdd', 5, 'S', 'https://cdn.fakercloud.com/avatars/ryhanhassan_128.jpg'),
(17, 'Beatrice McCullough', '(658) 988-3221 ', 'Leonor.Hoeger24@gmail.com', 'p9gw6_Vh09ZNpnh', 6, 'S', 'https://cdn.fakercloud.com/avatars/coderdiaz_128.jpg'),
(18, 'Vivian Smith', '1-837-352-5091', 'Zack93@gmail.com', 'HaQxuhG2EVres9W', 7, 'T', 'https://cdn.fakercloud.com/avatars/bistrianiosip_128.jpg'),
(19, 'Wade Bernhard', '668.463.1287', 'Aurelio_Howell93@yahoo.com', 'O6bJst7ml1QgBAl', 8, 'S', 'https://cdn.fakercloud.com/avatars/bublienko_128.jpg'),
(20, 'Eula Breitenberg', '(673) 280-0497 ', 'Emmie_Stehr@gmail.com', 'LW8KVMYbUBQjiyv', 9, 'S', 'https://cdn.fakercloud.com/avatars/nckjrvs_128.jpg'),
(21, 'Herman Padberg', '1-747-411-9511', 'Jacey_Langosh74@gmail.com', 'THgH2kbI0Z9Mnwh', 10, 'T', 'https://cdn.fakercloud.com/avatars/AlbertoCococi_128.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_courses`
--

CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `user_courses`
--

INSERT INTO `user_courses` (`id`, `cours_id`, `user_id`, `payment_id`) VALUES
(1, 12, 13, 2),
(2, 47, 14, 3),
(3, 42, 14, 4),
(4, 44, 20, 5),
(5, 46, 13, 6),
(6, 42, 13, 7);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- Indeksy dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- Indeksy dla tabeli `favourite_courses`
--
ALTER TABLE `favourite_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- Indeksy dla tabeli `followed_users`
--
ALTER TABLE `followed_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followed_user_id` (`followed_user_id`),
  ADD KEY `follower_user_id` (`follower_user_id`);

--
-- Indeksy dla tabeli `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `logs_history`
--
ALTER TABLE `logs_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- Indeksy dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

--
-- Indeksy dla tabeli `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_id` (`cours_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indeksy dla tabeli `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_id` (`cours_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT dla tabeli `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT dla tabeli `favourite_courses`
--
ALTER TABLE `favourite_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `followed_users`
--
ALTER TABLE `followed_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `logs_history`
--
ALTER TABLE `logs_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT dla tabeli `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT dla tabeli `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `courses` (`id`);

--
-- Ograniczenia dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `followed_users`
--
ALTER TABLE `followed_users`
  ADD CONSTRAINT `followed_users_ibfk_1` FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `followed_users_ibfk_2` FOREIGN KEY (`follower_user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `logs_history`
--
ALTER TABLE `logs_history`
  ADD CONSTRAINT `logs_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`cours_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `courses` (`id`);

--
-- Ograniczenia dla tabeli `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`cours_id`) REFERENCES `courses` (`id`);

--
-- Ograniczenia dla tabeli `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_courses_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_courses_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_courses_ibfk_4` FOREIGN KEY (`cours_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `user_courses_ibfk_5` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
