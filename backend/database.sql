CREATE DATABASE IF NOT EXISTS `zaliczenie` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `zaliczenie`;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` longblob NOT NULL,
  `rating` decimal(10,0) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `favourite_courses`;
CREATE TABLE `favourite_courses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `followed_users`;
CREATE TABLE `followed_users` (
  `id` int(11) NOT NULL,
  `followed_user_id` int(11) NOT NULL,
  `follower_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `logs_history`;
CREATE TABLE `logs_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `logged_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `action` enum('U','I') NOT NULL DEFAULT 'I'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `card_num` varchar(30) NOT NULL,
  `card_cvv` varchar(5) NOT NULL,
  `card_owner` varchar(100) NOT NULL,
  `card_term` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `starts` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(70) NOT NULL,
  `location_id` int(11) NOT NULL,
  `role` enum('S','T') NOT NULL DEFAULT 'S'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `user_courses`;
CREATE TABLE `user_courses` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

ALTER TABLE `favourite_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

ALTER TABLE `followed_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followed_user_id` (`followed_user_id`),
  ADD KEY `follower_user_id` (`follower_user_id`);

ALTER TABLE `logs_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cours_id` (`cours_id`);

ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_id` (`cours_id`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `location_id` (`location_id`);

ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cours_id` (`cours_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payment_id` (`payment_id`);

-- Alters

ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `favourite_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `followed_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `logs_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `user_courses` ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE `user_courses` ADD FOREIGN KEY (courses_id) REFERENCES courses(id);
ALTER TABLE `user_courses` ADD FOREIGN KEY (payments_id) REFERENCES payments(id);

ALTER TABLE `courses` ADD FOREIGN KEY (teacher_id) REFERENCES users(id);

ALTER TABLE `ratings` ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE `ratings` ADD FOREIGN KEY (cours_id) REFERENCES courses(id);

ALTER TABLE `comments` ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE `comments` ADD FOREIGN KEY (cours_id) REFERENCES courses(id);

ALTER TABLE `payments` ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE `payments` ADD FOREIGN KEY (cours_id) REFERENCES courses(id);

ALTER TABLE `notifications` ADD FOREIGN KEY (cours_id) REFERENCES courses(id);
ALTER TABLE `notifications` ADD FOREIGN KEY (user_id) REFERENCES users(id);

ALTER TABLE `followed_users` ADD FOREIGN KEY (followed_user_id) REFERENCES users(id);
ALTER TABLE `followed_users` ADD FOREIGN KEY (follower_user_id) REFERENCES users(id);

ALTER TABLE `logs_history` ADD FOREIGN KEY (user_id) REFERENCES users(id);
