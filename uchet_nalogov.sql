-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 05 2026 г., 18:52
-- Версия сервера: 10.11.16-MariaDB
-- Версия PHP: 8.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `uchet_nalogov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `check_statuses`
--

CREATE TABLE `check_statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  `status_opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `check_statuses`
--

INSERT INTO `check_statuses` (`status_id`, `status_name`, `status_opis`) VALUES
(1, 'Ожидает проверки', 'Данные загружены, проверка ещё не проводилась'),
(2, 'Проверено', 'Данные проверены, ошибок не выявлено'),
(3, 'Ошибка', 'Обнаружены ошибки, требующие исправления'),
(4, 'Требует уточнения', 'Данные требуют дополнительного уточнения у источника');

-- --------------------------------------------------------

--
-- Структура таблицы `indicators`
--

CREATE TABLE `indicators` (
  `indicator_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `tax_id` int(11) NOT NULL,
  `municipality_id` int(11) NOT NULL,
  `period_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `accrued_amount` decimal(18,2) NOT NULL,
  `received_amount` decimal(18,2) NOT NULL,
  `unit_of_measure` varchar(20) NOT NULL DEFAULT 'руб.',
  `load_date` date NOT NULL,
  `fns_form` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `indicators`
--

INSERT INTO `indicators` (`indicator_id`, `organization_id`, `tax_id`, `municipality_id`, `period_id`, `status_id`, `accrued_amount`, `received_amount`, `unit_of_measure`, `load_date`, `fns_form`) VALUES
(1, 1, 1, 1, 2, 2, 18500000000.00, 18200000000.00, 'руб.', '2025-03-15', '1-НМ'),
(2, 1, 1, 1, 3, 2, 15200000000.00, 14950000000.00, 'руб.', '2026-03-20', '1-НМ'),
(3, 2, 1, 1, 3, 2, 4200000000.00, 4150000000.00, 'руб.', '2026-03-20', '1-НМ'),
(4, 3, 1, 2, 2, 2, 9800000000.00, 9750000000.00, 'руб.', '2025-03-18', '1-НМ'),
(5, 3, 1, 2, 3, 2, 11200000000.00, 11150000000.00, 'руб.', '2026-03-22', '1-НМ'),
(6, 4, 1, 5, 3, 2, 1850000000.00, 1820000000.00, 'руб.', '2026-03-25', '1-НМ'),
(7, 5, 1, 8, 3, 2, 3100000000.00, 3080000000.00, 'руб.', '2026-03-28', '1-НМ'),
(8, 6, 1, 1, 3, 2, 980000000.00, 975000000.00, 'руб.', '2026-04-01', '1-НМ'),
(9, 1, 4, 1, 3, 2, 45000000000.00, 44800000000.00, 'руб.', '2026-03-20', '1-НМ'),
(10, 1, 5, 1, 3, 1, 1250000000.00, 1240000000.00, 'руб.', '2026-04-05', '1-НМ'),
(11, 3, 2, 2, 3, 2, 8500000000.00, 8400000000.00, 'руб.', '2026-03-22', '1-НМ'),
(12, 7, 1, 1, 3, 2, 720000000.00, 715000000.00, 'руб.', '2026-04-02', '1-НМ');

-- --------------------------------------------------------

--
-- Структура таблицы `municipalities`
--

CREATE TABLE `municipalities` (
  `municipality_id` int(11) NOT NULL,
  `oktmo_code` varchar(11) NOT NULL,
  `municipality_name` varchar(255) NOT NULL,
  `municipality_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `municipalities`
--

INSERT INTO `municipalities` (`municipality_id`, `oktmo_code`, `municipality_name`, `municipality_type`) VALUES
(1, '57701000', 'город Пермь', 'городской округ'),
(2, '57504000', 'Муниципальный округ «Город Березники»', 'городской округ'),
(3, '57550000', 'Соликамский муниципальный округ', 'муниципальный округ'),
(4, '57517000', 'Добрянский муниципальный округ', 'муниципальный округ'),
(5, '57531000', 'Краснокамский муниципальный округ', 'муниципальный округ'),
(6, '57530000', 'Кунгурский муниципальный округ', 'муниципальный округ'),
(7, '57532000', 'Лысьвенский муниципальный округ', 'муниципальный округ'),
(8, '57516000', 'Губахинский муниципальный округ', 'муниципальный округ'),
(9, '57546000', 'Пермский муниципальный округ', 'муниципальный округ'),
(10, '57514000', 'Горнозаводский муниципальный округ', 'муниципальный округ');

