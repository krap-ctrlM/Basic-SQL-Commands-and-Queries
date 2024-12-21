-- Создание таблицы направлений
CREATE TABLE napr (
    shifr_napr char(30) PRIMARY KEY NOT null, -- Шифр направления, основной ключ
    name_napr char(30) not null -- Название направления
);

-- Создание таблицы связей между дисциплинами, группами, отделами и семестрами
CREATE TABLE SVYAZI (
    id int AUTO_INCREMENT PRIMARY KEY NOT null, -- Уникальный идентификатор
    disc_1 int NOT NULL, -- ID дисциплины
    CONSTRAINT SV1 FOREIGN KEY (disc_1) REFERENCES disc_ (disc_),
    group_1 int NOT NULL, -- ID группы
    CONSTRAINT SV2 FOREIGN KEY (group_1) REFERENCES group_ (group_),
    otdel_1 int NOT NULL, -- ID отдела
    CONSTRAINT SV3 FOREIGN KEY (otdel_1) REFERENCES otdel_ (otdel_),
    sem_1 int NOT NULL, -- ID семестра
    CONSTRAINT SV4 FOREIGN KEY (sem_1) REFERENCES sem_ (sem_)
);

-- Вставка данных в таблицу дисциплин
INSERT INTO disc_ VALUES 
    (1, 4399, 'СПО', 14, 14),
    (2, 9766, 'БД', 14, 14),
    (3, 1573, 'Физика', 6, 6),
    (4, 6544, 'Философия', 6, 6);

-- Вставка данных в таблицу групп
INSERT INTO group_ VALUES 
    (1, 'БСБО-09-20', 25), 
    (2, 'БСБО-10-20', 27), 
    (3, 'БСБО-11-20', 31);

-- Вставка данных в таблицу отделов
INSERT INTO otdel_ VALUES 
    (1, 232, 'информационные технологии'), 
    (2, 343, 'ИИ'), 
    (3, 565, 'радиотехники');

-- Вставка данных в таблицу семестров
INSERT INTO sem_ VALUES 
    (1, 1, 'осенний'), 
    (2, 2, 'летний');

-- Запрос: Подсчет суммарных лекционных часов для каждого семестра
SELECT nomer_sem, SUM(lek_disc) 
FROM sem_, disc_ 
GROUP BY sem_;

-- Запрос: Максимальные значения дисциплин по семестрам
SELECT nomer_sem, MAX(disc_) 
FROM sem_, disc_ 
GROUP BY sem_;

-- Запрос: Подсчет количества дисциплин
SELECT COUNT(*) 
FROM disc_;

-- Запрос: Подсчет дисциплин в конкретном семестре
SELECT nomer_sem, COUNT(*) 
FROM sem_, svyazi 
WHERE sem_1 = 1 
GROUP BY sem_;

-- Процедура: Обновление шифра группы при условии численности
DELIMITER //
CREATE PROCEDURE proc1111 (
    IN new_shifr char(30), -- Новый шифр группы
    IN n int -- Условие по численности
)
BEGIN
    UPDATE group_
    SET shifr_group = new_shifr
    WHERE chislenost_group < n;
END//
CALL proc1111('МАЛО ЧЕЛОВЕК', 26);

-- Процедура: Обновление часов дисциплин
DELIMITER //
CREATE PROCEDURE proc3333 (
    IN new_lek double, -- Новые лекционные часы
    IN new_prak double -- Новые практические часы
)
BEGIN
    UPDATE disc_
    SET proc_lek = lek_disc * proc_lek,
        proc_prak = prak_disc * proc_prak,
        lek_disc = lek_disc + proc_lek,
        prak_disc = prak_disc + proc_prak
    WHERE lek_disc + prak_disc < s;
END//
CALL proc3333(100, 100);

-- Процедура: Добавление новой дисциплины
DELIMITER //
CREATE PROCEDURE proc7777 (
    IN new_disc int, -- ID новой дисциплины
    IN new_shifr int, -- Шифр дисциплины
    IN new_name char(30), -- Название дисциплины
    IN new_lek int, -- Лекционные часы
    IN new_prak int -- Практические часы
)
BEGIN
    INSERT INTO disc_
    VALUES (new_disc, new_shifr, new_name, new_lek, new_prak);
END//
CALL proc7777(5, 3434, 'русский язык', 10, 10);

-- Триггер: Проверка численности перед обновлением группы
DELIMITER $$
CREATE TRIGGER tr1
BEFORE UPDATE ON group_
FOR EACH ROW 
BEGIN
    DECLARE msg VARCHAR(128);
    IF NEW.chislenost_group < 10 THEN
        SET msg = 'Численность группы слишком мала';
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
    END IF;
END $$

-- Пример обновления численности группы
UPDATE group_ 
SET chislenost_group = 5;


