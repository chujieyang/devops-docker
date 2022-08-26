DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;
CREATE TABLE `student_scores` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) NOT NULL,
    `age` tinyint NOT NULL,
    `score` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `index1` (`name`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
INSERT INTO `student_scores` (`name`, `age`, `score`)
VALUES ('John', 13, 70),
    ('Tom', 12, 90);