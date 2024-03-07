-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 10:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_lessons`
--

CREATE TABLE `tbl_lessons` (
  `lesson_id` varchar(50) NOT NULL DEFAULT uuid(),
  `title` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `video` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_lessons`
--

INSERT INTO `tbl_lessons` (`lesson_id`, `title`, `module_id`, `video`) VALUES
('8c447012-9807-11ee-be93-eca86b701755', 'Lesson 1', 'd02f3253-97f8-11ee-be93-eca86b701755', 'https://www.youtube.com/watch?v=r6tH55syq0o&pp=ygUIZmlyZXNoaXA='),
('ad3cb917-9803-11ee-be93-eca86b701755', 'Walalang', 'd02f3253-97f8-11ee-be93-eca86b701755', 'https://www.youtube.com/watch?v=CgruI1RjH_c&pp=ygUIZmlyZXNoaXA%3D');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `module_id` varchar(50) NOT NULL DEFAULT uuid(),
  `title` varchar(100) NOT NULL,
  `teacher_id` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_modules`
--

INSERT INTO `tbl_modules` (`module_id`, `title`, `teacher_id`, `created_at`) VALUES
('cabd420f-9806-11ee-be93-eca86b701755', 'Science', 'a60998d1-97ff-11ee-be93-eca86b701755', '2023-12-11 09:22:23'),
('d02f3253-97f8-11ee-be93-eca86b701755', 'Math', 'a60998d1-97ff-11ee-be93-eca86b701755', '2023-12-11 07:42:19');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quiz_item`
--

CREATE TABLE `tbl_quiz_item` (
  `quiz_item_id` varchar(50) NOT NULL DEFAULT uuid(),
  `question_image` varchar(200) NOT NULL,
  `correct_answer` varchar(100) NOT NULL,
  `lesson_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_quiz_item`
--

INSERT INTO `tbl_quiz_item` (`quiz_item_id`, `question_image`, `correct_answer`, `lesson_id`) VALUES
('d5c15ae1-9807-11ee-be93-eca86b701755', 'static\\images\\question_image-1702286991342.jpg', 'walalang', '8c447012-9807-11ee-be93-eca86b701755'),
('e69dc157-9805-11ee-be93-eca86b701755', 'static\\images\\question_image-1702286160501.jpg', 'Korikong', 'ad3cb917-9803-11ee-be93-eca86b701755');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` varchar(50) NOT NULL DEFAULT uuid(),
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('student','teacher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `created_at`, `role`) VALUES
('9f686410-97f2-11ee-99f1-18c04db48463', 'Pedro', 'Hagawhaw', 'pedro.5@gmail.com', '$2b$10$wN0M3u9kRiX9UHv8xU3AGOglInQrkkHGYQIWeA9Z2jYl5eMSbhfHO', '2023-12-11 06:58:00', 'student'),
('a60998d1-97ff-11ee-be93-eca86b701755', 'Pedro', 'Duka', 'duka.5@gmail.com', '$2b$10$olQnB1aBpPB6DM0Dg3edP.Otjp7maSjjWdw0rljX0cOCUTP8NrdHy', '2023-12-11 08:31:15', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_lessons`
--
ALTER TABLE `tbl_lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `tbl_quiz_item`
--
ALTER TABLE `tbl_quiz_item`
  ADD PRIMARY KEY (`quiz_item_id`),
  ADD KEY `lesson_id` (`lesson_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_lessons`
--
ALTER TABLE `tbl_lessons`
  ADD CONSTRAINT `tbl_lessons_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `tbl_modules` (`module_id`);

--
-- Constraints for table `tbl_quiz_item`
--
ALTER TABLE `tbl_quiz_item`
  ADD CONSTRAINT `tbl_quiz_item_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `tbl_lessons` (`lesson_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
