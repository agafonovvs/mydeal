-- создание базы данных
CREATE DATABASE `mydeal`; 

-- Создание таблицы Проекты
CREATE TABLE `mydeal`.`projects` ( 
    `id` INT NOT NULL AUTO_INCREMENT, 
    `projectName` VARCHAR(30) NOT NULL, 
    `userId` INT NOT NULL, 
    PRIMARY KEY (`id`)
);

-- создание таблицы Задачи
CREATE TABLE `mydeal`.`tasks` ( 
    `id` INT NOT NULL AUTO_INCREMENT, 
    `taskName` VARCHAR(30) NOT NULL, 
    `taskDatetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    `status` INT NOT NULL, 
    `file` VARCHAR(100) NOT NULL,
    `deadline` DATE NOT NULL, 
    `userId` INT NOT NULL, 
    `projectId` INT NOT NULL, 
    PRIMARY KEY (`id`)
);

-- создание таблицы пользователь
CREATE TABLE `mydeal`.`users` ( 
    `id` INT NOT NULL AUTO_INCREMENT, 
    `name` VARCHAR(30) NOT NULL, 
    `password` VARCHAR(100) NOT NULL, 
    `email` VARCHAR(30) NOT NULL, 
    `userDatetime` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    PRIMARY KEY (`id`)
);

-- добавление уникального индекса имени проекта
ALTER TABLE `projects` ADD UNIQUE( `projectName`);

-- добавление уникального индекса имени пользователя, паролю пользователя и почте пользователя
ALTER TABLE `users` ADD UNIQUE( `name`, `password`, `email`);

-- добавление индекса для поиска по имени проекта
ALTER TABLE `projects` ADD INDEX( `projectName`);

-- добавление индекса для поиска по имени Задачи
ALTER TABLE `tasks` ADD INDEX( `taskName`);

-- добавление индекса для поиска по имени пользователя
ALTER TABLE `users` ADD INDEX( `name`);

