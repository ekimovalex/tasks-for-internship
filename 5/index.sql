-- Создал базу данных trainig
CREATE DATABASE trainig                       

-- Создал таблицу Trainee
CREATE TABLE `training`.`trainee` (
    `trainee_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL COMMENT 'Name of trainee.',
    `Email` VARCHAR(255) NOT NULL COMMENT 'Email of trainee.',
    PRIMARY KEY (`trainee_id`))

-- Создал таблицу Course
CREATE TABLE `training`.`course` (
    `course_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(255) NOT NULL COMMENT 'Name of course.',
    `description` VARCHAR(255) NOT NULL COMMENT 'Description of course.',
    PRIMARY KEY (`course_id`))

-- Создал таблицу History
CREATE TABLE `training`.`history` (
    `history_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
    `trainee_idd` INT(10) UNSIGNED NOT NULL COMMENT 'Trainee ID',
    `course_id` INT(10) UNSIGNED NOT NULL COMMENT 'Course ID',
    `start` INT(11) NOT NULL COMMENT 'Timestamp for when course was started.',
    `end` INT(11) NOT NULL COMMENT 'Timestamp for when course was finished.',
    `status` TINYINT(4) NOT NULL COMMENT 'Whether the course was passed(1) or not(0).',
    PRIMARY KEY (`history_id`))

-- Добавляю данные в таблицу Trainee
INSERT INTO `training`.`trainee` (name, email) 
	VALUES 
    ('Stark', 'stark@mail.com'),
    ('Thor', 'thor@mail.com'),
    ('Hulk', 'hulk@mail.com'),
    ('Starlord', 'starlord@mail.com'),
    ('Thanos', 'thanos@mail.com'),
    ('Spider man', 'spider@mail.com'),
    ('Cap.America', 'cap.america@mail.com'),
    ('Vision', 'vision@mail.com'),
    ('Scarlet Witch', 'witch@mail.com'),
    ('Black Panther', 'panther@mail.com'),
    ('Rocket', 'rocket@mail.com'),
    ('Doctor Strange', 'strange@mail.com');

    

-- Добавляю данные в таблицу Сourse
    INSERT INTO `training`.`course` (name, description) 
	VALUES 
    ('Initial php level', 'This course examines the syntax of the php language'),
    ('Middle php level', 'This course examines the types of php variables'),
    ('High php level', 'This course examines the functions of the php language');

-- Добавляю данные в таблицу History
INSERT INTO `training`.`history` (`trainee_id`, `course_id`, `start`, `end`, `status`)
    VALUES
    ('1', '1', DATE('2021-05-01'), DATE('2021-05-30'), '1'),
    ('2', '2', DATE('2021-07-01'), DATE('2021-07-30'), '1'),
    ('3', '3', DATE('2021-07-01'), DATE('2021-07-30'), '1'),
    ('4', '3', DATE('2021-05-01'), DATE('2021-05-30'), '0'),
    ('5', '2', DATE('2021-06-01'), DATE('2021-06-30'), '1'),
    ('6', '1', DATE('2021-07-01'), DATE('2021-07-30'), '1'),
    ('7', '3', DATE('2021-06-01'), DATE('2021-06-30'), '1'),
    ('8', '2', DATE('2021-07-01'), DATE('2021-07-30'), '0'),
    ('9', '1', DATE('2021-07-01'), DATE('2021-07-30'), '1'),
    ('10', '1', DATE('2021-06-01'), DATE('2021-06-30'), '0'),
    ('11', '2', DATE('2021-07-01'), DATE('2021-07-30'), '1'),
    ('12', '3', DATE('2021-05-01'), DATE('2021-05-30'), '1');
   

-- Изменил тип данных в start и end на date
ALTER TABLE `history` CHANGE `start` `start` DATE NOT NULL COMMENT 'Timestamp for when course was started.';
ALTER TABLE `history` CHANGE `end` `end` DATE NOT NULL COMMENT 'Timestamp for when course was finished.';

-- Изменил название столбца в таблице history  с trainee_id на trainee_idd, потому что они пересекались с таблицой trainee, тоже самое для course_id
ALTER TABLE `history` CHANGE `trainee_id` `trainee_idd` INT UNSIGNED NOT NULL COMMENT 'Trainee ID';
ALTER TABLE `history` CHANGE `course_id` `course_idd` INT UNSIGNED NOT NULL COMMENT 'Course ID';


-- Вывести список стажеров, которые успешно прошли курс php в прошлом месяце
SELECT trainee.Name, trainee.Email, history.course_idd, history.end, history.status FROM trainee JOIN history ON trainee_id = trainee_idd
WHERE history.end = '2021-06-30' AND history.status = '1';

-- Вывести количество успешных прохождений в текущем месяце по всем курсам
SELECT course.course_id, course.Name, s.sum_status FROM course INNER JOIN (SELECT `course_idd`, sum(`status`) sum_status 
FROM `history` WHERE history.start = '2021-07-01' GROUP BY  `course_idd`) s  ON course_id = course_idd;






