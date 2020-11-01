-- создние связи между задачами и проектом
ALTER TABLE `tasks` ADD FOREIGN KEY (`projectId`) REFERENCES `projects`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- создание связи между задачами и пользователем
ALTER TABLE `tasks` ADD FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- создание связи между проектом и пользователем
ALTER TABLE `projects` ADD FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- добавление пользователей
INSERT INTO `users` (`id`, `name`, `password`, `email`, `userDatetime`) VALUES (NULL, 'Константин', MD5('qwerty'), 'konstantin@mail.com', CURRENT_TIMESTAMP);
INSERT INTO `users` (`id`, `name`, `password`, `email`, `userDatetime`) VALUES (NULL, 'Иван', MD5('ytrewq'), 'ivan@mail.com', CURRENT_TIMESTAMP);

-- добавление проектов
INSERT INTO `projects` (`id`, `projectName`, `userId`) VALUES (NULL, 'Входящие', '1');
INSERT INTO `projects` (`id`, `projectName`, `userId`) VALUES (NULL, 'Учеба', '1');
INSERT INTO `projects` (`id`, `projectName`, `userId`) VALUES (NULL, 'Работа', '1');
INSERT INTO `projects` (`id`, `projectName`, `userId`) VALUES (NULL, 'Домашние дела', '2');
INSERT INTO `projects` (`id`, `projectName`, `userId`) VALUES (NULL, 'Авто', '2');

-- добавление задач
INSERT INTO `tasks` (`id`, `taskName`, `taskDatetime`, `status`, `file`, `deadline`, `userId`, `projectId`) VALUES (NULL, 'Собеседование в IT компании', CURRENT_TIMESTAMP, '0', '', '2020-11-08', '1', '3');
INSERT INTO `tasks` (`id`, `taskName`, `taskDatetime`, `status`, `file`, `deadline`, `userId`, `projectId`) VALUES (NULL, 'Выполнить тестовое задание', CURRENT_TIMESTAMP, '1', '', '2020-11-08', '1', '3');
INSERT INTO `tasks` (`id`, `taskName`, `taskDatetime`, `status`, `file`, `deadline`, `userId`, `projectId`) VALUES (NULL, 'Сделать задание первого раздела', CURRENT_TIMESTAMP, '1', '', '2020-11-08', '1', '2');
INSERT INTO `tasks` (`id`, `taskName`, `taskDatetime`, `status`, `file`, `deadline`, `userId`, `projectId`) VALUES (NULL, 'Встреча с другом', CURRENT_TIMESTAMP, '0', '', '2020-11-08', '1', '1');
INSERT INTO `tasks` (`id`, `taskName`, `taskDatetime`, `status`, `file`, `deadline`, `userId`, `projectId`) VALUES (NULL, 'Купить корм для кота', CURRENT_TIMESTAMP, '0', '', '2020-11-08', '2', '4');
INSERT INTO `tasks` (`id`, `taskName`, `taskDatetime`, `status`, `file`, `deadline`, `userId`, `projectId`) VALUES (NULL, 'Заказать пиццу', CURRENT_TIMESTAMP, '0', '', '2020-11-08', '2', '4');

-- получить список из всех проектов для одного пользователя
SELECT projects.projectName FROM projects WHERE projects.userId = 1;

-- получить список из всех задач для одного проекта;
SELECT tasks.taskName FROM tasks WHERE tasks.projectId = 3;

-- пометить задачу как выполненную;
UPDATE `tasks` SET `status`= 1 WHERE `id` = 6;

-- обновить название задачи по её идентификатору.
UPDATE `tasks` SET `taskName` = 'Заказать роллы' WHERE `tasks`.`id` = 6;