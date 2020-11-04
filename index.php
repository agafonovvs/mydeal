<?php

// установка соединения с базой данных
$link = mysqli_connect("localhost", "root", "root", "mydeal");

if ($link == false){
    print("Ошибка: Невозможно подключиться к MySQL " . mysqli_connect_error());
}
else {
    print("Соединение установлено успешно");
}



// установка кодировки
//mysqli_set_charset($con, "utf8");


// получение списка проектов текущего пользователя
$sql = 'SELECT * FROM `users` WHERE `name` = "Константин"';
$result = mysqli_query($link, $sql);

$users = mysqli_fetch_all($result, MYSQLI_ASSOC);
$userID = $users[0]['id'];

$sql = 'SELECT `projectName` FROM `projects` WHERE `userId` = '.$userID;
$result = mysqli_query($link, $sql);

$userProjects = mysqli_fetch_all($result, MYSQLI_ASSOC);



// получение всех задач у текущего пользователя
$sql = 'SELECT * FROM `tasks` WHERE `userId` = '.$userID;
$result = mysqli_query($link, $sql);
$userTasks = mysqli_fetch_all($result, MYSQLI_ASSOC);








include_once('./helpers.php'); //подключаю файл с функцией

// показывать или нет выполненные задачи
$show_complete_tasks = rand(0, 1);

// массив для списка проектов
$projects = ['Входящие', 'Учеба', 'Работа', 'Домашние дела', 'Авто'];

// массив для списка задач
$tasks = [
    [
        'taskName' => 'Собеседование в IT компании',
        'taskDate' => '28.10.2020',
        'taskCategory' => 'Работа',
        'taskComplete' => false,
    ],
    [
        'taskName' => 'Выполнить тестовое задание',
        'taskDate' => '25.12.2019',
        'taskCategory' => 'Работа',
        'taskComplete' => true,
    ],
    [
        'taskName' => 'Сделать задание первого раздела',
        'taskDate' => '21.12.2019',
        'taskCategory' => 'Учеба',
        'taskComplete' => true,
    ],
    [
        'taskName' => 'Встреча с другом',
        'taskDate' => '22.12.2019',
        'taskCategory' => 'Входящие',
        'taskComplete' => false,
    ],
    [
        'taskName' => 'Купить корм для кота',
        'taskDate' => null,
        'taskCategory' => 'Домашние дела',
        'taskComplete' => false,
    ],
    [
        'taskName' => 'Заказать пиццу',
        'taskDate' => null,
        'taskCategory' => 'Домашние дела',
        'taskComplete' => false,
    ]
];

// функция для подсчета количества задач в проекте
function tasksCount ($tasks, $project) {
    $tasksCount = 0;
    foreach ($tasks as $key => $value) {
        if ($value['taskCategory'] == $project) {
            $tasksCount++;
        }
    }
    return $tasksCount;
}

$templates = [
    'tasks' => $tasks,
    'projects' => $projects,
    'show_complete_tasks' => $show_complete_tasks,
    'userProjects' => $userProjects,
    'userTasks' => $userTasks
];

$pageContent = include_template('main.php', $templates);

$dataPages = [
    'pageContent' => $pageContent,
    'pageName' => 'Дела в порядке'
];

print (include_template('layout.php', $dataPages));

?>