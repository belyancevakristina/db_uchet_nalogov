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