-- --------------------------------------------------------

--
-- Структура таблицы `organizations`
--

CREATE TABLE `organizations` (
  `organization_id` int(11) NOT NULL,
  `ogrn` varchar(13) NOT NULL,
  `inn` varchar(10) NOT NULL,
  `kpp` varchar(9) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `registr_date` date NOT NULL,
  `org_status` varchar(50) DEFAULT NULL CHECK (`org_status` in ('Действует','Ликвидирована')),
  `okved` int(11) NOT NULL,
  `municipality` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `organizations`
--

INSERT INTO `organizations` (`organization_id`, `ogrn`, `inn`, `kpp`, `org_name`, `registr_date`, `org_status`, `okved`, `municipality`) VALUES
(1, '1025901504165', '5902201970', '590201001', 'Общество с ограниченной ответственностью «ЛУКОЙЛ-ПЕРМЬ»', '2002-07-30', 'Действует', 1, 1),
(2, '1025901504736', '5905099475', '590501001', 'Общество с ограниченной ответственностью «ЛУКОЙЛ-ПЕРМНЕФТЕОРГСИНТЕЗ»', '1991-09-25', 'Действует', 3, 1),
(3, '1025901702188', '5911029807', '591101001', 'Публичное акционерное общество «Уралкалий»', '1992-10-14', 'Действует', 2, 2),
(4, '1025901702199', '5920000593', '592001001', 'Общество с ограниченной ответственностью «Газпром трансгаз Чайковский»', '1999-07-01', 'Действует', 9, 5),
(5, '1025901702205', '5913001268', '591301001', 'Акционерное общество «Метафракс Кемикалс»', '1993-03-15', 'Действует', 3, 8),
(6, '1025901504301', '5904123809', '590401001', 'Публичное акционерное общество «Пермэнергосбыт»', '2005-01-01', 'Действует', 5, 1),
(7, '1025901504412', '5902202276', '590201001', 'Акционерное общество «ЭР-Телеком Холдинг»', '2001-04-18', 'Действует', 10, 1),
(8, '1025901504523', '5948022406', '594801001', 'Общество с ограниченной ответственностью «Газпром межрегионгаз Пермь»', '2004-06-10', 'Действует', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `periods`
--

CREATE TABLE `periods` (
  `period_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `period_name` varchar(50) NOT NULL
) ;

--
-- Дамп данных таблицы `periods`
--

INSERT INTO `periods` (`period_id`, `start_date`, `end_date`, `period_name`) VALUES
(1, '2023-01-01', '2023-12-31', '2023 год'),
(2, '2024-01-01', '2024-12-31', '2024 год'),
(3, '2025-01-01', '2025-12-31', '2025 год'),
(4, '2025-01-01', '2025-03-31', 'I квартал 2025'),
(5, '2025-04-01', '2025-06-30', 'II квартал 2025'),
(6, '2025-07-01', '2025-09-30', 'III квартал 2025'),
(7, '2025-10-01', '2025-12-31', 'IV квартал 2025');

-- --------------------------------------------------------

--
-- Структура таблицы `taxes`
--

CREATE TABLE `taxes` (
  `tax_id` int(11) NOT NULL,
  `tax_code` varchar(20) NOT NULL,
  `tax_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `taxes`
--

INSERT INTO `taxes` (`tax_id`, `tax_code`, `tax_name`) VALUES
(1, 'NP', 'Налог на прибыль организаций'),
(2, 'NDS', 'Налог на добавленную стоимость'),
(3, 'NDFL', 'Налог на доходы физических лиц'),
(4, 'NDPI', 'Налог на добычу полезных ископаемых'),
(5, 'NIO', 'Налог на имущество организаций'),
(6, 'TN', 'Транспортный налог'),
(7, 'ZN', 'Земельный налог'),
(8, 'USN', 'Налог, взимаемый в связи с применением упрощённой системы налогообложения'),
(9, 'AKC', 'Акцизы');

-- --------------------------------------------------------

--
-- Структура таблицы `vidy_deyatelnosti`
--

CREATE TABLE `vidy_deyatelnosti` (
  `okved_id` int(11) NOT NULL,
  `okved_code` varchar(8) NOT NULL,
  `okved_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Дамп данных таблицы `vidy_deyatelnosti`
--

INSERT INTO `vidy_deyatelnosti` (`okved_id`, `okved_code`, `okved_name`) VALUES
(1, '06.10', 'Добыча сырой нефти и нефтяного (попутного) газа'),
(2, '20.13', 'Производство прочих основных неорганических химических веществ'),
(3, '20.14', 'Производство прочих основных органических химических веществ'),
(4, '24.10', 'Производство чугуна, стали и ферросплавов'),
(5, '35.11', 'Производство электроэнергии'),
(6, '41.20', 'Строительство жилых и нежилых зданий'),
(7, '46.71', 'Торговля оптовая твёрдым, жидким и газообразным топливом и подобными продуктами'),
(8, '47.11', 'Торговля розничная преимущественно пищевыми продуктами, включая напитки, и табачными изделиями в неспециализированных магазинах'),
(9, '49.50', 'Трубопроводный транспорт'),
(10, '62.01', 'Разработка компьютерного программного обеспечения'),
(11, '64.19', 'Денежное посредничество прочее'),
(12, '68.20', 'Аренда и управление собственным или арендованным недвижимым имуществом'),
(13, '86.10', 'Деятельность больничных организаций');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `v_org_tax_summary`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `v_org_tax_summary` (
`organization_id` int(11)
,`org_name` varchar(255)
,`inn` varchar(10)
,`org_status` varchar(50)
,`municipality_name` varchar(255)
,`okved_code` varchar(8)
,`okved_name` varchar(255)
,`indicators_count` bigint(21)
,`total_accrued` decimal(40,2)
,`total_received` decimal(40,2)
,`avg_received` decimal(19,2)
,`collection_pct` decimal(46,2)
);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `check_statuses`
--
ALTER TABLE `check_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Индексы таблицы `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`indicator_id`),
  ADD KEY `otnositsya_k` (`tax_id`),
  ADD KEY `uchit_v` (`municipality_id`),
  ADD KEY `formiruetsya_za` (`period_id`),
  ADD KEY `proveryaetsya_po` (`status_id`),
  ADD KEY `idx_ti_received` (`received_amount`),
  ADD KEY `idx_ti_org_tax` (`organization_id`,`tax_id`);

--
-- Индексы таблицы `municipalities`
--
ALTER TABLE `municipalities`
  ADD PRIMARY KEY (`municipality_id`);

--
-- Индексы таблицы `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`organization_id`),
  ADD KEY `opredelyaet` (`okved`),
  ADD KEY `raspolozhena_v` (`municipality`),
  ADD KEY `idx_org_status` (`org_status`);

--
-- Индексы таблицы `periods`
--
ALTER TABLE `periods`
  ADD PRIMARY KEY (`period_id`),
  ADD KEY `idx_periods_name` (`period_name`);

--
-- Индексы таблицы `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`tax_id`),
  ADD KEY `idx_taxes_code` (`tax_code`);

--
-- Индексы таблицы `vidy_deyatelnosti`
--
ALTER TABLE `vidy_deyatelnosti`
  ADD PRIMARY KEY (`okved_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `check_statuses`
--
ALTER TABLE `check_statuses`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `indicators`
--
ALTER TABLE `indicators`
  MODIFY `indicator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `municipalities`
--
ALTER TABLE `municipalities`
  MODIFY `municipality_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `organizations`
--
ALTER TABLE `organizations`
  MODIFY `organization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `periods`
--
ALTER TABLE `periods`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `taxes`
--
ALTER TABLE `taxes`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `vidy_deyatelnosti`
--
ALTER TABLE `vidy_deyatelnosti`
  MODIFY `okved_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

-- --------------------------------------------------------

--
-- Структура для представления `v_org_tax_summary`
--
DROP TABLE IF EXISTS `v_org_tax_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_org_tax_summary`  AS SELECT `o`.`organization_id` AS `organization_id`, `o`.`org_name` AS `org_name`, `o`.`inn` AS `inn`, `o`.`org_status` AS `org_status`, `m`.`municipality_name` AS `municipality_name`, `ok`.`okved_code` AS `okved_code`, `ok`.`okved_name` AS `okved_name`, count(`ti`.`indicator_id`) AS `indicators_count`, sum(`ti`.`accrued_amount`) AS `total_accrued`, sum(`ti`.`received_amount`) AS `total_received`, round(avg(`ti`.`received_amount`),2) AS `avg_received`, round(sum(`ti`.`received_amount`) / nullif(sum(`ti`.`accrued_amount`),0) * 100,2) AS `collection_pct` FROM (((`organizations` `o` left join `indicators` `ti` on(`o`.`organization_id` = `ti`.`organization_id`)) left join `municipalities` `m` on(`o`.`municipality` = `m`.`municipality_id`)) left join `vidy_deyatelnosti` `ok` on(`o`.`okved` = `ok`.`okved_id`)) GROUP BY `o`.`organization_id`, `o`.`org_name`, `o`.`inn`, `o`.`org_status`, `m`.`municipality_name`, `ok`.`okved_code`, `ok`.`okved_name` ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `formiruetsya_za` FOREIGN KEY (`period_id`) REFERENCES `periods` (`period_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `imeet_pokazateli` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`organization_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `otnositsya_k` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`tax_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proveryaetsya_po` FOREIGN KEY (`status_id`) REFERENCES `check_statuses` (`status_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `uchit_v` FOREIGN KEY (`municipality_id`) REFERENCES `municipalities` (`municipality_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `opredelyaet` FOREIGN KEY (`okved`) REFERENCES `vidy_deyatelnosti` (`okved_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `raspolozhena_v` FOREIGN KEY (`municipality`) REFERENCES `municipalities` (`municipality_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT
    o.org_name              AS 'Организация',
    o.inn                   AS 'ИНН',
    o.ogrn                  AS 'ОГРН',
    ok.okved_code           AS 'Код ОКВЭД',
    ok.okved_name           AS 'Вид деятельности',
    o.org_status            AS 'Статус'
FROM organizations o, vidy_deyatelnosti ok
WHERE o.okved = ok.okved_id
  AND o.org_status = 'Действует'
ORDER BY o.org_name;

SELECT
    o.org_name              AS 'Организация',
    t.tax_name              AS 'Налог',
    p.period_name           AS 'Период',
    ti.accrued_amount       AS 'Начислено',
    ti.received_amount      AS 'Поступило',
    ti.unit_of_measure      AS 'Ед.изм.'
FROM organizations o,
     indicators ti,
     taxes t,
     periods p
WHERE o.organization_id = ti.organization_id
  AND ti.tax_id = t.tax_id
  AND ti.period_id = p.period_id
  AND p.period_name = '2025 год'
  AND ti.received_amount > 1000000000
ORDER BY ti.received_amount DESC;

// организации с муниципалитетами
SELECT
    o.org_name                  AS 'Организация',
    o.inn                       AS 'ИНН',
    m.municipality_name         AS 'Муниципалитет',
    m.oktmo_code                AS 'ОКТМО',
    m.municipality_type         AS 'Тип'
FROM organizations o, municipalities m
WHERE o.municipality = m.municipality_id
  AND m.municipality_type = 'городской округ'
ORDER BY m.municipality_name, o.org_name; // фильтр: городские округа. сортировка: по названию муниципалитета, затем по организации


SELECT
    o.org_name              AS 'Организация',
    t.tax_name              AS 'Налог',
    m.municipality_name     AS 'Муниципалитет',
    p.period_name           AS 'Период',
    cs.status_name          AS 'Статус проверки',
    ti.accrued_amount       AS 'Начислено',
    ti.received_amount      AS 'Поступило',
    ti.load_date            AS 'Дата загрузки',
    ti.fns_form             AS 'Форма ФНС'
FROM indicators ti
INNER JOIN organizations o      ON ti.organization_id = o.organization_id
INNER JOIN taxes t              ON ti.tax_id = t.tax_id
INNER JOIN municipalities m     ON ti.municipality_id = m.municipality_id
INNER JOIN periods p            ON ti.period_id = p.period_id
INNER JOIN check_statuses cs    ON ti.status_id = cs.status_id
ORDER BY ti.received_amount DESC; // INNER JOIN: показатели с полными справочными данными


SELECT
    o.org_name              AS 'Организация',
    o.inn                   AS 'ИНН',
    t.tax_name              AS 'Налог',
    p.period_name           AS 'Период',
    ti.received_amount      AS 'Поступило'
FROM organizations o
LEFT JOIN indicators ti ON o.organization_id = ti.organization_id
LEFT JOIN taxes t           ON ti.tax_id = t.tax_id
LEFT JOIN periods p         ON ti.period_id = p.period_id
ORDER BY o.org_name, p.period_name; // LEFT JOIN: все организации и их показатели (если есть). показывает организации, даже если по ним еще нет показателей


SELECT
    o.org_name              AS 'Организация',
    o.inn                   AS 'ИНН',
    o.registr_date     AS 'Дата регистрации',
    ok.okved_code           AS 'Код ОКВЭД',
    ok.okved_name           AS 'Вид деятельности',
    m.municipality_name     AS 'Муниципалитет',
    m.municipality_type     AS 'Тип МО'
FROM organizations o
JOIN vidy_deyatelnosti ok               ON o.okved = ok.okved_id
JOIN municipalities m       ON o.municipality = m.municipality_id
ORDER BY m.municipality_name, o.org_name; // JOIN организаций с ОКВЭД и муниципалитетами


SELECT
    o.org_name              AS 'Организация',
    p.period_name           AS 'Период',
    ti.accrued_amount       AS 'Начислено',
    ti.received_amount      AS 'Поступило',
    (ti.accrued_amount - ti.received_amount) AS 'Разница (недоимка/переплата)'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
JOIN periods p       ON ti.period_id = p.period_id
WHERE t.tax_code = 'NP'
ORDER BY p.start_date, ti.received_amount DESC; // JOIN показателей только по налогу на прибыль


SELECT
    COUNT(*)                        AS 'Количество записей',
    SUM(accrued_amount)             AS 'Всего начислено',
    SUM(received_amount)            AS 'Всего поступило',
    AVG(received_amount)            AS 'Средняя сумма поступлений',
    MAX(received_amount)            AS 'Максимальное поступление',
    MIN(received_amount)            AS 'Минимальное поступление'
FROM indicators; // общая сумма начислений и поступлений по всей базе


SELECT
    SUM(ti.received_amount)         AS 'Сумма поступлений по НП за 2025',
    COUNT(*)                        AS 'Количество организаций',
    AVG(ti.received_amount)         AS 'Среднее поступление',
    MAX(ti.received_amount)         AS 'Максимум',
    MIN(ti.received_amount)         AS 'Минимум'
FROM indicators ti
JOIN taxes t     ON ti.tax_id = t.tax_id
JOIN periods p   ON ti.period_id = p.period_id
WHERE t.tax_code = 'NP'
  AND p.period_name = '2025 год'; // сумма поступлений по налогу на прибыль за 2025 год


SELECT
    ok.okved_code                   AS 'Код ОКВЭД',
    ok.okved_name                   AS 'Вид деятельности',
    COUNT(o.organization_id)        AS 'Количество организаций'
FROM vidy_deyatelnosti ok
LEFT JOIN organizations o ON ok.okved_id = o.okved
GROUP BY ok.okved_id, ok.okved_code, ok.okved_name
ORDER BY COUNT(o.organization_id) DESC; // количество организаций по видам деятельности


SELECT
    t.tax_name                      AS 'Налог',
    MAX(ti.received_amount)         AS 'Макс. поступление',
    MIN(ti.received_amount)         AS 'Мин. поступление',
    AVG(ti.received_amount)         AS 'Среднее поступление'
FROM indicators ti
JOIN taxes t ON ti.tax_id = t.tax_id
GROUP BY t.tax_id, t.tax_name
ORDER BY MAX(ti.received_amount) DESC; // максимальная и минимальная сумма постпулений по каждому налогу


// сумма поступлений по каждой организации (все периоды и налоги)
SELECT
    o.org_name                      AS 'Организация',
    o.inn                           AS 'ИНН',
    COUNT(ti.indicator_id)          AS 'Кол-во показателей',
    SUM(ti.accrued_amount)          AS 'Всего начислено',
    SUM(ti.received_amount)         AS 'Всего поступило'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
GROUP BY o.organization_id, o.org_name, o.inn
HAVING SUM(ti.received_amount) > 1000000000
ORDER BY SUM(ti.received_amount) DESC; // HAVING: только те, у кого сумма поступлений > 1 млрд руб.


// поступления по видам деятельности за 2025 год
SELECT
    t.tax_name                      AS 'Налог',
    t.tax_code                      AS 'Код',
    COUNT(*)                        AS 'Кол-во записей',
    SUM(ti.received_amount)         AS 'Сумма поступлений',
    AVG(ti.received_amount)         AS 'Среднее'
FROM indicators ti
JOIN taxes t     ON ti.tax_id = t.tax_id
JOIN periods p   ON ti.period_id = p.period_id
WHERE p.period_name = '2025 год'
GROUP BY t.tax_id, t.tax_name, t.tax_code
HAVING SUM(ti.received_amount) > 500000000
ORDER BY SUM(ti.received_amount) DESC; // HAVING: налоги, по которым суммарно поступило больше  500 млн


// постпуления по муниципальным образованиям
SELECT
    m.municipality_name             AS 'Муниципалитет',
    m.municipality_type             AS 'Тип',
    COUNT(ti.indicator_id)          AS 'Кол-во показателей',
    SUM(ti.received_amount)         AS 'Сумма поступлений',
    MAX(ti.received_amount)         AS 'Макс. поступление'
FROM indicators ti
JOIN municipalities m ON ti.municipality_id = m.municipality_id
GROUP BY m.municipality_id, m.municipality_name, m.municipality_type
HAVING COUNT(ti.indicator_id) >= 2
ORDER BY SUM(ti.received_amount) DESC; // HAVING: муниципалиетты, где есть хотя бы 2 показаетля


// динамика поступлений налога на прибыль по годам (сравнение 2024 и 2025)
SELECT
    p.period_name                   AS 'Период',
    COUNT(DISTINCT ti.organization_id) AS 'Кол-во организаций',
    SUM(ti.accrued_amount)          AS 'Начислено',
    SUM(ti.received_amount)         AS 'Поступило',
    ROUND(SUM(ti.received_amount) / SUM(ti.accrued_amount) * 100, 2) AS 'Процент сбора, %'
FROM indicators ti
JOIN taxes t     ON ti.tax_id = t.tax_id
JOIN periods p   ON ti.period_id = p.period_id
WHERE t.tax_code = 'NP'
  AND p.period_name IN ('2024 год', '2025 год')
GROUP BY p.period_id, p.period_name
ORDER BY p.period_name;


// организации, у которых среднее поступление превышает 2 млрд
SELECT
    o.org_name                      AS 'Организация',
    COUNT(*)                        AS 'Кол-во показателей',
    ROUND(AVG(ti.received_amount), 2) AS 'Среднее поступление',
    SUM(ti.received_amount)         AS 'Всего поступило'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
GROUP BY o.organization_id, o.org_name
HAVING AVG(ti.received_amount) > 2000000000
ORDER BY AVG(ti.received_amount) DESC;


// сводка: потспуления по ОКВЭД и налогам
SELECT
    ok.okved_code                   AS 'Код ОКВЭД',
    ok.okved_name                   AS 'Вид деятельности',
    t.tax_name                      AS 'Налог',
    COUNT(*)                        AS 'Кол-во',
    SUM(ti.received_amount)         AS 'Сумма поступлений'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN vidy_deyatelnosti ok        ON o.okved = ok.okved_id
JOIN taxes t         ON ti.tax_id = t.tax_id
GROUP BY ok.okved_id, ok.okved_code, ok.okved_name, t.tax_id, t.tax_name
HAVING SUM(ti.received_amount) > 0
ORDER BY ok.okved_code, SUM(ti.received_amount) DESC;

ВЛОЖЕННЫЕ ПОДЗАПРОСЫ (ОПЕРАТОРЫ IN И ALL)

// организации, у которых есть показатели по налогу на прибыль (IN)
SELECT
    o.org_name              AS 'Организация',
    o.inn                   AS 'ИНН',
    o.org_status            AS 'Статус'
FROM organizations o
WHERE o.organization_id IN (
    SELECT ti.organization_id
    FROM indicators ti
    JOIN taxes t ON ti.tax_id = t.tax_id
    WHERE t.tax_code = 'NP'
)
ORDER BY o.org_name;


SELECT
    o.org_name              AS 'Организация',
    o.inn                   AS 'ИНН'
FROM organizations o
WHERE o.organization_id NOT IN (
    SELECT ti.organization_id
    FROM indicators ti
    JOIN taxes t ON ti.tax_id = t.tax_id
    WHERE t.tax_code = 'NDPI'
)
ORDER BY o.org_name;


// показатели, сумма поступлений которых больше всех поступлений по транспортному налогу (оператор ALL)
SELECT
    o.org_name              AS 'Организация',
    t.tax_name              AS 'Налог',
    ti.received_amount      AS 'Поступило'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
WHERE ti.received_amount > ALL (
    SELECT ti2.received_amount
    FROM indicators ti2
    JOIN taxes t2 ON ti2.tax_id = t2.tax_id
    WHERE t2.tax_code = 'TN'
)
ORDER BY ti.received_amount DESC;


// организации с поступлением выше среднего по всей базе (скалярный подзапрос)
SELECT
    o.org_name              AS 'Организация',
    t.tax_name              AS 'Налог',
    p.period_name           AS 'Период',
    ti.received_amount      AS 'Поступило'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
JOIN periods p       ON ti.period_id = p.period_id
WHERE ti.received_amount > (
    SELECT AVG(received_amount)
    FROM indicators
)
ORDER BY ti.received_amount DESC;


// муниципалитеты, в которых есть организации с показателями за 2025 год (подзапрос в WHERE с EXISTS)
SELECT
    m.municipality_name     AS 'Муниципалитет',
    m.oktmo_code            AS 'ОКТМО'
FROM municipalities m
WHERE EXISTS (
    SELECT 1
    FROM organizations o
    JOIN indicators ti ON o.organization_id = ti.organization_id
    JOIN periods p ON ti.period_id = p.period_id
    WHERE o.municipality = m.municipality_id
      AND p.period_name = '2025 год'
)
ORDER BY m.municipality_name;


// организации, чиь поступления по НП за 2025 больше, чем у всех организаций по НП за 2024 (ALL)
SELECT
    o.org_name              AS 'Организация',
    ti.received_amount      AS 'Поступило в 2025'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
JOIN periods p       ON ti.period_id = p.period_id
WHERE t.tax_code = 'NP'
  AND p.period_name = '2025 год'
  AND ti.received_amount > ALL (
      SELECT ti2.received_amount
      FROM indicators ti2
      JOIN taxes t2   ON ti2.tax_id = t2.tax_id
      JOIN periods p2 ON ti2.period_id = p2.period_id
      WHERE t2.tax_code = 'NP'
        AND p2.period_name = '2024 год'
  );

ФУНКЦИИ УПРАВЛЕНИЯ ПОТОКОМ (IF, CASE)

// CASE: оценка уровня поступлений
SELECT
    o.org_name              AS 'Организация',
    t.tax_name              AS 'Налог',
    ti.received_amount      AS 'Поступило',
    CASE
        WHEN ti.received_amount >= 10000000000 THEN 'Очень крупные'
        WHEN ti.received_amount >= 1000000000  THEN 'Крупные'
        WHEN ti.received_amount >= 100000000   THEN 'Средние'
        ELSE 'Небольшие'
    END                     AS 'Категория поступлений'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
ORDER BY ti.received_amount DESC;


// CASE: статус собираемости (начислено/поступило)
SELECT
    o.org_name              AS 'Организация',
    t.tax_name              AS 'Налог',
    p.period_name           AS 'Период',
    ti.accrued_amount       AS 'Начислено',
    ti.received_amount      AS 'Поступило',
    CASE
        WHEN ti.received_amount >= ti.accrued_amount THEN 'Полная оплата'
        WHEN ti.received_amount >= ti.accrued_amount * 0.95 THEN 'Почти полная'
        WHEN ti.received_amount >= ti.accrued_amount * 0.80 THEN 'Частичная оплата'
        ELSE 'Значительная недоимка'
    END                     AS 'Статус оплаты',
    ROUND(
        (ti.received_amount / ti.accrued_amount) * 100, 2
    )                       AS 'Процент сбора, %'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
JOIN periods p       ON ti.period_id = p.period_id
ORDER BY (ti.received_amount / ti.accrued_amount);


// IF: признак крупного налогоплательщика
SELECT
    o.org_name              AS 'Организация',
    o.inn                   AS 'ИНН',
    SUM(ti.received_amount) AS 'Всего поступило',
    IF(SUM(ti.received_amount) > 5000000000,
       'Крупный налогоплательщик',
       'Обычный налогоплательщик'
    )                       AS 'Категория'
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
GROUP BY o.organization_id, o.org_name, o.inn
ORDER BY SUM(ti.received_amount) DESC;


// CASE+группировка: распределение показателей по статусам проверки
SELECT
    CASE cs.status_name
        WHEN 'Проверено'         THEN 'Готово к отчётности'
        WHEN 'Ожидает проверки'  THEN 'Требует проверки'
        WHEN 'Ошибка'            THEN 'Требует исправления'
        WHEN 'Требует уточнения' THEN 'Требует уточнения'
        ELSE 'Неизвестный статус'
    END                     AS 'Действие',
    COUNT(*)                AS 'Количество показателей',
    SUM(ti.received_amount) AS 'Сумма поступлений'
FROM indicators ti
JOIN check_statuses cs ON ti.status_id = cs.status_id
GROUP BY cs.status_name
ORDER BY COUNT(*) DESC;

ПРЕДСТАВЛЕНИЯ (CREATE VIEW) И ВРЕМЕННЫЕ ПРЕДСТАВЛЕНИЯ (WITH)

// сводка поступлений по организациям (наиболее востребованный аналитический запрос)
CREATE OR REPLACE VIEW v_org_tax_summary AS
SELECT
    o.organization_id,
    o.org_name,
    o.inn,
    o.org_status,
    m.municipality_name,
    ok.okved_code,
    ok.okved_name,
    COUNT(ti.indicator_id)          AS indicators_count,
    SUM(ti.accrued_amount)          AS total_accrued,
    SUM(ti.received_amount)         AS total_received,
    ROUND(AVG(ti.received_amount), 2) AS avg_received,
    ROUND(
        SUM(ti.received_amount) / NULLIF(SUM(ti.accrued_amount), 0) * 100, 2
    )                               AS collection_pct
FROM organizations o
LEFT JOIN indicators ti ON o.organization_id = ti.organization_id
LEFT JOIN municipalities m  ON o.municipality = m.municipality_id
LEFT JOIN vidy_deyatelnosti ok ON o.okved = ok.okved_id
GROUP BY
    o.organization_id, o.org_name, o.inn, o.org_status,
    m.municipality_name, ok.okved_code, ok.okved_name;

SELECT
    org_name            AS 'Организация',
    inn                 AS 'ИНН',
    municipality_name   AS 'Муниципалитет',
    total_received      AS 'Всего поступило',
    collection_pct      AS 'Процент сбора, %'
FROM v_org_tax_summary
WHERE total_received IS NOT NULL
ORDER BY total_received DESC; // использование представления


// временное представление (CTE): оператор WITH. топ организаций по поступлениям за 2025 год и их доля
WITH tax_2025 AS (
    SELECT
        o.organization_id,
        o.org_name,
        o.inn,
        SUM(ti.received_amount) AS total_2025
    FROM indicators ti
    JOIN organizations o ON ti.organization_id = o.organization_id
    JOIN periods p       ON ti.period_id = p.period_id
    WHERE p.period_name = '2025 год'
    GROUP BY o.organization_id, o.org_name, o.inn
),
grand_total AS (
    SELECT SUM(total_2025) AS overall FROM tax_2025
)
SELECT
    t.org_name                              AS 'Организация',
    t.inn                                   AS 'ИНН',
    t.total_2025                            AS 'Поступило за 2025',
    ROUND(t.total_2025 / g.overall * 100, 2) AS 'Доля, %'
FROM tax_2025 t
CROSS JOIN grand_total g
ORDER BY t.total_2025 DESC;


// WTH: сравнение поступлений за 2024 и 2025 по организациям
WITH np_by_year AS (
    SELECT
        o.organization_id,
        o.org_name,
        p.period_name,
        SUM(ti.received_amount) AS received
    FROM indicators ti
    JOIN organizations o ON ti.organization_id = o.organization_id
    JOIN taxes t         ON ti.tax_id = t.tax_id
    JOIN periods p       ON ti.period_id = p.period_id
    WHERE t.tax_code = 'NP'
      AND p.period_name IN ('2024 год', '2025 год')
    GROUP BY o.organization_id, o.org_name, p.period_name
)
SELECT
    y24.org_name            AS 'Организация',
    y24.received            AS 'НП 2024',
    y25.received            AS 'НП 2025',
    ROUND(
        (y25.received - y24.received) / NULLIF(y24.received, 0) * 100, 2
    )                       AS 'Изменение, %'
FROM np_by_year y24
JOIN np_by_year y25
    ON y24.organization_id = y25.organization_id
WHERE y24.period_name = '2024 год'
  AND y25.period_name = '2025 год'
ORDER BY (y25.received - y24.received) DESC;

АНАЛИЗ И ОПТИМИЗАЦИЯ (EXPLAIN + CREATE INDEX)

// анализ запроса до создания индексов
EXPLAIN
SELECT
    o.org_name,
    t.tax_name,
    ti.received_amount
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
WHERE ti.received_amount > 1000000000
  AND t.tax_code = 'NP'
ORDER BY ti.received_amount DESC;


// создание индексов для ускорения частых запросов
CREATE INDEX idx_ti_received ON indicators (received_amount);
CREATE INDEX idx_taxes_code ON taxes (tax_code);
CREATE INDEX idx_periods_name ON periods (period_name);
CREATE INDEX idx_ti_org_tax ON indicators (organization_id, tax_id);
CREATE INDEX idx_org_status ON organizations (org_status);


// анализ того же запроса после создания индексов
EXPLAIN
SELECT
    o.org_name,
    t.tax_name,
    ti.received_amount
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
JOIN taxes t         ON ti.tax_id = t.tax_id
WHERE ti.received_amount > 1000000000
  AND t.tax_code = 'NP'
ORDER BY ti.received_amount DESC;


// анализ запроса с группировкой
EXPLAIN
SELECT
    o.org_name,
    SUM(ti.received_amount) AS total
FROM indicators ti
JOIN organizations o ON ti.organization_id = o.organization_id
GROUP BY o.organization_id, o.org_name
HAVING SUM(ti.received_amount) > 1000000000;
